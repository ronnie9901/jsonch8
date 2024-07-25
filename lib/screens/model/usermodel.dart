import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  late int id;
  late String name, email, username, phone, website;
  late Adress address;
  late Company company;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory UserModel.fromMap(Map m1) {
    return UserModel(
        id: m1['id'],
        name: m1['name'],
        email: m1['email'],
        username: m1['username'],
        phone: m1['phone'],
        website: m1['website'],
        address: Adress.fromMap(m1['address']),
        company: Company.fromMap(m1['company']));
  }
}

class Adress {
  late String street, suits, city, zipcode;
  late Geo geo;

  Adress(
      {required this.street,
      required this.city,
      required this.zipcode,
      required this.suits,
      required this.geo});

  factory Adress.fromMap(Map m1) {
    return Adress(
        street: m1['street'],
        city: m1['city'],
        zipcode: m1['zipcode'],
        suits: m1['suite'],
        geo: Geo.fromMap(m1['geo']));
  }
}

class Geo {
  late String lat, lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromMap(Map m1) {
    return Geo(lat: m1['lat'], lng: m1['lng']);
  }
}

class Company {
  late String name, catchPhrase, bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromMap(Map m1) {
    return Company(
        name: m1['name'], catchPhrase: m1['catchPhrase'], bs: m1['bs']);
  }
}
