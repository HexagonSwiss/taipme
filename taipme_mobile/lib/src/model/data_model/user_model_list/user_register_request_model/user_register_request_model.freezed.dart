// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRegisterRequestModel {
  String? get userName;
  String get email;
  String get password;

  /// Create a copy of UserRegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserRegisterRequestModelCopyWith<UserRegisterRequestModel> get copyWith =>
      _$UserRegisterRequestModelCopyWithImpl<UserRegisterRequestModel>(
          this as UserRegisterRequestModel, _$identity);

  /// Serializes this UserRegisterRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserRegisterRequestModel &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userName, email, password);

  @override
  String toString() {
    return 'UserRegisterRequestModel(userName: $userName, email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $UserRegisterRequestModelCopyWith<$Res> {
  factory $UserRegisterRequestModelCopyWith(UserRegisterRequestModel value,
          $Res Function(UserRegisterRequestModel) _then) =
      _$UserRegisterRequestModelCopyWithImpl;
  @useResult
  $Res call({String? userName, String email, String password});
}

/// @nodoc
class _$UserRegisterRequestModelCopyWithImpl<$Res>
    implements $UserRegisterRequestModelCopyWith<$Res> {
  _$UserRegisterRequestModelCopyWithImpl(this._self, this._then);

  final UserRegisterRequestModel _self;
  final $Res Function(UserRegisterRequestModel) _then;

  /// Create a copy of UserRegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserRegisterRequestModel implements UserRegisterRequestModel {
  const _UserRegisterRequestModel(
      {this.userName, required this.email, required this.password});
  factory _UserRegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRequestModelFromJson(json);

  @override
  final String? userName;
  @override
  final String email;
  @override
  final String password;

  /// Create a copy of UserRegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserRegisterRequestModelCopyWith<_UserRegisterRequestModel> get copyWith =>
      __$UserRegisterRequestModelCopyWithImpl<_UserRegisterRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserRegisterRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserRegisterRequestModel &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userName, email, password);

  @override
  String toString() {
    return 'UserRegisterRequestModel(userName: $userName, email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$UserRegisterRequestModelCopyWith<$Res>
    implements $UserRegisterRequestModelCopyWith<$Res> {
  factory _$UserRegisterRequestModelCopyWith(_UserRegisterRequestModel value,
          $Res Function(_UserRegisterRequestModel) _then) =
      __$UserRegisterRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? userName, String email, String password});
}

/// @nodoc
class __$UserRegisterRequestModelCopyWithImpl<$Res>
    implements _$UserRegisterRequestModelCopyWith<$Res> {
  __$UserRegisterRequestModelCopyWithImpl(this._self, this._then);

  final _UserRegisterRequestModel _self;
  final $Res Function(_UserRegisterRequestModel) _then;

  /// Create a copy of UserRegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userName = freezed,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_UserRegisterRequestModel(
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
