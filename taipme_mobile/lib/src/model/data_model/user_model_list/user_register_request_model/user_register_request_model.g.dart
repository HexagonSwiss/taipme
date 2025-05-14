// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegisterRequestModelImpl _$$UserRegisterRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegisterRequestModelImpl(
      userName: json['userName'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$UserRegisterRequestModelImplToJson(
        _$UserRegisterRequestModelImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
    };
