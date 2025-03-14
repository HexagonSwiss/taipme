// config.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get apiKey => dotenv.env['API_KEY'] ?? 'default_value';
  static String get debugMode => dotenv.env['DEBUG'] ?? 'false';
}