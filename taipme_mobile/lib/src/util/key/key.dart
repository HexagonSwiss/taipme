import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'key.g.dart';

// GO_ROUTER KEY
@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKey(Ref ref) => GlobalKey<NavigatorState>();

// FORM KEYS

// MESSAGE
GlobalKey<FormState> messageKey = GlobalKey<FormState>();

// PROFILE
GlobalKey<FormState> profileKey = GlobalKey<FormState>();

// LOGIN
GlobalKey<FormState> loginKey = GlobalKey<FormState>();

// FORGOT PASSWORD
GlobalKey<FormState> forgotPasswordKey = GlobalKey<FormState>();
GlobalKey<FormState> forgotPasswordUpdateKey = GlobalKey<FormState>();

// REGISTRATION
GlobalKey<FormState> registrationKey = GlobalKey<FormState>();

// SEARCH
GlobalKey<FormState> searchKey = GlobalKey<FormState>();