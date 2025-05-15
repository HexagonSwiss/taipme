// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRegisterResponseModel {
  String? get message;
  String? get error;

  /// Create a copy of UserRegisterResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserRegisterResponseModelCopyWith<UserRegisterResponseModel> get copyWith =>
      _$UserRegisterResponseModelCopyWithImpl<UserRegisterResponseModel>(
          this as UserRegisterResponseModel, _$identity);

  /// Serializes this UserRegisterResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserRegisterResponseModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, error);

  @override
  String toString() {
    return 'UserRegisterResponseModel(message: $message, error: $error)';
  }
}

/// @nodoc
abstract mixin class $UserRegisterResponseModelCopyWith<$Res> {
  factory $UserRegisterResponseModelCopyWith(UserRegisterResponseModel value,
          $Res Function(UserRegisterResponseModel) _then) =
      _$UserRegisterResponseModelCopyWithImpl;
  @useResult
  $Res call({String? message, String? error});
}

/// @nodoc
class _$UserRegisterResponseModelCopyWithImpl<$Res>
    implements $UserRegisterResponseModelCopyWith<$Res> {
  _$UserRegisterResponseModelCopyWithImpl(this._self, this._then);

  final UserRegisterResponseModel _self;
  final $Res Function(UserRegisterResponseModel) _then;

  /// Create a copy of UserRegisterResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserRegisterResponseModel implements UserRegisterResponseModel {
  const _UserRegisterResponseModel({this.message, this.error});
  factory _UserRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseModelFromJson(json);

  @override
  final String? message;
  @override
  final String? error;

  /// Create a copy of UserRegisterResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserRegisterResponseModelCopyWith<_UserRegisterResponseModel>
      get copyWith =>
          __$UserRegisterResponseModelCopyWithImpl<_UserRegisterResponseModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserRegisterResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserRegisterResponseModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, error);

  @override
  String toString() {
    return 'UserRegisterResponseModel(message: $message, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$UserRegisterResponseModelCopyWith<$Res>
    implements $UserRegisterResponseModelCopyWith<$Res> {
  factory _$UserRegisterResponseModelCopyWith(_UserRegisterResponseModel value,
          $Res Function(_UserRegisterResponseModel) _then) =
      __$UserRegisterResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? message, String? error});
}

/// @nodoc
class __$UserRegisterResponseModelCopyWithImpl<$Res>
    implements _$UserRegisterResponseModelCopyWith<$Res> {
  __$UserRegisterResponseModelCopyWithImpl(this._self, this._then);

  final _UserRegisterResponseModel _self;
  final $Res Function(_UserRegisterResponseModel) _then;

  /// Create a copy of UserRegisterResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(_UserRegisterResponseModel(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
