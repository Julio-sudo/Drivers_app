import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

class Appareil{
  final double P;
  final double statut;

  Appareil({required this.P, required this.statut});

  factory Appareil.fromJson(Map<dynamic,dynamic>json){
    double parser(dynamic source){
      try{
         return double.parse(source.toString());

      }on FormatException{
        return -2;
      }
    }

/*
    int parse(dynamic source){
      try{
        return  parseBool(source.toString());
      }on FormatException{
        return -1;
      }
    }
*/



    return Appareil(
    P: parser(json['P']),
    statut:parser(json['statut'])
  );
  }
}