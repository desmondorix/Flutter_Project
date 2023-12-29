import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import '../main.dart';
import '../view/admin_detail_kategori.dart';
import '../view/kategori.dart';

class insertdetailk extends StatefulWidget {
  String id_kategori;
  String nama_kategori;

  insertdetailk(this.id_kategori, this.nama_kategori);

  @override
  State<insertdetailk> createState() => _insertdetailkState();
}

class _insertdetailkState extends State<insertdetailk> {
  TextEditingController id_kategori = TextEditingController();
  TextEditingController nama_kategori = TextEditingController();
  TextEditingController caption = TextEditingController();
  TextEditingController asal_daerah = TextEditingController();
  TextEditingController detail_daerah = TextEditingController();

  File? imagepath;
  String? imagename;
  String? imagedata;

  ImagePicker imagePicker = new ImagePicker();

  List userdata = [];

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
          "id_kategori": id_kategori.text,
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
    id_kategori.text = widget.id_kategori;
    nama_kategori.text = widget.nama_kategori;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Detail Kategori'),
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
      body: ListView(children: <Widget>[
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                readOnly: true,
                controller: id_kategori,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('ID Kategori')),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                readOnly: true,
                controller: nama_kategori,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Nama Kategori')),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                controller: caption,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Enter nama contoh (Kerak Telor)')),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                controller: asal_daerah,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Enter Asal Daerah')),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(
                right: 30,
                left: 30,
              ),
              child: TextFormField(
                controller: detail_daerah,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Enter Detail')),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: imagepath != null
                  ? Image.file(imagepath!)
                  : Text(
                      'Image Not Chose Yet',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
            ),
            ElevatedButton(
                onPressed: () {
                  getImage();
                },
                child: Text('Chose Image')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    uploadImage();
                  });
                },
                child: Text('Upload')),
            Container(
              margin: EdgeInsets.all(10),
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                      onPressed: () {}, child: Text('View data'));
                },
              ),
            ),
          ],
        )
      ]),
    );
  }
}
