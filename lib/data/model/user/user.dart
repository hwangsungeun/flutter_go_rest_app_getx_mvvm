
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User {
  User({
    this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  int? id;
  final String name;
  final String email;
  final Gender gender;
  @JsonKey(name: "status")
  final UserStatus status;

  Map<String, dynamic> toJson() => _$UserToJson(this);

}

@JsonEnum()
enum Gender {male, female, all}

@JsonEnum()
enum UserStatus {inactive, active, all}