import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piris1/domain/entities/citizenship.dart';
import 'package:piris1/domain/entities/city.dart';
import 'package:piris1/domain/entities/disability.dart';
import 'package:piris1/domain/entities/marriage.dart';
import 'package:piris1/domain/entities/user.dart';
import 'package:piris1/domain/repo_interfaces/firestore_repository.dart';
import 'package:piris1/presentation/pages/edit/edit_state.dart';

class EditCubit extends Cubit<EditState> {
  final FirestoreRemoteDataSource _firestoreRemoteDataSource;

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final middlenameController = TextEditingController();
  final passportSeriesController = TextEditingController();
  final passportNumberController = TextEditingController();
  final passGiverController = TextEditingController();
  final passportIdNumberController = TextEditingController();
  final birthPlaceController = TextEditingController();
  final passportAddressController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final cellController = TextEditingController();
  final emailController = TextEditingController();
  final workplaceController = TextEditingController();
  final workPosController = TextEditingController();
  final salaryController = TextEditingController();

  EditCubit(this._firestoreRemoteDataSource) : super(const EditState());

  User? cuser;

  void init(User? user) async {
    cuser = user;
    final cities = await _firestoreRemoteDataSource.getCities();
    final d = await _firestoreRemoteDataSource.getDisabilities();
    final m = await _firestoreRemoteDataSource.getMarriages();
    final c = await _firestoreRemoteDataSource.getCitizenships();
    emit(
      state.copyWith(
        cities: cities,
        marriages: m,
        citizenships: c,
        disabilities: d,
      ),
    );
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      if (user != null) {
        nameController.text = user.firstName;
        surnameController.text = user.lastName;
        middlenameController.text = user.middleName;
        passportSeriesController.text = user.passportSeries;
        passportNumberController.text = user.passportNumber;
        passGiverController.text = user.passGiver;
        passportIdNumberController.text = user.passportIdNumber;
        birthPlaceController.text = user.birthPlace;
        passportAddressController.text = user.passportAddress;
        addressController.text = user.address;
        phoneController.text = user.phone ?? '';
        cellController.text = user.cell ?? '';
        emailController.text = user.email ?? '';
        workplaceController.text = user.workplace ?? '';
        workPosController.text = user.workPos ?? '';
        salaryController.text = user.income ?? '';

        emit(
          state.copyWith(
            birthday: user.birthDate,
            passportDate: user.passportDate,
            city: state.cities.where((e) => e.name == user.city.name).first,
            passportCity: state.cities.where((e) => e.name == user.passportCity.name).first,
            marriage: state.marriages.where((e) => e.name == user.marriage.name).first,
            citizenship: state.citizenships.where((e) => e.name == user.citizenship.name).first,
            disability: state.disabilities.where((e) => e.name == user.disability.name).first,
            isAged: user.isAged,
            military: user.military,
            gender: user.gender,
          ),
        );
      }
    });
  }

  void setBirth(DateTime? birth) {
    if (birth != null) {
      emit(state.copyWith(birthday: birth));
    }
  }

  void setPassportDate(DateTime? date) {
    if (date != null) {
      emit(state.copyWith(passportDate: date));
    }
  }

  void setGender(bool gender) {
    emit(state.copyWith(gender: gender));
  }

  void setCity(City? c) {
    if (c != null) {
      emit(state.copyWith(city: c));
    }
  }

  void setIsAged(bool isAged) {
    emit(state.copyWith(isAged: isAged));
  }

  void setMilitary(bool military) {
    emit(state.copyWith(military: military));
  }

  void setPassCity(City? c) {
    if (c != null) {
      emit(state.copyWith(passportCity: c));
    }
  }

  void setMarriage(Marriage? m) {
    if (m != null) {
      emit(state.copyWith(marriage: m));
    }
  }

  void setDisability(Disability? disability) {
    if (disability != null) {
      emit(state.copyWith(disability: disability));
    }
  }

  void setCitizenship(Citizenship? c) {
    if (c != null) {
      emit(state.copyWith(citizenship: c));
    }
  }

  static final RegExp nameRegExp =
      RegExp(r'^[абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ]+$');
  static final RegExp numberRegExp = RegExp(r'^[\d]+\.[\d]+$');
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passportSeriesRegExp = RegExp(r"^[a-zA-Z]{2}$");
  final passportNumberRegExp = RegExp(r"^[0-9]{7}$");
  final textRegExp =
      RegExp(r"^[абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ .]+$");
  final passportIdRegExp = RegExp(r"^[0-9]{7}[A-Z][0-9]{3}[A-Z]{2}[0-9]{1}$");
  final cellRegExp = RegExp(r"^\+375[0-9]{9}$");
  final phoneRegExp = RegExp(r"^[0-9]{11}$");

  void createOrSave() {
    if (validate()) {
      final user = User(
        id: cuser?.id ?? '',
        firstName: nameController.text,
        lastName: surnameController.text,
        middleName: middlenameController.text,
        birthDate: state.birthday!,
        gender: state.gender,
        passportSeries: passportSeriesController.text,
        passportNumber: passportNumberController.text,
        passGiver: passGiverController.text,
        passportDate: state.passportDate!,
        passportIdNumber: passportIdNumberController.text,
        birthPlace: birthPlaceController.text,
        city: state.city!,
        address: addressController.text,
        passportCity: state.passportCity!,
        passportAddress: passportAddressController.text,
        marriage: state.marriage!,
        citizenship: state.citizenship!,
        disability: state.disability!,
        isAged: state.isAged,
        military: state.military,
        phone: phoneController.text,
        cell: cellController.text,
        email: emailController.text,
        workplace: workplaceController.text,
        workPos: workPosController.text,
        income: salaryController.text,
      );
      _firestoreRemoteDataSource.saveUser(user);
    }
  }

  void deleteUser() {
    _firestoreRemoteDataSource.delete(cuser!);
  }

  bool validate() {
    try {
      if (nameController.text.isEmpty) {
        throw Exception('Поле Имя пустое');
      }
      if (!nameRegExp.hasMatch(nameController.text)) {
        throw Exception('Поле Имя должно содержать только кириллицу');
      }
      if (surnameController.text.isEmpty) {
        throw Exception('Поле Фамилия пустое');
      }
      if (!nameRegExp.hasMatch(surnameController.text)) {
        throw Exception('Поле Фамилия должно содержать только кириллицу');
      }
      if (middlenameController.text.isEmpty) {
        throw Exception('Поле Отчество пустое');
      }
      if (!nameRegExp.hasMatch(middlenameController.text)) {
        throw Exception('Поле Отчество должно содержать только кириллицу');
      }
      if (state.birthday == null) {
        throw Exception('Заполните дату рождения');
      }
      if (passportSeriesController.text.isEmpty) {
        throw Exception('Поле Серия паспорта пустое');
      }
      if (!passportSeriesRegExp.hasMatch(passportSeriesController.text)) {
        throw Exception('Поле Серия паспорта должно содержать 2 латинские буквы');
      }
      if (passportNumberController.text.isEmpty) {
        throw Exception('Поле Номер паспорта пустое');
      }
      if (!passportNumberRegExp.hasMatch(passportNumberController.text)) {
        throw Exception('Поле Номер паспорта должно содержать 7 цифр');
      }
      if (passGiverController.text.isEmpty) {
        throw Exception('Поле Кем выдан пустое');
      }
      if (!textRegExp.hasMatch(passGiverController.text)) {
        throw Exception(
            'Поле Кем выдан должно содержать только кириллицу, пробелы, запятую, дефис и точку');
      }
      if (state.passportDate == null) {
        throw Exception('Заполните дату выдачи пасспорта');
      }
      if (passportIdNumberController.text.isEmpty) {
        throw Exception('Поле Идентификационный номер пустое');
      }
      if (!passportIdRegExp.hasMatch(passportIdNumberController.text)) {
        throw Exception('Поле Идентификационный номер должно иметь формат 0000000А000АА0');
      }
      if (birthPlaceController.text.isEmpty) {
        throw Exception('Поле Место рождения пустое');
      }
      if (!textRegExp.hasMatch(birthPlaceController.text)) {
        throw Exception(
            'Поле Место рождения должно содержать только кириллицу, пробелы, запятую, дефис и точку');
      }
      if (state.city == null) throw Exception('Выберите город проживания');
      if (addressController.text.isEmpty) {
        throw Exception('Поле Адрес проживания пустое');
      }
      if (!textRegExp.hasMatch(addressController.text)) {
        throw Exception(
            'Поле Адрес проживания должно содержать только кириллицу, пробелы, запятую, дефис и точку');
      }
      if (cellController.text.isNotEmpty) {
        if (!cellRegExp.hasMatch(cellController.text)) {
          throw Exception('Неверно введен номер мобильного телефона');
        }
      }
      if (phoneController.text.isNotEmpty) {
        if (!phoneRegExp.hasMatch(phoneController.text)) {
          throw Exception('Неверно введен номер домашнего телефона');
        }
      }
      if (emailController.text.isNotEmpty) {
        if (!emailRegExp.hasMatch(emailController.text)) {
          throw Exception('Неверно введен адрес электронной почты');
        }
      }
      if (workPosController.text.isNotEmpty) {
        if (!textRegExp.hasMatch(workPosController.text)) {
          throw Exception('Неверно введена должность');
        }
      }
      if (salaryController.text.isNotEmpty) {
        if (!numberRegExp.hasMatch(salaryController.text)) {
          throw Exception('Неверно введен доход');
        }
      }
      if (workplaceController.text.isNotEmpty) {
        if (!textRegExp.hasMatch(workplaceController.text)) {
          throw Exception('Неверно введено место работы');
        }
      }
      if (state.passportCity == null) throw Exception('Выберите город прописки');
      if (state.marriage == null) throw Exception('Выберите Семейное положение');
      if (state.disability == null) throw Exception('Выберите Тип инвалидности либо его отсутсвие');
      if (passportAddressController.text.isEmpty) {
        throw Exception('Поле Адрес прописки пустое');
      }
      if (!textRegExp.hasMatch(passportAddressController.text)) {
        throw Exception(
            'Поле Адрес прописки должно содержать тольео буквы, пробелы, запятые и точки');
      }
      return true;
    } on Exception catch (e) {
      _showToast(e.toString());
      return false;
    }
  }

  _showToast(String title) {
    Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }
}
