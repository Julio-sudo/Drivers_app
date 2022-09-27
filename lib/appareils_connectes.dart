import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'appareil.dart';

class Main_View extends StatefulWidget {
  const Main_View({Key? key}) : super(key: key);

  @override
  State<Main_View> createState() => _Main_ViewState();
}

class _Main_ViewState extends State<Main_View> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child("appareils");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _databaseReference.onValue ,
        builder: (context, AsyncSnapshot snapshot)  {
          if(snapshot.hasData && !snapshot.hasError ){
            //Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
            //Map<String, dynamic> appareil_Map = jsonDecode(snapshot.data.snapshot.value.toString());
            var _appareil = Appareil.fromJson(snapshot.data.snapshot.value);

            print(snapshot.data.snapshot.value.toString());
            print(_appareil.P);


          }else
            {

            }
          return Container();
        },
      ),
    );
  }
}
