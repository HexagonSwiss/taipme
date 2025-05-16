// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageModel {
  int get idMsg;
  String? get desMsg;
  String? get titMsg;
  int? get idUteAut;
  String? get emailAut;
  int? get idUteReply;
  int? get idMsgReply;
  String? get codTipMsg;
  String? get desTipMsg;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get datUltMov;
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  DateTime? get dataPub;
  int get idFoglio;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageModelCopyWith<MessageModel> get copyWith =>
      _$MessageModelCopyWithImpl<MessageModel>(
          this as MessageModel, _$identity);

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageModel &&
            (identical(other.idMsg, idMsg) || other.idMsg == idMsg) &&
            (identical(other.desMsg, desMsg) || other.desMsg == desMsg) &&
            (identical(other.titMsg, titMsg) || other.titMsg == titMsg) &&
            (identical(other.idUteAut, idUteAut) ||
                other.idUteAut == idUteAut) &&
            (identical(other.emailAut, emailAut) ||
                other.emailAut == emailAut) &&
            (identical(other.idUteReply, idUteReply) ||
                other.idUteReply == idUteReply) &&
            (identical(other.idMsgReply, idMsgReply) ||
                other.idMsgReply == idMsgReply) &&
            (identical(other.codTipMsg, codTipMsg) ||
                other.codTipMsg == codTipMsg) &&
            (identical(other.desTipMsg, desTipMsg) ||
                other.desTipMsg == desTipMsg) &&
            (identical(other.datUltMov, datUltMov) ||
                other.datUltMov == datUltMov) &&
            (identical(other.dataPub, dataPub) || other.dataPub == dataPub) &&
            (identical(other.idFoglio, idFoglio) ||
                other.idFoglio == idFoglio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idMsg,
      desMsg,
      titMsg,
      idUteAut,
      emailAut,
      idUteReply,
      idMsgReply,
      codTipMsg,
      desTipMsg,
      datUltMov,
      dataPub,
      idFoglio);

  @override
  String toString() {
    return 'MessageModel(idMsg: $idMsg, desMsg: $desMsg, titMsg: $titMsg, idUteAut: $idUteAut, emailAut: $emailAut, idUteReply: $idUteReply, idMsgReply: $idMsgReply, codTipMsg: $codTipMsg, desTipMsg: $desTipMsg, datUltMov: $datUltMov, dataPub: $dataPub, idFoglio: $idFoglio)';
  }
}

/// @nodoc
abstract mixin class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) _then) =
      _$MessageModelCopyWithImpl;
  @useResult
  $Res call(
      {int idMsg,
      String? desMsg,
      String? titMsg,
      int? idUteAut,
      String? emailAut,
      int? idUteReply,
      int? idMsgReply,
      String? codTipMsg,
      String? desTipMsg,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? datUltMov,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? dataPub,
      int idFoglio});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res> implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._self, this._then);

  final MessageModel _self;
  final $Res Function(MessageModel) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMsg = null,
    Object? desMsg = freezed,
    Object? titMsg = freezed,
    Object? idUteAut = freezed,
    Object? emailAut = freezed,
    Object? idUteReply = freezed,
    Object? idMsgReply = freezed,
    Object? codTipMsg = freezed,
    Object? desTipMsg = freezed,
    Object? datUltMov = freezed,
    Object? dataPub = freezed,
    Object? idFoglio = null,
  }) {
    return _then(_self.copyWith(
      idMsg: null == idMsg
          ? _self.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as int,
      desMsg: freezed == desMsg
          ? _self.desMsg
          : desMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      titMsg: freezed == titMsg
          ? _self.titMsg
          : titMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      idUteAut: freezed == idUteAut
          ? _self.idUteAut
          : idUteAut // ignore: cast_nullable_to_non_nullable
              as int?,
      emailAut: freezed == emailAut
          ? _self.emailAut
          : emailAut // ignore: cast_nullable_to_non_nullable
              as String?,
      idUteReply: freezed == idUteReply
          ? _self.idUteReply
          : idUteReply // ignore: cast_nullable_to_non_nullable
              as int?,
      idMsgReply: freezed == idMsgReply
          ? _self.idMsgReply
          : idMsgReply // ignore: cast_nullable_to_non_nullable
              as int?,
      codTipMsg: freezed == codTipMsg
          ? _self.codTipMsg
          : codTipMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      desTipMsg: freezed == desTipMsg
          ? _self.desTipMsg
          : desTipMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      datUltMov: freezed == datUltMov
          ? _self.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataPub: freezed == dataPub
          ? _self.dataPub
          : dataPub // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idFoglio: null == idFoglio
          ? _self.idFoglio
          : idFoglio // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MessageModel implements MessageModel {
  const _MessageModel(
      {required this.idMsg,
      this.desMsg,
      this.titMsg,
      this.idUteAut,
      this.emailAut,
      this.idUteReply,
      this.idMsgReply,
      this.codTipMsg,
      this.desTipMsg,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      this.datUltMov,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      this.dataPub,
      required this.idFoglio});
  factory _MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  @override
  final int idMsg;
  @override
  final String? desMsg;
  @override
  final String? titMsg;
  @override
  final int? idUteAut;
  @override
  final String? emailAut;
  @override
  final int? idUteReply;
  @override
  final int? idMsgReply;
  @override
  final String? codTipMsg;
  @override
  final String? desTipMsg;
  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? datUltMov;
  @override
  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
  final DateTime? dataPub;
  @override
  final int idFoglio;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageModelCopyWith<_MessageModel> get copyWith =>
      __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageModel &&
            (identical(other.idMsg, idMsg) || other.idMsg == idMsg) &&
            (identical(other.desMsg, desMsg) || other.desMsg == desMsg) &&
            (identical(other.titMsg, titMsg) || other.titMsg == titMsg) &&
            (identical(other.idUteAut, idUteAut) ||
                other.idUteAut == idUteAut) &&
            (identical(other.emailAut, emailAut) ||
                other.emailAut == emailAut) &&
            (identical(other.idUteReply, idUteReply) ||
                other.idUteReply == idUteReply) &&
            (identical(other.idMsgReply, idMsgReply) ||
                other.idMsgReply == idMsgReply) &&
            (identical(other.codTipMsg, codTipMsg) ||
                other.codTipMsg == codTipMsg) &&
            (identical(other.desTipMsg, desTipMsg) ||
                other.desTipMsg == desTipMsg) &&
            (identical(other.datUltMov, datUltMov) ||
                other.datUltMov == datUltMov) &&
            (identical(other.dataPub, dataPub) || other.dataPub == dataPub) &&
            (identical(other.idFoglio, idFoglio) ||
                other.idFoglio == idFoglio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idMsg,
      desMsg,
      titMsg,
      idUteAut,
      emailAut,
      idUteReply,
      idMsgReply,
      codTipMsg,
      desTipMsg,
      datUltMov,
      dataPub,
      idFoglio);

  @override
  String toString() {
    return 'MessageModel(idMsg: $idMsg, desMsg: $desMsg, titMsg: $titMsg, idUteAut: $idUteAut, emailAut: $emailAut, idUteReply: $idUteReply, idMsgReply: $idMsgReply, codTipMsg: $codTipMsg, desTipMsg: $desTipMsg, datUltMov: $datUltMov, dataPub: $dataPub, idFoglio: $idFoglio)';
  }
}

/// @nodoc
abstract mixin class _$MessageModelCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(
          _MessageModel value, $Res Function(_MessageModel) _then) =
      __$MessageModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int idMsg,
      String? desMsg,
      String? titMsg,
      int? idUteAut,
      String? emailAut,
      int? idUteReply,
      int? idMsgReply,
      String? codTipMsg,
      String? desTipMsg,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? datUltMov,
      @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
      DateTime? dataPub,
      int idFoglio});
}

/// @nodoc
class __$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(this._self, this._then);

  final _MessageModel _self;
  final $Res Function(_MessageModel) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idMsg = null,
    Object? desMsg = freezed,
    Object? titMsg = freezed,
    Object? idUteAut = freezed,
    Object? emailAut = freezed,
    Object? idUteReply = freezed,
    Object? idMsgReply = freezed,
    Object? codTipMsg = freezed,
    Object? desTipMsg = freezed,
    Object? datUltMov = freezed,
    Object? dataPub = freezed,
    Object? idFoglio = null,
  }) {
    return _then(_MessageModel(
      idMsg: null == idMsg
          ? _self.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as int,
      desMsg: freezed == desMsg
          ? _self.desMsg
          : desMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      titMsg: freezed == titMsg
          ? _self.titMsg
          : titMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      idUteAut: freezed == idUteAut
          ? _self.idUteAut
          : idUteAut // ignore: cast_nullable_to_non_nullable
              as int?,
      emailAut: freezed == emailAut
          ? _self.emailAut
          : emailAut // ignore: cast_nullable_to_non_nullable
              as String?,
      idUteReply: freezed == idUteReply
          ? _self.idUteReply
          : idUteReply // ignore: cast_nullable_to_non_nullable
              as int?,
      idMsgReply: freezed == idMsgReply
          ? _self.idMsgReply
          : idMsgReply // ignore: cast_nullable_to_non_nullable
              as int?,
      codTipMsg: freezed == codTipMsg
          ? _self.codTipMsg
          : codTipMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      desTipMsg: freezed == desTipMsg
          ? _self.desTipMsg
          : desTipMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      datUltMov: freezed == datUltMov
          ? _self.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataPub: freezed == dataPub
          ? _self.dataPub
          : dataPub // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idFoglio: null == idFoglio
          ? _self.idFoglio
          : idFoglio // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
