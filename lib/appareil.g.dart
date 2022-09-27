// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appareil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appareil _$AppareilFromJson(Map<String, dynamic> json) => Appareil(
      P: (json['P'] as num).toDouble(),
      statut: json['statut'] as bool? ?? false,
    );

Map<String, dynamic> _$AppareilToJson(Appareil instance) => <String, dynamic>{
      'P': instance.P,
      'statut': instance.statut,
    };
