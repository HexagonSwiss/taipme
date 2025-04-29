// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  int? get idMsg => throw _privateConstructorUsedError;
  int? get idUteAut => throw _privateConstructorUsedError;
  int? get idUteReply => throw _privateConstructorUsedError;
  int? get idMsgReply => throw _privateConstructorUsedError;
  int? get idFoglio => throw _privateConstructorUsedError;
  String? get desMsg => throw _privateConstructorUsedError;
  String? get titMsg =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  String? get emailAut =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get dataPub => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get datUltMov => throw _privateConstructorUsedError;
  MessageTypeEnum get codTipMsg => throw _privateConstructorUsedError;
  String? get desTipMsg =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  bool? get tipMsgPub =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  bool? get tipMsgPri =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  String? get datUltMovView =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  int? get idFoglioOrig =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  bool? get segnala =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  bool? get presenteRisposta =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  String? get hashtag =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  String? get desErrHashTag =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  String? get desSuccessHashTag =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  String? get desMot =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  bool? get offensivo =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  bool? get msgUteReg =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  bool? get foundMsgPubRandom =>
      throw _privateConstructorUsedError; // Added from Java Messaggio
  bool get isCurrent => throw _privateConstructorUsedError;

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {int? idMsg,
      int? idUteAut,
      int? idUteReply,
      int? idMsgReply,
      int? idFoglio,
      String? desMsg,
      String? titMsg,
      String? emailAut,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? dataPub,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? datUltMov,
      MessageTypeEnum codTipMsg,
      String? desTipMsg,
      bool? tipMsgPub,
      bool? tipMsgPri,
      String? datUltMovView,
      int? idFoglioOrig,
      bool? segnala,
      bool? presenteRisposta,
      String? hashtag,
      String? desErrHashTag,
      String? desSuccessHashTag,
      String? desMot,
      bool? offensivo,
      bool? msgUteReg,
      bool? foundMsgPubRandom,
      bool isCurrent});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMsg = freezed,
    Object? idUteAut = freezed,
    Object? idUteReply = freezed,
    Object? idMsgReply = freezed,
    Object? idFoglio = freezed,
    Object? desMsg = freezed,
    Object? titMsg = freezed,
    Object? emailAut = freezed,
    Object? dataPub = freezed,
    Object? datUltMov = freezed,
    Object? codTipMsg = null,
    Object? desTipMsg = freezed,
    Object? tipMsgPub = freezed,
    Object? tipMsgPri = freezed,
    Object? datUltMovView = freezed,
    Object? idFoglioOrig = freezed,
    Object? segnala = freezed,
    Object? presenteRisposta = freezed,
    Object? hashtag = freezed,
    Object? desErrHashTag = freezed,
    Object? desSuccessHashTag = freezed,
    Object? desMot = freezed,
    Object? offensivo = freezed,
    Object? msgUteReg = freezed,
    Object? foundMsgPubRandom = freezed,
    Object? isCurrent = null,
  }) {
    return _then(_value.copyWith(
      idMsg: freezed == idMsg
          ? _value.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as int?,
      idUteAut: freezed == idUteAut
          ? _value.idUteAut
          : idUteAut // ignore: cast_nullable_to_non_nullable
              as int?,
      idUteReply: freezed == idUteReply
          ? _value.idUteReply
          : idUteReply // ignore: cast_nullable_to_non_nullable
              as int?,
      idMsgReply: freezed == idMsgReply
          ? _value.idMsgReply
          : idMsgReply // ignore: cast_nullable_to_non_nullable
              as int?,
      idFoglio: freezed == idFoglio
          ? _value.idFoglio
          : idFoglio // ignore: cast_nullable_to_non_nullable
              as int?,
      desMsg: freezed == desMsg
          ? _value.desMsg
          : desMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      titMsg: freezed == titMsg
          ? _value.titMsg
          : titMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAut: freezed == emailAut
          ? _value.emailAut
          : emailAut // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPub: freezed == dataPub
          ? _value.dataPub
          : dataPub // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datUltMov: freezed == datUltMov
          ? _value.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codTipMsg: null == codTipMsg
          ? _value.codTipMsg
          : codTipMsg // ignore: cast_nullable_to_non_nullable
              as MessageTypeEnum,
      desTipMsg: freezed == desTipMsg
          ? _value.desTipMsg
          : desTipMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      tipMsgPub: freezed == tipMsgPub
          ? _value.tipMsgPub
          : tipMsgPub // ignore: cast_nullable_to_non_nullable
              as bool?,
      tipMsgPri: freezed == tipMsgPri
          ? _value.tipMsgPri
          : tipMsgPri // ignore: cast_nullable_to_non_nullable
              as bool?,
      datUltMovView: freezed == datUltMovView
          ? _value.datUltMovView
          : datUltMovView // ignore: cast_nullable_to_non_nullable
              as String?,
      idFoglioOrig: freezed == idFoglioOrig
          ? _value.idFoglioOrig
          : idFoglioOrig // ignore: cast_nullable_to_non_nullable
              as int?,
      segnala: freezed == segnala
          ? _value.segnala
          : segnala // ignore: cast_nullable_to_non_nullable
              as bool?,
      presenteRisposta: freezed == presenteRisposta
          ? _value.presenteRisposta
          : presenteRisposta // ignore: cast_nullable_to_non_nullable
              as bool?,
      hashtag: freezed == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String?,
      desErrHashTag: freezed == desErrHashTag
          ? _value.desErrHashTag
          : desErrHashTag // ignore: cast_nullable_to_non_nullable
              as String?,
      desSuccessHashTag: freezed == desSuccessHashTag
          ? _value.desSuccessHashTag
          : desSuccessHashTag // ignore: cast_nullable_to_non_nullable
              as String?,
      desMot: freezed == desMot
          ? _value.desMot
          : desMot // ignore: cast_nullable_to_non_nullable
              as String?,
      offensivo: freezed == offensivo
          ? _value.offensivo
          : offensivo // ignore: cast_nullable_to_non_nullable
              as bool?,
      msgUteReg: freezed == msgUteReg
          ? _value.msgUteReg
          : msgUteReg // ignore: cast_nullable_to_non_nullable
              as bool?,
      foundMsgPubRandom: freezed == foundMsgPubRandom
          ? _value.foundMsgPubRandom
          : foundMsgPubRandom // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrent: null == isCurrent
          ? _value.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
          _$MessageModelImpl value, $Res Function(_$MessageModelImpl) then) =
      __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? idMsg,
      int? idUteAut,
      int? idUteReply,
      int? idMsgReply,
      int? idFoglio,
      String? desMsg,
      String? titMsg,
      String? emailAut,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? dataPub,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? datUltMov,
      MessageTypeEnum codTipMsg,
      String? desTipMsg,
      bool? tipMsgPub,
      bool? tipMsgPri,
      String? datUltMovView,
      int? idFoglioOrig,
      bool? segnala,
      bool? presenteRisposta,
      String? hashtag,
      String? desErrHashTag,
      String? desSuccessHashTag,
      String? desMot,
      bool? offensivo,
      bool? msgUteReg,
      bool? foundMsgPubRandom,
      bool isCurrent});
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
      _$MessageModelImpl _value, $Res Function(_$MessageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMsg = freezed,
    Object? idUteAut = freezed,
    Object? idUteReply = freezed,
    Object? idMsgReply = freezed,
    Object? idFoglio = freezed,
    Object? desMsg = freezed,
    Object? titMsg = freezed,
    Object? emailAut = freezed,
    Object? dataPub = freezed,
    Object? datUltMov = freezed,
    Object? codTipMsg = null,
    Object? desTipMsg = freezed,
    Object? tipMsgPub = freezed,
    Object? tipMsgPri = freezed,
    Object? datUltMovView = freezed,
    Object? idFoglioOrig = freezed,
    Object? segnala = freezed,
    Object? presenteRisposta = freezed,
    Object? hashtag = freezed,
    Object? desErrHashTag = freezed,
    Object? desSuccessHashTag = freezed,
    Object? desMot = freezed,
    Object? offensivo = freezed,
    Object? msgUteReg = freezed,
    Object? foundMsgPubRandom = freezed,
    Object? isCurrent = null,
  }) {
    return _then(_$MessageModelImpl(
      idMsg: freezed == idMsg
          ? _value.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as int?,
      idUteAut: freezed == idUteAut
          ? _value.idUteAut
          : idUteAut // ignore: cast_nullable_to_non_nullable
              as int?,
      idUteReply: freezed == idUteReply
          ? _value.idUteReply
          : idUteReply // ignore: cast_nullable_to_non_nullable
              as int?,
      idMsgReply: freezed == idMsgReply
          ? _value.idMsgReply
          : idMsgReply // ignore: cast_nullable_to_non_nullable
              as int?,
      idFoglio: freezed == idFoglio
          ? _value.idFoglio
          : idFoglio // ignore: cast_nullable_to_non_nullable
              as int?,
      desMsg: freezed == desMsg
          ? _value.desMsg
          : desMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      titMsg: freezed == titMsg
          ? _value.titMsg
          : titMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAut: freezed == emailAut
          ? _value.emailAut
          : emailAut // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPub: freezed == dataPub
          ? _value.dataPub
          : dataPub // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datUltMov: freezed == datUltMov
          ? _value.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codTipMsg: null == codTipMsg
          ? _value.codTipMsg
          : codTipMsg // ignore: cast_nullable_to_non_nullable
              as MessageTypeEnum,
      desTipMsg: freezed == desTipMsg
          ? _value.desTipMsg
          : desTipMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      tipMsgPub: freezed == tipMsgPub
          ? _value.tipMsgPub
          : tipMsgPub // ignore: cast_nullable_to_non_nullable
              as bool?,
      tipMsgPri: freezed == tipMsgPri
          ? _value.tipMsgPri
          : tipMsgPri // ignore: cast_nullable_to_non_nullable
              as bool?,
      datUltMovView: freezed == datUltMovView
          ? _value.datUltMovView
          : datUltMovView // ignore: cast_nullable_to_non_nullable
              as String?,
      idFoglioOrig: freezed == idFoglioOrig
          ? _value.idFoglioOrig
          : idFoglioOrig // ignore: cast_nullable_to_non_nullable
              as int?,
      segnala: freezed == segnala
          ? _value.segnala
          : segnala // ignore: cast_nullable_to_non_nullable
              as bool?,
      presenteRisposta: freezed == presenteRisposta
          ? _value.presenteRisposta
          : presenteRisposta // ignore: cast_nullable_to_non_nullable
              as bool?,
      hashtag: freezed == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String?,
      desErrHashTag: freezed == desErrHashTag
          ? _value.desErrHashTag
          : desErrHashTag // ignore: cast_nullable_to_non_nullable
              as String?,
      desSuccessHashTag: freezed == desSuccessHashTag
          ? _value.desSuccessHashTag
          : desSuccessHashTag // ignore: cast_nullable_to_non_nullable
              as String?,
      desMot: freezed == desMot
          ? _value.desMot
          : desMot // ignore: cast_nullable_to_non_nullable
              as String?,
      offensivo: freezed == offensivo
          ? _value.offensivo
          : offensivo // ignore: cast_nullable_to_non_nullable
              as bool?,
      msgUteReg: freezed == msgUteReg
          ? _value.msgUteReg
          : msgUteReg // ignore: cast_nullable_to_non_nullable
              as bool?,
      foundMsgPubRandom: freezed == foundMsgPubRandom
          ? _value.foundMsgPubRandom
          : foundMsgPubRandom // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrent: null == isCurrent
          ? _value.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageModelImpl implements _MessageModel {
  const _$MessageModelImpl(
      {this.idMsg,
      this.idUteAut,
      this.idUteReply,
      this.idMsgReply,
      this.idFoglio,
      this.desMsg,
      this.titMsg,
      this.emailAut,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      this.dataPub,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      this.datUltMov,
      this.codTipMsg = MessageTypeEnum.public,
      this.desTipMsg,
      this.tipMsgPub,
      this.tipMsgPri,
      this.datUltMovView,
      this.idFoglioOrig,
      this.segnala,
      this.presenteRisposta,
      this.hashtag,
      this.desErrHashTag,
      this.desSuccessHashTag,
      this.desMot,
      this.offensivo,
      this.msgUteReg,
      this.foundMsgPubRandom,
      this.isCurrent = false});

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  final int? idMsg;
  @override
  final int? idUteAut;
  @override
  final int? idUteReply;
  @override
  final int? idMsgReply;
  @override
  final int? idFoglio;
  @override
  final String? desMsg;
  @override
  final String? titMsg;
// Added from Java Messaggio
  @override
  final String? emailAut;
// Added from Java Messaggio
  @override
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  final DateTime? dataPub;
  @override
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  final DateTime? datUltMov;
  @override
  @JsonKey()
  final MessageTypeEnum codTipMsg;
  @override
  final String? desTipMsg;
// Added from Java Messaggio
  @override
  final bool? tipMsgPub;
// Added from Java Messaggio
  @override
  final bool? tipMsgPri;
// Added from Java Messaggio
  @override
  final String? datUltMovView;
// Added from Java Messaggio
  @override
  final int? idFoglioOrig;
// Added from Java Messaggio
  @override
  final bool? segnala;
// Added from Java Messaggio
  @override
  final bool? presenteRisposta;
// Added from Java Messaggio
  @override
  final String? hashtag;
// Added from Java Messaggio
  @override
  final String? desErrHashTag;
// Added from Java Messaggio
  @override
  final String? desSuccessHashTag;
// Added from Java Messaggio
  @override
  final String? desMot;
// Added from Java Messaggio
  @override
  final bool? offensivo;
// Added from Java Messaggio
  @override
  final bool? msgUteReg;
// Added from Java Messaggio
  @override
  final bool? foundMsgPubRandom;
// Added from Java Messaggio
  @override
  @JsonKey()
  final bool isCurrent;

  @override
  String toString() {
    return 'MessageModel(idMsg: $idMsg, idUteAut: $idUteAut, idUteReply: $idUteReply, idMsgReply: $idMsgReply, idFoglio: $idFoglio, desMsg: $desMsg, titMsg: $titMsg, emailAut: $emailAut, dataPub: $dataPub, datUltMov: $datUltMov, codTipMsg: $codTipMsg, desTipMsg: $desTipMsg, tipMsgPub: $tipMsgPub, tipMsgPri: $tipMsgPri, datUltMovView: $datUltMovView, idFoglioOrig: $idFoglioOrig, segnala: $segnala, presenteRisposta: $presenteRisposta, hashtag: $hashtag, desErrHashTag: $desErrHashTag, desSuccessHashTag: $desSuccessHashTag, desMot: $desMot, offensivo: $offensivo, msgUteReg: $msgUteReg, foundMsgPubRandom: $foundMsgPubRandom, isCurrent: $isCurrent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.idMsg, idMsg) || other.idMsg == idMsg) &&
            (identical(other.idUteAut, idUteAut) ||
                other.idUteAut == idUteAut) &&
            (identical(other.idUteReply, idUteReply) ||
                other.idUteReply == idUteReply) &&
            (identical(other.idMsgReply, idMsgReply) ||
                other.idMsgReply == idMsgReply) &&
            (identical(other.idFoglio, idFoglio) ||
                other.idFoglio == idFoglio) &&
            (identical(other.desMsg, desMsg) || other.desMsg == desMsg) &&
            (identical(other.titMsg, titMsg) || other.titMsg == titMsg) &&
            (identical(other.emailAut, emailAut) ||
                other.emailAut == emailAut) &&
            (identical(other.dataPub, dataPub) || other.dataPub == dataPub) &&
            (identical(other.datUltMov, datUltMov) ||
                other.datUltMov == datUltMov) &&
            (identical(other.codTipMsg, codTipMsg) ||
                other.codTipMsg == codTipMsg) &&
            (identical(other.desTipMsg, desTipMsg) ||
                other.desTipMsg == desTipMsg) &&
            (identical(other.tipMsgPub, tipMsgPub) ||
                other.tipMsgPub == tipMsgPub) &&
            (identical(other.tipMsgPri, tipMsgPri) ||
                other.tipMsgPri == tipMsgPri) &&
            (identical(other.datUltMovView, datUltMovView) ||
                other.datUltMovView == datUltMovView) &&
            (identical(other.idFoglioOrig, idFoglioOrig) ||
                other.idFoglioOrig == idFoglioOrig) &&
            (identical(other.segnala, segnala) || other.segnala == segnala) &&
            (identical(other.presenteRisposta, presenteRisposta) ||
                other.presenteRisposta == presenteRisposta) &&
            (identical(other.hashtag, hashtag) || other.hashtag == hashtag) &&
            (identical(other.desErrHashTag, desErrHashTag) ||
                other.desErrHashTag == desErrHashTag) &&
            (identical(other.desSuccessHashTag, desSuccessHashTag) ||
                other.desSuccessHashTag == desSuccessHashTag) &&
            (identical(other.desMot, desMot) || other.desMot == desMot) &&
            (identical(other.offensivo, offensivo) ||
                other.offensivo == offensivo) &&
            (identical(other.msgUteReg, msgUteReg) ||
                other.msgUteReg == msgUteReg) &&
            (identical(other.foundMsgPubRandom, foundMsgPubRandom) ||
                other.foundMsgPubRandom == foundMsgPubRandom) &&
            (identical(other.isCurrent, isCurrent) ||
                other.isCurrent == isCurrent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idMsg,
        idUteAut,
        idUteReply,
        idMsgReply,
        idFoglio,
        desMsg,
        titMsg,
        emailAut,
        dataPub,
        datUltMov,
        codTipMsg,
        desTipMsg,
        tipMsgPub,
        tipMsgPri,
        datUltMovView,
        idFoglioOrig,
        segnala,
        presenteRisposta,
        hashtag,
        desErrHashTag,
        desSuccessHashTag,
        desMot,
        offensivo,
        msgUteReg,
        foundMsgPubRandom,
        isCurrent
      ]);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(
      this,
    );
  }
}

abstract class _MessageModel implements MessageModel {
  const factory _MessageModel(
      {final int? idMsg,
      final int? idUteAut,
      final int? idUteReply,
      final int? idMsgReply,
      final int? idFoglio,
      final String? desMsg,
      final String? titMsg,
      final String? emailAut,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      final DateTime? dataPub,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      final DateTime? datUltMov,
      final MessageTypeEnum codTipMsg,
      final String? desTipMsg,
      final bool? tipMsgPub,
      final bool? tipMsgPri,
      final String? datUltMovView,
      final int? idFoglioOrig,
      final bool? segnala,
      final bool? presenteRisposta,
      final String? hashtag,
      final String? desErrHashTag,
      final String? desSuccessHashTag,
      final String? desMot,
      final bool? offensivo,
      final bool? msgUteReg,
      final bool? foundMsgPubRandom,
      final bool isCurrent}) = _$MessageModelImpl;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  int? get idMsg;
  @override
  int? get idUteAut;
  @override
  int? get idUteReply;
  @override
  int? get idMsgReply;
  @override
  int? get idFoglio;
  @override
  String? get desMsg;
  @override
  String? get titMsg; // Added from Java Messaggio
  @override
  String? get emailAut; // Added from Java Messaggio
  @override
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get dataPub;
  @override
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get datUltMov;
  @override
  MessageTypeEnum get codTipMsg;
  @override
  String? get desTipMsg; // Added from Java Messaggio
  @override
  bool? get tipMsgPub; // Added from Java Messaggio
  @override
  bool? get tipMsgPri; // Added from Java Messaggio
  @override
  String? get datUltMovView; // Added from Java Messaggio
  @override
  int? get idFoglioOrig; // Added from Java Messaggio
  @override
  bool? get segnala; // Added from Java Messaggio
  @override
  bool? get presenteRisposta; // Added from Java Messaggio
  @override
  String? get hashtag; // Added from Java Messaggio
  @override
  String? get desErrHashTag; // Added from Java Messaggio
  @override
  String? get desSuccessHashTag; // Added from Java Messaggio
  @override
  String? get desMot; // Added from Java Messaggio
  @override
  bool? get offensivo; // Added from Java Messaggio
  @override
  bool? get msgUteReg; // Added from Java Messaggio
  @override
  bool? get foundMsgPubRandom; // Added from Java Messaggio
  @override
  bool get isCurrent;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
