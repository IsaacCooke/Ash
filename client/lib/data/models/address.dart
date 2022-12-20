import 'dart:convert';

import 'package:client/data/models/location.dart';

List<Address> addressFromJson(String str) =>
  List<Address>.from(json.decode(str).map((x) => Address.fromJson(x)));

String addressToJson(List<Address> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Address{
  final int id;
  final int houseNumber;
  final String houseName;
  final String street;
  final String county;
  final String country;
  final String postCode;
  final Location location;

  const Address({
    required this.id,
    required this.houseNumber,
    required this.houseName,
    required this.street,
    required this.county,
    required this.country,
    required this.postCode,
    required this.location,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json['id'],
    houseNumber: json['houseNumber'],
    houseName: json['houseName'],
    street: json['location'],
    county: json['county'],
    country: json['country'],
    postCode: json['postCode'],
    location: Location.fromJson(json['location']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'houseNumber': houseNumber,
    'houseName': houseName,
    'street': street,
    'county': country,
    'country': country,
    'postCode': postCode,
    'location': location.toJson(),
  };
}