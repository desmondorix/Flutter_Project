import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:marbel/pages/admin_page.dart';

class detail_anggota extends StatefulWidget {
  const detail_anggota({super.key});

  @override
  State<detail_anggota> createState() => _detail_anggotaState();
}

class _detail_anggotaState extends State<detail_anggota> {
  List userdata = [];
  Future<void> delrecord(String id) async {
    String uri = "http://10.0.2.2/study_flutter/delete_data.php";
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
    String uri = "http://10.0.2.2/study_flutter/view_data.php";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data"),
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
                onTap: (){
                  getrecord();
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>update(
                        userdata[index]["id_anggota"].toString(),
                        userdata[index]["username"],
                        userdata[index]["kelas"],
                      ))
                  );*/
                },

                leading: Text('ID: '+userdata[index]["id_anggota"].toString()),
                title: Text(userdata[index]["username"]),
                subtitle: Text('Kelas: '+userdata[index]["kelas"]),
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
                            delrecord(userdata[index]["id_anggota"]);
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
    );
  }
}
