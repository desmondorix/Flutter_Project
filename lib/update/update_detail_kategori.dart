import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:marbel/pages/admin_page.dart';

import '../main.dart';
import '../view/admin_detail_kategori.dart';
import '../view/admin_kategori.dart';

class update_kategori_detail extends StatefulWidget {
  String id_detail;
  String id_kategori;
  String nama_kategori;
  String nama_daerah;
  String asal_daerah;
  String detail_daerah;

  update_kategori_detail(this.id_detail, this.id_kategori, this.nama_kategori,
      this.nama_daerah, this.asal_daerah, this.detail_daerah);

  @override
  State<update_kategori_detail> createState() => _update_kategori_detailState();
}

class _update_kategori_detailState extends State<update_kategori_detail> {
  TextEditingController id_detail = TextEditingController();
  TextEditingController nama_kategori = TextEditingController();
  TextEditingController nama_daerah = TextEditingController();
  TextEditingController asal_daerah = TextEditingController();
  TextEditingController detail_daerah = TextEditingController();
  late String id_kategori;
  File? imagepath;
  String? imagename;
  String? imagedata;

  ImagePicker imagePicker = new ImagePicker();

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

  Future<void> updaterecord() async {
    if (imagepath == null) {
      String uri =
          "http://10.0.2.2/study_flutter/detail_kategori/update_kategori_detail.php";
      try {
        var res = await http.post(Uri.parse(uri), body: {
          "id_detail": id_detail.text,
          "nama_daerah": nama_daerah.text,
          "asal_daerah": asal_daerah.text,
          "detail_daerah": detail_daerah.text
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Record Updated");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      view_detail_kategori(id_kategori, nama_kategori.text)));
        } else {
          print("some issue");
        }
      } catch (e) {
        print(e);
      }
    } else if (imagepath != null) {
      String uri =
          "http://10.0.2.2/study_flutter/detail_kategori/update_kategori_detail_img.php";
      try {
        var res = await http.post(Uri.parse(uri), body: {
          "id_detail": id_detail.text,
          "nama_daerah": nama_daerah.text,
          "asal_daerah": asal_daerah.text,
          "detail_daerah": detail_daerah.text,
          "data": imagedata,
          "name": imagename,
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Record Updated");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      view_detail_kategori(id_kategori, nama_kategori.text)));
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
    id_detail.text = widget.id_detail;
    id_kategori = widget.id_kategori;
    nama_kategori.text = widget.nama_kategori;
    nama_daerah.text = widget.nama_daerah;
    asal_daerah.text = widget.asal_daerah;
    detail_daerah.text = widget.detail_daerah;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data"),
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
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                child: TextFormField(
                  readOnly: true,
                  controller: id_detail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text('ID Detail')),
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
                      border: OutlineInputBorder(),
                      label: Text('Nama Kategori')),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                child: TextFormField(
                  controller: nama_daerah,
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
                margin: EdgeInsets.only(right: 30, left: 30),
                child: TextFormField(
                  controller: detail_daerah,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Enter Detail')),
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
        ],
      ),
    );
  }
}
