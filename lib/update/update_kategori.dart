import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:marbel/pages/admin_page.dart';


import '../main.dart';
import '../view/admin_kategori.dart';

class update_kategori extends StatefulWidget {
  String id_kategori;
  String nama_kategori;

  update_kategori(this.id_kategori, this.nama_kategori);

  @override
  State<update_kategori> createState() => _update_kategoriState();
}

class _update_kategoriState extends State<update_kategori> {
  TextEditingController id_kategori=TextEditingController();
  TextEditingController nama_kategori=TextEditingController();

  File? imagepath;
  String? imagename;
  String? imagedata;

  ImagePicker imagePicker = new ImagePicker();


  Future<void> getImage() async{
    var getimage=await imagePicker.pickImage(source:ImageSource.gallery);
    setState(() {
      imagepath = File(getimage!.path);
      imagename=getimage.path.split('/').last;
      imagedata=base64Encode(imagepath!.readAsBytesSync());
      print(imagepath);
      print(imagedata);
      print(imagename);
    });
  }

  Future<void> updaterecord() async {
    if (imagepath == null) {
      String uri = "http://10.0.2.2/study_flutter/kategori/update_kategori.php";
      try {
        var res = await http.post(Uri.parse(uri), body: {
          "id_kategori": id_kategori.text,
          "nama_kategori": nama_kategori.text,
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Record Updated");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => kategori_admin())
          );
        } else {
          print("some issue");
        }
      } catch (e) {
        print(e);
      }
    } else if(imagepath != null){
      String uri = "http://10.0.2.2/study_flutter/kategori/update_kategori_img.php";
      try {
        var res = await http.post(Uri.parse(uri), body: {
          "id_kategori": id_kategori.text,
          "nama_kategori": nama_kategori.text,
          "data": imagedata,
          "name": imagename,
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Record Updated");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => kategori_admin())
          );
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

  void initState() {
    id_kategori.text=widget.id_kategori;
    nama_kategori.text=widget.nama_kategori;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Colors.black, size: 35,),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MainPage_admin(token: "")));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(right: 30, left: 30),
            child: TextFormField(
              readOnly: true,
              enableInteractiveSelection: true,
              controller: id_kategori,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('ID')
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(right: 30, left: 30),
            child: TextFormField(
              controller: nama_kategori,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Nama Kategori')
              ),
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
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                updaterecord();
              },
              child: Text('Insert'),
            ),
          ),
        ],
      ),
    );
  }
}
