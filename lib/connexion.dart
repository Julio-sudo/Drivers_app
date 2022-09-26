import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_energy_management_4/appareils_connectes.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Smart Energy Management",
              style: GoogleFonts.mcLaren(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const Main_View() )));
                } , child: Text("Se connecter",
            style: GoogleFonts.mcLaren(),))
          ],
        ),
      ),
    );
  }
}
