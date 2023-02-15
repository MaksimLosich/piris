import 'package:piris1/domain/entities/citizenship.dart';
import 'package:piris1/domain/entities/city.dart';
import 'package:piris1/domain/entities/disability.dart';
import 'package:piris1/domain/entities/marriage.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String middleName;
  DateTime birthDate;
  bool gender;
  String passportSeries;
  String passportNumber;
  String passGiver;
  DateTime passportDate;
  String passportIdNumber;
  String birthPlace;
  City city;
  String address;
  String? phone;
  String? cell;
  String? email;
  String? workplace;
  String? workPos;
  City passportCity;
  String passportAddress;
  Marriage marriage;
  Citizenship citizenship;
  Disability disability;
  bool isAged;
  bool military;
  String? income;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.birthDate,
    required this.gender,
    required this.passportSeries,
    required this.passportNumber,
    required this.passGiver,
    required this.passportDate,
    required this.passportIdNumber,
    required this.birthPlace,
    required this.city,
    required this.address,
    this.phone,
    this.cell,
    this.email,
    this.workplace,
    this.workPos,
    required this.passportCity,
    required this.passportAddress,
    required this.marriage,
    required this.citizenship,
    required this.disability,
    required this.isAged,
    required this.military,
    this.income,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleName: json['middleName'],
      birthDate: DateTime.parse(json['birthDate']),
      gender: json['gender'],
      passportSeries: json['passportSeries'],
      passportNumber: json['passportNumber'],
      passGiver: json['passGiver'],
      passportDate: DateTime.parse(json['passportDate']),
      passportIdNumber: json['passportIdNumber'],
      birthPlace: json['birthPlace'],
      city: City(name: json['city'], id: ''),
      address: json['address'],
      passportCity: City(name: json['passportCity'], id: ''),
      passportAddress: json['passportAddress'],
      marriage: Marriage(name: json['marriage'], id: ''),
      citizenship: Citizenship(name: json['citizenship'], id: ''),
      disability: Disability(name: json['disability'], id: ''),
      isAged: json['isAged'],
      military: json['military'],
      phone: json['phone'],
      cell: json['cell'],
      email: json['email'],
      workplace: json['workplace'],
      workPos: json['workPos'],
      income: json['income'],
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'middleName': middleName,
        'birthDate': birthDate.toString(),
        'gender': gender,
        'passportSeries': passportSeries,
        'passportNumber': passportNumber,
        'passGiver': passGiver,
        'passportDate': passportDate.toString(),
        'passportIdNumber': passportIdNumber,
        'birthPlace': birthPlace,
        'city': city.name,
        'address': address,
        'phone': phone ?? '',
        'cell': cell ?? '',
        'email': email ?? '',
        'workplace': workplace ?? '',
        'workPos': workPos ?? '',
        'passportCity': passportCity.name,
        'passportAddress': passportAddress,
        'marriage': marriage.name,
        'citizenship': citizenship.name,
        'disability': disability.name,
        'isAged': isAged,
        'military': military,
        'income': income ?? '',
      };
}
