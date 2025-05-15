// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_request_password_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRequestPasswordResponseModel {
  String get message;

  /// Create a copy of UserRequestPasswordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserRequestPasswordResponseModelCopyWith<UserRequestPasswordResponseModel>
      get copyWith => _$UserRequestPasswordResponseModelCopyWithImpl<
              UserRequestPasswordResponseModel>(
          this as UserRequestPasswordResponseModel, _$identity);

  /// Serializes this UserRequestPasswordResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserRequestPasswordResponseModel &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'UserRequestPasswordResponseModel(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UserRequestPasswordResponseModelCopyWith<$Res> {
  factory $UserRequestPasswordResponseModelCopyWith(
          UserRequestPasswordResponseModel value,
          $Res Function(UserRequestPasswordResponseModel) _then) =
      _$UserRequestPasswordResponseModelCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UserRequestPasswordResponseModelCopyWithImpl<$Res>
    implements $UserRequestPasswordResponseModelCopyWith<$Res> {
  _$UserRequestPasswordResponseModelCopyWithImpl(this._self, this._then);

  final UserRequestPasswordResponseModel _self;
  final $Res Function(UserRequestPasswordResponseModel) _then;

  /// Create a copy of UserRequestPasswordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserRequestPasswordResponseModel
    implements UserRequestPasswordResponseModel {
  const _UserRequestPasswordResponseModel({required this.message});
  factory _UserRequestPasswordResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$UserRequestPasswordResponseModelFromJson(json);

  @override
  final String message;

  /// Create a copy of UserRequestPasswordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserRequestPasswordResponseModelCopyWith<_UserRequestPasswordResponseModel>
      get copyWith => __$UserRequestPasswordResponseModelCopyWithImpl<
          _UserRequestPasswordResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserRequestPasswordResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserRequestPasswordResponseModel &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'UserRequestPasswordResponseModel(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$UserRequestPasswordResponseModelCopyWith<$Res>
    implements $UserRequestPasswordResponseModelCopyWith<$Res> {
  factory _$UserRequestPasswordResponseModelCopyWith(
          _UserRequestPasswordResponseModel value,
          $Res Function(_UserRequestPasswordResponseModel) _then) =
      __$UserRequestPasswordResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$UserRequestPasswordResponseModelCopyWithImpl<$Res>
    implements _$UserRequestPasswordResponseModelCopyWith<$Res> {
  __$UserRequestPasswordResponseModelCopyWithImpl(this._self, this._then);

  final _UserRequestPasswordResponseModel _self;
  final $Res Function(_UserRequestPasswordResponseModel) _then;

  /// Create a copy of UserRequestPasswordResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_UserRequestPasswordResponseModel(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
