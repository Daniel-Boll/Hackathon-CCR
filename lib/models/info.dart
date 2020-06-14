import 'package:hackathon_ccr/models/facility.dart';

class UserInfo {

  final String name;
  final String phone;
  final String email;
  final String password;
  final String placa;
  final String cpf;
  final String antt;
  final String trucoin;

  UserInfo({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.placa,
    this.cpf,
    this.antt,
    this.trucoin
  });
}

class FacilityInfo {

  final String lat;
  final String lng;
  final String name; 
  final double generalRate;
  final Map generalSpecificRate; 
  final List<Map> reviewData;

  FacilityInfo({
    this.lat,
    this.lng,
    this.name,
    this.generalRate,
    this.generalSpecificRate,
    this.reviewData
  });
}