import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:piris1/domain/entities/citizenship.dart';
import 'package:piris1/domain/entities/city.dart';
import 'package:piris1/domain/entities/disability.dart';
import 'package:piris1/domain/entities/marriage.dart';
import 'package:piris1/domain/entities/user.dart';
import 'package:piris1/presentation/app/di/injector.dart';
import 'package:piris1/presentation/pages/edit/edit_cubit.dart';
import 'package:piris1/presentation/pages/edit/edit_state.dart';
import 'package:piris1/presentation/widgets/app_elevated_button.dart';
import 'package:piris1/presentation/widgets/app_text_field.dart';

class EditPage extends StatefulWidget {
  final User? user;

  const EditPage({
    this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final cubit = i.get<EditCubit>();

  @override
  void initState() {
    cubit.init(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCubit, EditState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.user == null ? 'Создание' : 'Редактирование'),
            actions: [
              if (widget.user != null)
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Удалить?'),
                        actions: [
                          TextButton(
                            child: const Text('Нет'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Да'),
                            onPressed: () {
                              cubit.deleteUser();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ).then((value) => Navigator.of(context).pop());
                  },
                  icon: const Icon(Icons.delete),
                ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListView(
              shrinkWrap: true,
              children: [
                AppTextField(controller: cubit.nameController, hint: 'Имя'),
                AppTextField(controller: cubit.surnameController, hint: 'Фамилия'),
                AppTextField(controller: cubit.middlenameController, hint: 'Отчество'),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        'Дата рождения${state.birthday == null ? '' : ': ${DateFormat('yyyy-MM-dd').format(state.birthday!)}'}',
                      ),
                    ),
                    AppElevatedButton(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(1850),
                          lastDate: DateTime.now(),
                        ).then((birth) => cubit.setBirth(birth));
                      },
                      title: 'Выбрать',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: state.gender,
                      onChanged: (value) {
                        cubit.setGender(value!);
                      },
                    ),
                    const Text('Мужчина'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<bool>(
                      value: false,
                      groupValue: state.gender,
                      onChanged: (value) {
                        cubit.setGender(value!);
                      },
                    ),
                    const Text('Женщина'),
                  ],
                ),
                AppTextField(
                  controller: cubit.passportSeriesController,
                  hint: 'Серия паспорта',
                  maxLength: 2,
                ),
                AppTextField(
                  controller: cubit.passportNumberController,
                  hint: 'Номер паспорта',
                  maxLength: 7,
                  textInputType: TextInputType.number,
                ),
                AppTextField(controller: cubit.passGiverController, hint: 'Кем выдан'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        'Дата выдачи${state.passportDate == null ? '' : ': ${DateFormat('yyyy-MM-dd').format(state.passportDate!)}'}',
                      ),
                    ),
                    AppElevatedButton(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(1850),
                          lastDate: DateTime.now(),
                        ).then((date) => cubit.setPassportDate(date));
                      },
                      title: 'Выбрать',
                    ),
                  ],
                ),
                AppTextField(
                    controller: cubit.passportIdNumberController, hint: 'Идентификационный номер'),
                AppTextField(controller: cubit.birthPlaceController, hint: 'Место рождения'),
                const SizedBox(height: 12),
                const Text('Город фактического проживания'),
                DropdownButton<City>(
                  value: state.city,
                  hint: const Text('Город'),
                  onChanged: (City? city) {
                    cubit.setCity(city);
                  },
                  items: state.cities.map<DropdownMenuItem<City>>((City city) {
                    return DropdownMenuItem<City>(
                      value: city,
                      child: Text(city.name),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                AppTextField(controller: cubit.addressController, hint: 'Адрес факт. проживания'),
                AppTextField(controller: cubit.phoneController, hint: 'Телефон домашний'),
                AppTextField(controller: cubit.cellController, hint: 'Телефон мобильный'),
                AppTextField(controller: cubit.emailController, hint: 'Электронная почта'),
                AppTextField(controller: cubit.workplaceController, hint: 'Место работы'),
                AppTextField(controller: cubit.workPosController, hint: 'Должность'),
                const SizedBox(height: 12),
                const Text('Город прописки'),
                DropdownButton<City>(
                  value: state.passportCity,
                  hint: const Text('Город'),
                  onChanged: (City? city) {
                    cubit.setPassCity(city);
                  },
                  items: state.cities.map<DropdownMenuItem<City>>((City city) {
                    return DropdownMenuItem<City>(
                      value: city,
                      child: Text(city.name),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                AppTextField(controller: cubit.passportAddressController, hint: 'Адрес прописки'),
                const SizedBox(height: 12),
                const Text('Семейное положение'),
                DropdownButton<Marriage>(
                  hint: const Text('Семейное положение'),
                  value: state.marriage,
                  onChanged: (Marriage? marriage) {
                    cubit.setMarriage(marriage);
                  },
                  items: state.marriages.map<DropdownMenuItem<Marriage>>((Marriage marriage) {
                    return DropdownMenuItem<Marriage>(
                      value: marriage,
                      child: Text(marriage.name),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                const Text('Гражданство'),
                DropdownButton<Citizenship>(
                  value: state.citizenship,
                  hint: const Text('Гражданство'),
                  onChanged: (Citizenship? citizenship) {
                    cubit.setCitizenship(citizenship);
                  },
                  items: state.citizenships
                      .map<DropdownMenuItem<Citizenship>>((Citizenship citizenship) {
                    return DropdownMenuItem<Citizenship>(
                      value: citizenship,
                      child: Text(citizenship.name),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                const Text('Инвалидность'),
                DropdownButton<Disability>(
                  value: state.disability,
                  hint: const Text('Инвалидность'),
                  onChanged: (Disability? disability) {
                    cubit.setDisability(disability);
                  },
                  items:
                      state.disabilities.map<DropdownMenuItem<Disability>>((Disability disability) {
                    return DropdownMenuItem<Disability>(
                      value: disability,
                      child: Text(disability.name),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                const Text('Пенсионер'),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Switch(value: state.isAged, onChanged: cubit.setIsAged),
                ),
                AppTextField(controller: cubit.salaryController, hint: 'Ежемесячный доход'),
                const Text('Военнообязанный'),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Switch(value: state.military, onChanged: cubit.setMilitary),
                ),
                AppElevatedButton(
                  color: Colors.blue,
                  style: const TextStyle(color: Colors.white),
                  onTap: () {
                    cubit.createOrSave();
                  },
                  title: widget.user == null ? 'Создать' : 'Сохранить',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
