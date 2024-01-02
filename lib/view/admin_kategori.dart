import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../insert/insert_detail_kategori.dart';
import '../insert/insert_kategori.dart';
import '../main.dart';
import '../update/update_kategori.dart';
import 'admin_detail_kategori.dart';

class kategori_admin extends StatefulWidget {
  const kategori_admin({super.key});

  @override
  State<kategori_admin> createState() => _kategori_adminState();
}

class _kategori_adminState extends State<kategori_admin> {
  List userdata = [];
  TextEditingController caption = TextEditingController();

  File? imagepath;
  String? imagename;
  String? imagedata;

  ImagePicker imagePicker = new ImagePicker();
  Future<void> delrecord(String id) async {
    String uri =
        "http://10.0.2.2/study_flutter/kategori/delete_data_kategori.php";
    try {
      final res = await http.post(Uri.parse(uri), body: {"id": id});
      var respon = jsonDecode(res.body);
      if (respon["success"] == "true") {
        print("Record Deleted");
        getrecord();
      } else {
        print("some issue");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getrecord() async {
    String uri =
        "http://10.0.2.2/study_flutter/kategori/view_data_kategori.php";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadImage() async {
    if (caption.text != "") {
      try {
        String uri =
            "http://10.0.2.2/study_flutter/kategori/insert_kategori.php";
        var res = await http.post(Uri.parse(uri), body: {
          "caption": caption.text,
          "data": imagedata,
          "name": imagename,
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Record Inserted");
          caption.text = "";
        } else {
          print("some issue");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("please fill all fields");
    }
  }

  Future<void> getImage() async {
    var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagepath = File(getimage!.path);
      imagename = getimage.path.split('/').last;
      imagedata = base64Encode(imagepath!.readAsBytesSync());
      print(imagepath);
      print(imagedata);
      print(imagename);
    });
  }

  @override
  void initState() {
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data Kategori"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: userdata.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                onTap: () {
                  getrecord();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => view_detail_kategori(
                                userdata[index]["id_kategori"].toString(),
                                userdata[index]["nama_kategori"],
                              )));
                },
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    getrecord();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => update_kategori(
                                  userdata[index]["id_kategori"].toString(),
                                  userdata[index]["nama_kategori"],
                                )));
                  },
                ),
                title: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Image.network(
                    "http://10.0.2.2/study_flutter/kategori/" +
                        userdata[index]["foto_kategori"],
                    width: size.width,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Text(
                      'ID: ' +
                          userdata[index]["id_kategori"].toString() +
                          " " +
                          userdata[index]["nama_kategori"],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Delete'),
                      content: const Text('Apakah ingin Hapus Data ini?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            getrecord();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            delrecord(userdata[index]["id_kategori"]);
                            getrecord();
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => insertkategori()));

          /*showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: const Text("Insert Data Kategori"),
                  scrollable: true,
                  content: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        child: TextFormField(
                          controller: caption,
                          decoration: InputDecoration(border: OutlineInputBorder(),
                              label: Text('Enter Nama Kategori')),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.center,
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: imagepath != null
                            ? Image.file(imagepath!)
                            : Text('Image Not Chose Yet', style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),),
                      ),
                      ElevatedButton(onPressed: (){
                        getImage();
                      }, child: Text('Chose Image')),
                    ],
                  ),
                  actions: [
                    ElevatedButton(onPressed: (){
                      setState(() {
                        uploadImage();
                      });
                    }, child: Text('Upload')),
                  ],
                );
              }
          );*/
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
