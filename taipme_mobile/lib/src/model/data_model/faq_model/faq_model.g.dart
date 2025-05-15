// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaqModel _$FaqModelFromJson(Map<String, dynamic> json) => _FaqModel(
      idFaq: (json['idFaq'] as num).toInt(),
      domFaq: json['domFaq'] as String,
      risFaq: json['risFaq'] as String,
      datFaq: json['datFaq'] == null
          ? null
          : DateTime.parse(json['datFaq'] as String),
      codStaFaq: json['codStaFaq'] as String?,
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$FaqModelToJson(_FaqModel instance) => <String, dynamic>{
      'idFaq': instance.idFaq,
      'domFaq': instance.domFaq,
      'risFaq': instance.risFaq,
      'datFaq': instance.datFaq?.toIso8601String(),
      'codStaFaq': instance.codStaFaq,
      'isExpanded': instance.isExpanded,
    };
