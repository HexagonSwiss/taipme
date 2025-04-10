import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
class FaqModel with _$FaqModel {
  const factory FaqModel({
    required int idFaq,
    required String domFaq,
    required String risFaq,
    DateTime? datFaq,
    String? codStaFaq,
    @Default(false) bool isExpanded,
  }) = _FaqModel;

  factory FaqModel.fromJson(Map<String, Object?> json) =>
      _$FaqModelFromJson(json);
}
