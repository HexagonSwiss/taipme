import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'instance_controller.g.dart';

// NORMAL PROVIDERS

// @riverpod
// AppLinks appLinks(ref) => AppLinks();

@riverpod
void exceptionInstance(Ref ref) => throw Exception('ExceptionProvider is called'); // TEST ONLY

@riverpod
SharedPreferencesAsync sharedPreferences(Ref ref) => SharedPreferencesAsync();

@riverpod
Future<void> orientationInitialization(Ref ref) async => await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
