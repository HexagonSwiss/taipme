// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get firebaseMessagingId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get profileImage =>
      throw _privateConstructorUsedError; // Download URL OR StoragePath
  String? get addressString => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;
  bool get consentToTermsOfService => throw _privateConstructorUsedError;
  bool get consentToPrivacyPolicy => throw _privateConstructorUsedError;
  bool get consentToNewsletter => throw _privateConstructorUsedError;
  bool get consentToPushNotifications => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      DateTime? birthDate,
      String? id,
      String? firebaseMessagingId,
      String? email,
      String? password,
      String? phoneNumber,
      String? name,
      String? lastName,
      String? profileImage,
      String? addressString,
      bool isEmailVerified,
      bool consentToTermsOfService,
      bool consentToPrivacyPolicy,
      bool consentToNewsletter,
      bool consentToPushNotifications});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? birthDate = freezed,
    Object? id = freezed,
    Object? firebaseMessagingId = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneNumber = freezed,
    Object? name = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? addressString = freezed,
    Object? isEmailVerified = null,
    Object? consentToTermsOfService = null,
    Object? consentToPrivacyPolicy = null,
    Object? consentToNewsletter = null,
    Object? consentToPushNotifications = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseMessagingId: freezed == firebaseMessagingId
          ? _value.firebaseMessagingId
          : firebaseMessagingId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      addressString: freezed == addressString
          ? _value.addressString
          : addressString // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      consentToTermsOfService: null == consentToTermsOfService
          ? _value.consentToTermsOfService
          : consentToTermsOfService // ignore: cast_nullable_to_non_nullable
              as bool,
      consentToPrivacyPolicy: null == consentToPrivacyPolicy
          ? _value.consentToPrivacyPolicy
          : consentToPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      consentToNewsletter: null == consentToNewsletter
          ? _value.consentToNewsletter
          : consentToNewsletter // ignore: cast_nullable_to_non_nullable
              as bool,
      consentToPushNotifications: null == consentToPushNotifications
          ? _value.consentToPushNotifications
          : consentToPushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? deletedAt,
      DateTime? birthDate,
      String? id,
      String? firebaseMessagingId,
      String? email,
      String? password,
      String? phoneNumber,
      String? name,
      String? lastName,
      String? profileImage,
      String? addressString,
      bool isEmailVerified,
      bool consentToTermsOfService,
      bool consentToPrivacyPolicy,
      bool consentToNewsletter,
      bool consentToPushNotifications});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? birthDate = freezed,
    Object? id = freezed,
    Object? firebaseMessagingId = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? phoneNumber = freezed,
    Object? name = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? addressString = freezed,
    Object? isEmailVerified = null,
    Object? consentToTermsOfService = null,
    Object? consentToPrivacyPolicy = null,
    Object? consentToNewsletter = null,
    Object? consentToPushNotifications = null,
  }) {
    return _then(_$UserModelImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseMessagingId: freezed == firebaseMessagingId
          ? _value.firebaseMessagingId
          : firebaseMessagingId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      addressString: freezed == addressString
          ? _value.addressString
          : addressString // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      consentToTermsOfService: null == consentToTermsOfService
          ? _value.consentToTermsOfService
          : consentToTermsOfService // ignore: cast_nullable_to_non_nullable
              as bool,
      consentToPrivacyPolicy: null == consentToPrivacyPolicy
          ? _value.consentToPrivacyPolicy
          : consentToPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      consentToNewsletter: null == consentToNewsletter
          ? _value.consentToNewsletter
          : consentToNewsletter // ignore: cast_nullable_to_non_nullable
              as bool,
      consentToPushNotifications: null == consentToPushNotifications
          ? _value.consentToPushNotifications
          : consentToPushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.birthDate,
      this.id,
      this.firebaseMessagingId,
      this.email,
      this.password,
      this.phoneNumber,
      this.name,
      this.lastName,
      this.profileImage,
      this.addressString,
      this.isEmailVerified = false,
      this.consentToTermsOfService = false,
      this.consentToPrivacyPolicy = false,
      this.consentToNewsletter = false,
      this.consentToPushNotifications = false});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deletedAt;
  @override
  final DateTime? birthDate;
  @override
  final String? id;
  @override
  final String? firebaseMessagingId;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? phoneNumber;
  @override
  final String? name;
  @override
  final String? lastName;
  @override
  final String? profileImage;
// Download URL OR StoragePath
  @override
  final String? addressString;
  @override
  @JsonKey()
  final bool isEmailVerified;
  @override
  @JsonKey()
  final bool consentToTermsOfService;
  @override
  @JsonKey()
  final bool consentToPrivacyPolicy;
  @override
  @JsonKey()
  final bool consentToNewsletter;
  @override
  @JsonKey()
  final bool consentToPushNotifications;

  @override
  String toString() {
    return 'UserModel(createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, birthDate: $birthDate, id: $id, firebaseMessagingId: $firebaseMessagingId, email: $email, password: $password, phoneNumber: $phoneNumber, name: $name, lastName: $lastName, profileImage: $profileImage, addressString: $addressString, isEmailVerified: $isEmailVerified, consentToTermsOfService: $consentToTermsOfService, consentToPrivacyPolicy: $consentToPrivacyPolicy, consentToNewsletter: $consentToNewsletter, consentToPushNotifications: $consentToPushNotifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firebaseMessagingId, firebaseMessagingId) ||
                other.firebaseMessagingId == firebaseMessagingId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.addressString, addressString) ||
                other.addressString == addressString) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(
                    other.consentToTermsOfService, consentToTermsOfService) ||
                other.consentToTermsOfService == consentToTermsOfService) &&
            (identical(other.consentToPrivacyPolicy, consentToPrivacyPolicy) ||
                other.consentToPrivacyPolicy == consentToPrivacyPolicy) &&
            (identical(other.consentToNewsletter, consentToNewsletter) ||
                other.consentToNewsletter == consentToNewsletter) &&
            (identical(other.consentToPushNotifications,
                    consentToPushNotifications) ||
                other.consentToPushNotifications ==
                    consentToPushNotifications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      updatedAt,
      deletedAt,
      birthDate,
      id,
      firebaseMessagingId,
      email,
      password,
      phoneNumber,
      name,
      lastName,
      profileImage,
      addressString,
      isEmailVerified,
      consentToTermsOfService,
      consentToPrivacyPolicy,
      consentToNewsletter,
      consentToPushNotifications);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final DateTime? createdAt,
      final DateTime? updatedAt,
      final DateTime? deletedAt,
      final DateTime? birthDate,
      final String? id,
      final String? firebaseMessagingId,
      final String? email,
      final String? password,
      final String? phoneNumber,
      final String? name,
      final String? lastName,
      final String? profileImage,
      final String? addressString,
      final bool isEmailVerified,
      final bool consentToTermsOfService,
      final bool consentToPrivacyPolicy,
      final bool consentToNewsletter,
      final bool consentToPushNotifications}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deletedAt;
  @override
  DateTime? get birthDate;
  @override
  String? get id;
  @override
  String? get firebaseMessagingId;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get phoneNumber;
  @override
  String? get name;
  @override
  String? get lastName;
  @override
  String? get profileImage; // Download URL OR StoragePath
  @override
  String? get addressString;
  @override
  bool get isEmailVerified;
  @override
  bool get consentToTermsOfService;
  @override
  bool get consentToPrivacyPolicy;
  @override
  bool get consentToNewsletter;
  @override
  bool get consentToPushNotifications;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
