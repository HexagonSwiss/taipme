// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserLoginRequestModel _$UserLoginRequestModelFromJson(
        Map<String, dynamic> json) =>
    _UserLoginRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserLoginRequestModelToJson(
        _UserLoginRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
