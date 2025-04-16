import 'package:freezed_annotation/freezed_annotation.dart';

enum MessageTypeEnum {
  @JsonValue("BOZ") // bozza
  draft,
  @JsonValue("CCO") // cancellato per contenuti offensivi
  cancelled,
  @JsonValue("INV") // inviato a tutti
  sent,
  @JsonValue("LET") // messagio letto
  read,
  @JsonValue("PRI") // privato
  private,
  @JsonValue("PUB") // pubblico
  public,
  @JsonValue("STRA") // strappato
  torn,
}
