import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appareil.dart';

class Main_View extends StatefulWidget {
  const Main_View({Key? key}) : super(key: key);


  @override
  State<Main_View> createState() => _Main_ViewState();
}

class _Main_ViewState extends State<Main_View> {
  DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child("appareils/lampe");

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Appareils connectés',
            style: GoogleFonts.mcLaren(),
          ),
          centerTitle: true,
          elevation: 0.7,
          backgroundColor: Colors.blueAccent,
        ),
        body:

      /*  Column(
          children: [
            Center(
              child: Text(
                'Appareils connectés',
                style: GoogleFonts.mcLaren(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "Appareils/images.jpeg",
                width: 50.0,
                height: 50.0,
              ),
              title: Text(
                "Lampe",
                style: GoogleFonts.mcLaren(),
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Consommation de l'appareil: ",
                          style: GoogleFonts.mcLaren(fontSize: 10),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                       mesure()  ,
                          style: GoogleFonts.mcLaren(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Etat de l'appareil: ",
                          style: GoogleFonts.mcLaren(fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          "",
                          style: GoogleFonts.mcLaren(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              isThreeLine: true,
              onTap: () {},
            )
          ],
        )*/

          StreamBuilder(
        stream: _databaseReference.onValue ,
        builder: (context, AsyncSnapshot snapshot)  {
          if(snapshot.hasData && !snapshot.hasError ){
            //Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
            print(snapshot.data.snapshot.value.toString());

        Map<String, dynamic> appareil_Map = jsonDecode(snapshot.data.snapshot.value.toString());
            //  appareil_Map =  jsonDecode("""${snapshot.data.snapshot.value.toString()}""");
            /*Map<String, dynamic> appareil_Map = {
              "P": 50.0,
              "statut": false
            };*/
         // Map<String, dynamic> appareil_Map = snapshot.data.snapshot.value;
            var _appareil = Appareil.fromJson(appareil_Map);

           print(appareil_Map.toString());
            print(_appareil.statut);

            String etat_appareil()  {
            if(_appareil.statut == true){
              return "Allumé";
            }else{
              return "Eteint";
            }
            }

            return  ListView(
              children: [
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Image.asset(
                      "Appareils/images.jpeg",
                      width: 50.0,
                      height:50.0,
                    ),
                    title: Text(
                      "Lampe",
                      style: GoogleFonts.mcLaren(),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Consommation de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                _appareil.P.toString() + " Wh",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Etat de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(etat_appareil()
                                ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () async {
                      await _databaseReference.update({"\"statut\"": !_appareil.statut});
                    },
                  ),
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Image.asset(
                      "Appareils/television.jpeg",
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text(
                      "Poste téléviseur",
                      style: GoogleFonts.mcLaren(),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Consommation de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "0 Wh",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Etat de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Éteint"
                                ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () async {

                    },
                  ),
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Image.asset(
                      "Appareils/barre_de_sons.jpg",
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text(
                      "Barre de sons",
                      style: GoogleFonts.mcLaren(),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Consommation de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "0 Wh",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Etat de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Éteint"
                                ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () async {
                    },
                  ),
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Image.asset(
                      "Appareils/ventilateur.jpg",
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text(
                      "Ventilateur",
                      style: GoogleFonts.mcLaren(),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Consommation de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "0 Wh",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Etat de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Éteint"
                                ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () async {
                    },
                  ),
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Image.asset(
                      "Appareils/climatiseur.jpeg",
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text(
                      "Climatiseur",
                      style: GoogleFonts.mcLaren(),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Consommation de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "0 Wh",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Etat de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Éteint"
                                ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () async {
                    },
                  ),
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Image.asset(
                      "Appareils/fer_a_repasser.jpg",
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text(
                      "Fer à repasser",
                      style: GoogleFonts.mcLaren(),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Consommation de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "0 Wh"
                                    ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Etat de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Éteint"
                                ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () async {
                    },
                  ),
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Image.asset(
                      "Appareils/frigo.jpeg",
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text(
                      "Refrigérateur",
                      style: GoogleFonts.mcLaren(),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Consommation de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "0 Wh",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Etat de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Eteint"
                                ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () async {
                      /*              var _appareil_m = Appareil(P: _appareil.P, statut: true);
                      // print( _appareil_m.toJson());
                      print(jsonEncode(_appareil_m));
                      print("000");
                      print(jsonDecode(jsonEncode(_appareil_m)));
                      var etat = jsonEncode(_appareil_m);
                      await _databaseReference.update(json.decode(etat));*/
                    },
                  ),
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Image.asset(
                      "Appareils/micro-onde.jpeg",
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text(
                      "Micro-onde",
                      style: GoogleFonts.mcLaren(),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Consommation de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "0 Wh",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Etat de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Éteint"
                                ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () async {
                    },
                  ),
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Image.asset(
                      "Appareils/mixeur.jpg",
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text(
                      "Mixeur",
                      style: GoogleFonts.mcLaren(),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Consommation de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "0 Wh",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Etat de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Éteint"
                                ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () async {
                    },
                  ),
                ),
                Card(
                  elevation: 0.5,
                  child: ListTile(
                    leading: Image.asset(
                      "Appareils/bouilloire.jpg",
                      width: 50.0,
                      height: 50.0,
                    ),
                    title: Text(
                      "Bouilloire",
                      style: GoogleFonts.mcLaren(),
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Consommation de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                "0 Wh",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Etat de l'appareil: ",
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text("Éteint"
                                ,
                                style: GoogleFonts.mcLaren(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () async {
                    },
                  ),
                ),
              ],
            );
          }else
            {
              return Container();
            }

        },
      )
        );
  }
}
