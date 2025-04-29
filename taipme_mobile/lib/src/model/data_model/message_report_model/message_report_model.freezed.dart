// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageReportModel _$MessageReportModelFromJson(Map<String, dynamic> json) {
  return _MessageReportModel.fromJson(json);
}

/// @nodoc
mixin _$MessageReportModel {
  String get idMsg => throw _privateConstructorUsedError;
  String get desMot => throw _privateConstructorUsedError;
  int? get idMsgSegn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get datSegn => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get datUltMov => throw _privateConstructorUsedError;
  String? get idUteSegn => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;

  /// Serializes this MessageReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageReportModelCopyWith<MessageReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageReportModelCopyWith<$Res> {
  factory $MessageReportModelCopyWith(
          MessageReportModel value, $Res Function(MessageReportModel) then) =
      _$MessageReportModelCopyWithImpl<$Res, MessageReportModel>;
  @useResult
  $Res call(
      {String idMsg,
      String desMot,
      int? idMsgSegn,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? datSegn,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? datUltMov,
      String? idUteSegn,
      bool isExpanded});
}

/// @nodoc
class _$MessageReportModelCopyWithImpl<$Res, $Val extends MessageReportModel>
    implements $MessageReportModelCopyWith<$Res> {
  _$MessageReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMsg = null,
    Object? desMot = null,
    Object? idMsgSegn = freezed,
    Object? datSegn = freezed,
    Object? datUltMov = freezed,
    Object? idUteSegn = freezed,
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      idMsg: null == idMsg
          ? _value.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as String,
      desMot: null == desMot
          ? _value.desMot
          : desMot // ignore: cast_nullable_to_non_nullable
              as String,
      idMsgSegn: freezed == idMsgSegn
          ? _value.idMsgSegn
          : idMsgSegn // ignore: cast_nullable_to_non_nullable
              as int?,
      datSegn: freezed == datSegn
          ? _value.datSegn
          : datSegn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datUltMov: freezed == datUltMov
          ? _value.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idUteSegn: freezed == idUteSegn
          ? _value.idUteSegn
          : idUteSegn // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageReportModelImplCopyWith<$Res>
    implements $MessageReportModelCopyWith<$Res> {
  factory _$$MessageReportModelImplCopyWith(_$MessageReportModelImpl value,
          $Res Function(_$MessageReportModelImpl) then) =
      __$$MessageReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idMsg,
      String desMot,
      int? idMsgSegn,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? datSegn,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? datUltMov,
      String? idUteSegn,
      bool isExpanded});
}

/// @nodoc
class __$$MessageReportModelImplCopyWithImpl<$Res>
    extends _$MessageReportModelCopyWithImpl<$Res, _$MessageReportModelImpl>
    implements _$$MessageReportModelImplCopyWith<$Res> {
  __$$MessageReportModelImplCopyWithImpl(_$MessageReportModelImpl _value,
      $Res Function(_$MessageReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMsg = null,
    Object? desMot = null,
    Object? idMsgSegn = freezed,
    Object? datSegn = freezed,
    Object? datUltMov = freezed,
    Object? idUteSegn = freezed,
    Object? isExpanded = null,
  }) {
    return _then(_$MessageReportModelImpl(
      idMsg: null == idMsg
          ? _value.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as String,
      desMot: null == desMot
          ? _value.desMot
          : desMot // ignore: cast_nullable_to_non_nullable
              as String,
      idMsgSegn: freezed == idMsgSegn
          ? _value.idMsgSegn
          : idMsgSegn // ignore: cast_nullable_to_non_nullable
              as int?,
      datSegn: freezed == datSegn
          ? _value.datSegn
          : datSegn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datUltMov: freezed == datUltMov
          ? _value.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idUteSegn: freezed == idUteSegn
          ? _value.idUteSegn
          : idUteSegn // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageReportModelImpl implements _MessageReportModel {
  const _$MessageReportModelImpl(
      {required this.idMsg,
      required this.desMot,
      this.idMsgSegn,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      this.datSegn,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      this.datUltMov,
      this.idUteSegn,
      this.isExpanded = false});

  factory _$MessageReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageReportModelImplFromJson(json);

  @override
  final String idMsg;
  @override
  final String desMot;
  @override
  final int? idMsgSegn;
  @override
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  final DateTime? datSegn;
  @override
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  final DateTime? datUltMov;
  @override
  final String? idUteSegn;
  @override
  @JsonKey()
  final bool isExpanded;

  @override
  String toString() {
    return 'MessageReportModel(idMsg: $idMsg, desMot: $desMot, idMsgSegn: $idMsgSegn, datSegn: $datSegn, datUltMov: $datUltMov, idUteSegn: $idUteSegn, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageReportModelImpl &&
            (identical(other.idMsg, idMsg) || other.idMsg == idMsg) &&
            (identical(other.desMot, desMot) || other.desMot == desMot) &&
            (identical(other.idMsgSegn, idMsgSegn) ||
                other.idMsgSegn == idMsgSegn) &&
            (identical(other.datSegn, datSegn) || other.datSegn == datSegn) &&
            (identical(other.datUltMov, datUltMov) ||
                other.datUltMov == datUltMov) &&
            (identical(other.idUteSegn, idUteSegn) ||
                other.idUteSegn == idUteSegn) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idMsg, desMot, idMsgSegn,
      datSegn, datUltMov, idUteSegn, isExpanded);

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageReportModelImplCopyWith<_$MessageReportModelImpl> get copyWith =>
      __$$MessageReportModelImplCopyWithImpl<_$MessageReportModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageReportModelImplToJson(
      this,
    );
  }
}

abstract class _MessageReportModel implements MessageReportModel {
  const factory _MessageReportModel(
      {required final String idMsg,
      required final String desMot,
      final int? idMsgSegn,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      final DateTime? datSegn,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      final DateTime? datUltMov,
      final String? idUteSegn,
      final bool isExpanded}) = _$MessageReportModelImpl;

  factory _MessageReportModel.fromJson(Map<String, dynamic> json) =
      _$MessageReportModelImpl.fromJson;

  @override
  String get idMsg;
  @override
  String get desMot;
  @override
  int? get idMsgSegn;
  @override
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get datSegn;
  @override
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get datUltMov;
  @override
  String? get idUteSegn;
  @override
  bool get isExpanded;

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageReportModelImplCopyWith<_$MessageReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
