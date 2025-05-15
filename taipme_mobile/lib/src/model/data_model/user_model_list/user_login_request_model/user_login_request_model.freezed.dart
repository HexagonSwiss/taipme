// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_login_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserLoginRequestModel {
  String get email;
  String get password;

  /// Create a copy of UserLoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserLoginRequestModelCopyWith<UserLoginRequestModel> get copyWith =>
      _$UserLoginRequestModelCopyWithImpl<UserLoginRequestModel>(
          this as UserLoginRequestModel, _$identity);

  /// Serializes this UserLoginRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserLoginRequestModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'UserLoginRequestModel(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $UserLoginRequestModelCopyWith<$Res> {
  factory $UserLoginRequestModelCopyWith(UserLoginRequestModel value,
          $Res Function(UserLoginRequestModel) _then) =
      _$UserLoginRequestModelCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$UserLoginRequestModelCopyWithImpl<$Res>
    implements $UserLoginRequestModelCopyWith<$Res> {
  _$UserLoginRequestModelCopyWithImpl(this._self, this._then);

  final UserLoginRequestModel _self;
  final $Res Function(UserLoginRequestModel) _then;

  /// Create a copy of UserLoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
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
class _UserLoginRequestModel implements UserLoginRequestModel {
  const _UserLoginRequestModel({required this.email, required this.password});
  factory _UserLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestModelFromJson(json);

  @override
  final String email;
  @override
  final String password;

  /// Create a copy of UserLoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserLoginRequestModelCopyWith<_UserLoginRequestModel> get copyWith =>
      __$UserLoginRequestModelCopyWithImpl<_UserLoginRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserLoginRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserLoginRequestModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'UserLoginRequestModel(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$UserLoginRequestModelCopyWith<$Res>
    implements $UserLoginRequestModelCopyWith<$Res> {
  factory _$UserLoginRequestModelCopyWith(_UserLoginRequestModel value,
          $Res Function(_UserLoginRequestModel) _then) =
      __$UserLoginRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$UserLoginRequestModelCopyWithImpl<$Res>
    implements _$UserLoginRequestModelCopyWith<$Res> {
  __$UserLoginRequestModelCopyWithImpl(this._self, this._then);

  final _UserLoginRequestModel _self;
  final $Res Function(_UserLoginRequestModel) _then;

  /// Create a copy of UserLoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_UserLoginRequestModel(
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
