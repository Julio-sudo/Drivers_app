//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'connexion.dart';
import 'firebase_options.dart';
import 'dart:async';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
//DatabaseReference ref = FirebaseDatabase.instance.ref();

DatabaseReference databaseReference =
FirebaseDatabase.instance.ref('appareils/');

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  String etat_appareil = "Eteint";
  String consommation_appareil = "0.0";

  void getData() async{
    var snapshot = await databaseReference.child('lampe/statut').get();
    if (snapshot.exists){
      if(snapshot.value == 1)
      {
        await databaseReference.child('lampe').update({"statut" : 0});
      }else if (snapshot.value == 0)
      {
        await databaseReference.child('lampe').update({"statut" : 1});
      }
    }else
    {
      print('Aucune donnée disponible');
    }
  }

  void getAppState() async{
    var snapshot = await databaseReference.child('lampe/statut').get();
    if (snapshot.exists){
      if(snapshot.value == true)
      {
       etat_appareil = "Allumé";
      }else if (snapshot.value == false)
      {
      etat_appareil = "Allumé";
      }
    }else
    {
      print('Aucune donnée disponible');
    }
  }

  Future<void> getAppMesurement() async {
    var snapshot = await databaseReference.child('lampe/P').get();
    if (snapshot.exists){
    consommation_appareil = snapshot.value.toString();
    }else
    {
      print('Aucune donnée disponible');
    }
  }



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Connexion()
    );
  }
}
