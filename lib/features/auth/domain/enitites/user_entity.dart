import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String gmail;

  final String name;
  final String age;
  final String gender;
  final String school;
  final String majore;
  final String gpa;
  final String userId;

  const MyUserEntity(
      {required this.name,
      required this.gmail,
      required this.age,
      required this.gender,
      required this.school,
      required this.majore,
      required this.gpa,
      required this.userId});

  Map<String, Object?> toDocument() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'school': school,
      'majore': majore,
      'gpa': gpa,
      'userId': userId,
      'gmail': gmail,

    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> map) {
    return MyUserEntity(
      gmail:map['gmail'],
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
      school: map['school'],
      majore: map['majore'],
      gpa: map['gpa'],
      userId: map['userId'],
    );
  }

  @override
  List<Object?> get props => [gmail,name,age,gender,school,majore,gpa,userId];
}
