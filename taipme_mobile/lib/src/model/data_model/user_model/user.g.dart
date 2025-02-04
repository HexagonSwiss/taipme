// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      id: json['id'] as String?,
      firebaseMessagingId: json['firebaseMessagingId'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      lastName: json['lastName'] as String?,
      profileImage: json['profileImage'] as String?,
      addressString: json['addressString'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      consentToTermsOfService:
          json['consentToTermsOfService'] as bool? ?? false,
      consentToPrivacyPolicy: json['consentToPrivacyPolicy'] as bool? ?? false,
      consentToNewsletter: json['consentToNewsletter'] as bool? ?? false,
      consentToPushNotifications:
          json['consentToPushNotifications'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'birthDate': instance.birthDate?.toIso8601String(),
      'id': instance.id,
      'firebaseMessagingId': instance.firebaseMessagingId,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'lastName': instance.lastName,
      'profileImage': instance.profileImage,
      'addressString': instance.addressString,
      'isEmailVerified': instance.isEmailVerified,
      'consentToTermsOfService': instance.consentToTermsOfService,
      'consentToPrivacyPolicy': instance.consentToPrivacyPolicy,
      'consentToNewsletter': instance.consentToNewsletter,
      'consentToPushNotifications': instance.consentToPushNotifications,
    };
