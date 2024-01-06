import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:marbel/pages/admin_page.dart';
import '../view/admin_kategori.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';


import '../main.dart';
import '../view/kategori.dart';

class insertkategori extends StatefulWidget {
  const insertkategori({super.key});

  @override
  State<insertkategori> createState() => _insertkategoriState();
}

class _insertkategoriState extends State<insertkategori> {
  TextEditingController caption=TextEditingController();

  File? imagepath;
  String? imagename;
  String? imagedata;

  ImagePicker imagePicker = new ImagePicker();

  Future<void> uploadImage() async{
    if(caption.text !=""){
      try{
        String uri = "http://10.0.2.2/study_flutter/kategori/insert_kategori.php";
        var res=await http.post(Uri.parse(uri), body: {
          "caption":caption.text,
          "data":imagedata,
          "name":imagename,
        });
        var response = jsonDecode(res.body);
        if(response["success"]=="true"){
          print("Record Inserted");
          caption.text = "";
          Kategori();
        } else {
          print("some issue");
        }
      } catch(e){
        print(e);
      }
    } else {
      print("please fill all fields");
    }
  }

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Kategori'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Colors.black, size: 35,),
            onPressed: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => MainPage_admin(token: ""))
              );
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
            ElevatedButton(onPressed: (){
              setState(() {
                uploadImage();
              });
            }, child: Text('Upload')),
            Container(
              margin: EdgeInsets.all(10),
              child: Builder(
                builder: (context){
                  return ElevatedButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>kategori_admin())
                        );
                      },
                      child: Text('View data')
                  );
                },
              ),
            ),
          ]),
    );
  }
}
