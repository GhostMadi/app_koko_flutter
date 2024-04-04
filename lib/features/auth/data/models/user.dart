import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/features/auth/domain/enitites/user_entity.dart';

class MyUser extends Equatable {
  final String gmail;
  final String name;
  final String age;
  final String gender;
  final String school;
  final String majore;
  final String gpa;

  final String userId;
  String? picture;

  MyUser(
      {required this.name,
      required this.picture,
      required this.gmail,
      required this.age,
      required this.gender,
      required this.school,
      required this.majore,
      required this.gpa,
      required this.userId});

  static final empty = MyUser(
    picture: '',
    gmail: ' ',
    name: ' ',
    age: ' ',
    gender: ' ',
    school: ' ',
    majore: ' ',
    gpa: ' ',
    userId: ' ',
  );

  MyUser copyWith({
    final String? picture,
    final String? gmail,
    final String? name,
    final String? age,
    final String? gender,
    final String? school,
    final String? majore,
    final String? gpa,
    final String? userId,
  }) {
    return MyUser(
        picture: picture ?? this.picture,
        gmail: gmail ?? this.gmail,
        name: name ?? this.name,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        school: school ?? this.school,
        majore: majore ?? this.majore,
        gpa: gpa ?? this.gpa,
        userId: userId ?? this.userId);
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
        picture: picture!,
        gmail: gmail,
        name: name,
        age: age,
        gender: gender,
        school: school,
        majore: majore,
        gpa: gpa,
        userId: userId);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      picture: entity.picture,
      gmail: entity.gmail,
      name: entity.name,
      age: entity.age,
      gender: entity.gender,
      school: entity.school,
      majore: entity.majore,
      gpa: entity.gpa,
      userId: entity.userId,
    );
  }

  @override
  List<Object?> get props =>
      [picture, gmail, name, age, gender, school, majore, gpa];
}
