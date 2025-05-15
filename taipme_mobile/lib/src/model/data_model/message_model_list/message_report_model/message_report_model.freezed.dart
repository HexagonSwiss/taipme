// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageReportModel {
  String get idMsg;
  String get desMot;
  int? get idMsgSegn;
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get datSegn;
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get datUltMov;
  String? get idUteSegn;
  bool get isExpanded;

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageReportModelCopyWith<MessageReportModel> get copyWith =>
      _$MessageReportModelCopyWithImpl<MessageReportModel>(
          this as MessageReportModel, _$identity);

  /// Serializes this MessageReportModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageReportModel &&
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

  @override
  String toString() {
    return 'MessageReportModel(idMsg: $idMsg, desMot: $desMot, idMsgSegn: $idMsgSegn, datSegn: $datSegn, datUltMov: $datUltMov, idUteSegn: $idUteSegn, isExpanded: $isExpanded)';
  }
}

/// @nodoc
abstract mixin class $MessageReportModelCopyWith<$Res> {
  factory $MessageReportModelCopyWith(
          MessageReportModel value, $Res Function(MessageReportModel) _then) =
      _$MessageReportModelCopyWithImpl;
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
class _$MessageReportModelCopyWithImpl<$Res>
    implements $MessageReportModelCopyWith<$Res> {
  _$MessageReportModelCopyWithImpl(this._self, this._then);

  final MessageReportModel _self;
  final $Res Function(MessageReportModel) _then;

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
    return _then(_self.copyWith(
      idMsg: null == idMsg
          ? _self.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as String,
      desMot: null == desMot
          ? _self.desMot
          : desMot // ignore: cast_nullable_to_non_nullable
              as String,
      idMsgSegn: freezed == idMsgSegn
          ? _self.idMsgSegn
          : idMsgSegn // ignore: cast_nullable_to_non_nullable
              as int?,
      datSegn: freezed == datSegn
          ? _self.datSegn
          : datSegn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datUltMov: freezed == datUltMov
          ? _self.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idUteSegn: freezed == idUteSegn
          ? _self.idUteSegn
          : idUteSegn // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MessageReportModel implements MessageReportModel {
  const _MessageReportModel(
      {required this.idMsg,
      required this.desMot,
      this.idMsgSegn,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      this.datSegn,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      this.datUltMov,
      this.idUteSegn,
      this.isExpanded = false});
  factory _MessageReportModel.fromJson(Map<String, dynamic> json) =>
      _$MessageReportModelFromJson(json);

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

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageReportModelCopyWith<_MessageReportModel> get copyWith =>
      __$MessageReportModelCopyWithImpl<_MessageReportModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageReportModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageReportModel &&
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

  @override
  String toString() {
    return 'MessageReportModel(idMsg: $idMsg, desMot: $desMot, idMsgSegn: $idMsgSegn, datSegn: $datSegn, datUltMov: $datUltMov, idUteSegn: $idUteSegn, isExpanded: $isExpanded)';
  }
}

/// @nodoc
abstract mixin class _$MessageReportModelCopyWith<$Res>
    implements $MessageReportModelCopyWith<$Res> {
  factory _$MessageReportModelCopyWith(
          _MessageReportModel value, $Res Function(_MessageReportModel) _then) =
      __$MessageReportModelCopyWithImpl;
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
class __$MessageReportModelCopyWithImpl<$Res>
    implements _$MessageReportModelCopyWith<$Res> {
  __$MessageReportModelCopyWithImpl(this._self, this._then);

  final _MessageReportModel _self;
  final $Res Function(_MessageReportModel) _then;

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idMsg = null,
    Object? desMot = null,
    Object? idMsgSegn = freezed,
    Object? datSegn = freezed,
    Object? datUltMov = freezed,
    Object? idUteSegn = freezed,
    Object? isExpanded = null,
  }) {
    return _then(_MessageReportModel(
      idMsg: null == idMsg
          ? _self.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as String,
      desMot: null == desMot
          ? _self.desMot
          : desMot // ignore: cast_nullable_to_non_nullable
              as String,
      idMsgSegn: freezed == idMsgSegn
          ? _self.idMsgSegn
          : idMsgSegn // ignore: cast_nullable_to_non_nullable
              as int?,
      datSegn: freezed == datSegn
          ? _self.datSegn
          : datSegn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datUltMov: freezed == datUltMov
          ? _self.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idUteSegn: freezed == idUteSegn
          ? _self.idUteSegn
          : idUteSegn // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
