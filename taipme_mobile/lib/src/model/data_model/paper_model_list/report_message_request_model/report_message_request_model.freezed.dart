// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_message_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportMessageRequestModel {
  int get messageId;
  String get reason;

  /// Create a copy of ReportMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportMessageRequestModelCopyWith<ReportMessageRequestModel> get copyWith =>
      _$ReportMessageRequestModelCopyWithImpl<ReportMessageRequestModel>(
          this as ReportMessageRequestModel, _$identity);

  /// Serializes this ReportMessageRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportMessageRequestModel &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, reason);

  @override
  String toString() {
    return 'ReportMessageRequestModel(messageId: $messageId, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $ReportMessageRequestModelCopyWith<$Res> {
  factory $ReportMessageRequestModelCopyWith(ReportMessageRequestModel value,
          $Res Function(ReportMessageRequestModel) _then) =
      _$ReportMessageRequestModelCopyWithImpl;
  @useResult
  $Res call({int messageId, String reason});
}

/// @nodoc
class _$ReportMessageRequestModelCopyWithImpl<$Res>
    implements $ReportMessageRequestModelCopyWith<$Res> {
  _$ReportMessageRequestModelCopyWithImpl(this._self, this._then);

  final ReportMessageRequestModel _self;
  final $Res Function(ReportMessageRequestModel) _then;

  /// Create a copy of ReportMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? reason = null,
  }) {
    return _then(_self.copyWith(
      messageId: null == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReportMessageRequestModel implements ReportMessageRequestModel {
  const _ReportMessageRequestModel(
      {required this.messageId, required this.reason});
  factory _ReportMessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ReportMessageRequestModelFromJson(json);

  @override
  final int messageId;
  @override
  final String reason;

  /// Create a copy of ReportMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportMessageRequestModelCopyWith<_ReportMessageRequestModel>
      get copyWith =>
          __$ReportMessageRequestModelCopyWithImpl<_ReportMessageRequestModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReportMessageRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportMessageRequestModel &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageId, reason);

  @override
  String toString() {
    return 'ReportMessageRequestModel(messageId: $messageId, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class _$ReportMessageRequestModelCopyWith<$Res>
    implements $ReportMessageRequestModelCopyWith<$Res> {
  factory _$ReportMessageRequestModelCopyWith(_ReportMessageRequestModel value,
          $Res Function(_ReportMessageRequestModel) _then) =
      __$ReportMessageRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call({int messageId, String reason});
}

/// @nodoc
class __$ReportMessageRequestModelCopyWithImpl<$Res>
    implements _$ReportMessageRequestModelCopyWith<$Res> {
  __$ReportMessageRequestModelCopyWithImpl(this._self, this._then);

  final _ReportMessageRequestModel _self;
  final $Res Function(_ReportMessageRequestModel) _then;

  /// Create a copy of ReportMessageRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messageId = null,
    Object? reason = null,
  }) {
    return _then(_ReportMessageRequestModel(
      messageId: null == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
