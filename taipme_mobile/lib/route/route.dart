import 'package:taipme_mobile/src/controller/route_controller/route_controller.dart';
import 'package:taipme_mobile/src/page/authentication/forgot_password_confirmation_page.dart';
import 'package:taipme_mobile/src/page/authentication/forgot_password_page.dart';
import 'package:taipme_mobile/src/page/authentication/forgot_password_sent_page.dart';
import 'package:taipme_mobile/src/page/authentication/login_or_register_page.dart';
import 'package:taipme_mobile/src/page/registration/registration_page.dart';
import 'package:taipme_mobile/src/page/registration/registration_sent_page.dart';
import 'package:taipme_mobile/src/page/chat/chat_home_page.dart';
import  'package:taipme_mobile/src/page/authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/page/home_page.dart';
import 'package:taipme_mobile/src/page/faq/faq_page.dart';
import 'package:taipme_mobile/src/page/contact_us/contact_us_page.dart';
import 'package:taipme_mobile/src/page/what_is/what_is_page.dart';
import 'package:taipme_mobile/src/page/settings/settings_page.dart';

part 'route.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  debugPrint('Route: goRouter provider is called');

  final router = GoRouter(
    // navigatorKey: ref.read(navigatorKeyProvider),
    initialLocation: '/',
    // errorPageBuilder: (context, state) => const MaterialPage(child: AppErrorPage()),
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
        redirect: (context, state) async {
          //return '/login-or-register';
        }
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage(child: LoginPage())
        //redirect: (context, state) async => await ref.read(loginOrRegisterRouteControllerProvider.future),
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) => MaterialPage(child: RegistrationPage()),
      ),
      GoRoute(
        path: '/registration-sent',
        pageBuilder: (context, state) => const MaterialPage(child: RegistrationSentPage()),
      ),
      // GoRoute(
      //   path: '/registration-confirmed',
      //   pageBuilder: (context, state) {
      //     final token = state.uri.queryParameters['token'];
      //     return MaterialPage(child: RegistrationConfirmationPage(token: token!));
      //   },
      // ),
      // GoRoute(
      //   path: '/login',
      //   pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
      // ),
      GoRoute(
        path: '/forgot-password',
        pageBuilder: (context, state) => const MaterialPage(child: ForgotPasswordPage()),
      ),
      GoRoute(
        path: '/forgot-password-sent',
        pageBuilder: (context, state) => const MaterialPage(child: ForgotPasswordSentPage()),
      ),
      GoRoute(
        path: '/forgot-password-confirmation',
        pageBuilder: (context, state) {
          final token = state.uri.queryParameters['token'];
          return MaterialPage(child: ForgotPasswordConfirmationPage(token: token!));
        },
      ),
      GoRoute(
        path: '/chat-home-page',
        pageBuilder: (context, state) => const MaterialPage(child: ChatHomePage()),
      ),
      GoRoute(
        path: '/faq-page',
        pageBuilder: (context, state) => const MaterialPage(child: FaqPage()),
      ),
      GoRoute(
        path: '/contact-us-page', 
        pageBuilder: (context, state) => const MaterialPage(child: ContactUsPage())
      ),
      GoRoute(
        path: '/what-is-page', 
        pageBuilder: (context, state) => const MaterialPage(child: WhatIsPage())
      ),
      GoRoute(
        path: '/settings-page', 
        pageBuilder: (context, state) => const MaterialPage(child: SettingsPage())
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
}