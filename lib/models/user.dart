// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class User {
  final String username;
  final String firstName;
  final String middleName;
  final String lastName;
  final int age;
  final String password;
  final String address;
  final String city;
  final String state;
  final String country;

  const User({
    required this.username,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.age,
    required this.password,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
  });

  User copyWith({
    String? username,
    String? firstName,
    String? middleName,
    String? lastName,
    int? age,
    String? password,
    String? address,
    String? city,
    String? state,
    String? country,
  }) {
    return User(
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      password: password ?? this.password,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'age': age,
      'password': password,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      firstName: map['firstName'] as String,
      middleName: map['middleName'] as String,
      lastName: map['lastName'] as String,
      age: map['age'] as int,
      password: map['password'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(username: $username, firstName: $firstName, middleName: $middleName, lastName: $lastName, age: $age, password: $password, address: $address, city: $city, state: $state, country: $country)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.lastName == lastName &&
        other.age == age &&
        other.password == password &&
        other.address == address &&
        other.city == city &&
        other.state == state &&
        other.country == country;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        firstName.hashCode ^
        middleName.hashCode ^
        lastName.hashCode ^
        age.hashCode ^
        password.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode;
  }
}

class UserNotifier extends StateNotifier<User?> {
  UserNotifier(super.state);

  void setUser(User user) {
    state = user;
  }

  void updateUser() {
    state = state!.copyWith();
  }
}
