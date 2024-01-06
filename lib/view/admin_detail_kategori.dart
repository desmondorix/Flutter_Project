import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:marbel/pages/admin_page.dart';
import 'package:marbel/view/admin_kategori.dart';
import '../update/update_detail_kategori.dart';
import 'dart:io';
import '../insert/insert_detail_kategori.dart';
import '../main.dart';
import 'admin_detail_perid.dart';

class view_detail_kategori extends StatefulWidget {
  String id_kategori;
  String nama_kategori;

  view_detail_kategori(this.id_kategori, this.nama_kategori);

  @override
  State<view_detail_kategori> createState() => _view_detail_kategoriState();
}

class _view_detail_kategoriState extends State<view_detail_kategori> {
  TextEditingController nama_kategori = TextEditingController();
  TextEditingController caption = TextEditingController();
  TextEditingController asal_daerah = TextEditingController();
  TextEditingController detail_daerah = TextEditingController();

  List userdata = [];

  File? imagepath;
  String? imagename;
  String? imagedata;
  ImagePicker imagePicker = new ImagePicker();

  late String id_kategori;
  Future<void> getrecord() async {
    String uri =
        "http://10.0.2.2/study_flutter/detail_kategori/view_data_detail.php?id=$id_kategori";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delrecord(String id) async {
    String uri =
        "http://10.0.2.2/study_flutter/detail_kategori/delete_data_detail_kategori.php";
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

  Future<void> uploadImage() async {
    if (caption.text != "") {
      try {
        String uri =
            "http://10.0.2.2/study_flutter/detail_kategori/insert_detail_kategori.php";
        var res = await http.post(Uri.parse(uri), body: {
          "caption": caption.text,
          "data": imagedata,
          "name": imagename,
          "asal_daerah": asal_daerah.text,
          "id_kategori": id_kategori,
          "detail_daerah": detail_daerah.text,
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Record Inserted");
          caption.text = "";
          asal_daerah.text = "";
          detail_daerah.text = "";
          imagedata;
          imagename;
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
    id_kategori = widget.id_kategori;
    nama_kategori.text = widget.nama_kategori;
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data " + nama_kategori.text),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => kategori_admin())
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MainPage_admin(token: "")));
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => admin_detail(
                                userdata[index]["id_detail"].toString(),
                                userdata[index]["nama_kategori"],
                                userdata[index]["nama_daerah"],
                                userdata[index]["asal_daerah"],
                                userdata[index]["foto_daerah"],
                                userdata[index]["detail_daerah"],
                            userdata[index]["id_kategori"],
                              )));
                },
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    getrecord();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => update_kategori_detail(
                                userdata[index]["id_detail"].toString(),
                                userdata[index]["id_kategori"].toString(),
                                userdata[index]["nama_kategori"],
                                userdata[index]["nama_daerah"],
                                userdata[index]["asal_daerah"],
                                userdata[index]["detail_daerah"])));
                  },
                ),
                title: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Image.network(
                    "http://10.0.2.2/study_flutter/detail_kategori/" +
                        userdata[index]["foto_daerah"],
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
                          userdata[index]["id_detail"].toString() +
                          " " +
                          userdata[index]["nama_daerah"],
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
                            delrecord(userdata[index]["id_detail"]);
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
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => insertdetailk(
                        id_kategori,
                        nama_kategori.text,
                      )));
          /*showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: const Text("Insert Data Detail Kategori"),
                  scrollable: true,
                  content: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        child: Text("ID: "+id_kategori,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: TextFormField(
                          readOnly: true,
                          controller: nama_kategori,
                          decoration: InputDecoration(border: OutlineInputBorder(),
                              label: Text('Nama Kategori')),
                        ),
                      ),

                      SizedBox(height: 20,),
                      Container(
                        child: TextFormField(
                          controller: caption,
                          decoration: InputDecoration(border: OutlineInputBorder(),
                              label: Text('Enter nama contoh (Kerak Telor)')),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: TextFormField(
                          controller: asal_daerah,
                          decoration: InputDecoration(border: OutlineInputBorder(),
                              label: Text('Enter Asal Daerah')),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: TextFormField(
                          controller: detail_daerah,
                          decoration: InputDecoration(border: OutlineInputBorder(),
                              label: Text('Enter Detail')),
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
