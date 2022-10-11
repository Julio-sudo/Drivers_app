
import 'package:json_annotation/json_annotation.dart';
part 'appareil.g.dart';

@JsonSerializable()
class Appareil{
  final double P;

  @JsonKey(defaultValue: false)
   final bool statut;

  Appareil({required this.P, required this.statut});

  factory Appareil.fromJson(Map<String, dynamic> json) => _$AppareilFromJson(json);

  Map<String, dynamic> toJson() => _$AppareilToJson(this);
/*factory Appareil.fromJson(Map<dynamic,dynamic>json){
    double parser(dynamic source){
      try{
         return double.parse(source.toString());

      }on FormatException{
        return -2;
      }
    }


    return Appareil(
    P: parser(json['P']),
    statut:parser(json['statut'])
  );
  }*/
}