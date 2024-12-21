
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_go_rest_app_getx_mvvm/features/user/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User extends UserEntity{
  User({
    super.id,
    required super.name,
    required super.email,
    required super.gender,
    required super.status,});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}