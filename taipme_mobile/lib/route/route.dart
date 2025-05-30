import 'package:taipme_mobile/src/controller/route_controller/route_controller.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/message_model/message_model.dart';
import 'package:taipme_mobile/src/page/authentication/password_update_confirmation_page.dart';
import 'package:taipme_mobile/src/page/authentication/forgot_password_page.dart';
import 'package:taipme_mobile/src/page/authentication/forgot_password_sent_page.dart';
import 'package:taipme_mobile/src/page/new_message_page.dart';
import 'package:taipme_mobile/src/page/registration/login_or_register_page.dart';
import 'package:taipme_mobile/src/page/registration/registration_confirmation_page.dart';
import 'package:taipme_mobile/src/page/registration/registration_page.dart';
import 'package:taipme_mobile/src/page/registration/registration_sent_page.dart';
import 'package:taipme_mobile/src/page/home_page.dart';
import 'package:taipme_mobile/src/page/authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/page/faq/faq_page.dart';
import 'package:taipme_mobile/src/page/contact_us/contact_us_page.dart';
import 'package:taipme_mobile/src/page/report/report_confirmation_page.dart';
import 'package:taipme_mobile/src/page/report/report_page.dart';
import 'package:taipme_mobile/src/page/what_is/what_is_page.dart';
import 'package:taipme_mobile/src/page/settings/settings_page.dart';

part 'route.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  debugPrint('Route: goRouter provider is called');

  final router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
        redirect: (context, state) async =>
            await ref.read(routeControllerProvider().future),
      ),
      GoRoute(
        path: '/login-or-register',
        pageBuilder: (context, state) =>
            const MaterialPage(child: LoginOrRegisterPage()),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
      ),
      GoRoute(
        path: '/forgot-password',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ForgotPasswordPage()),
      ),
      GoRoute(
        path: '/forgot-password-sent',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ForgotPasswordSentPage()),
      ),
      GoRoute(
        path: '/password-update-confirmation',
        pageBuilder: (context, state) {
          final token = state.uri.queryParameters['token'];
          return MaterialPage(
              child: PasswordUpdateConfirmationPage(token: token!));
        },
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) =>
            MaterialPage(child: RegistrationPage()),
      ),
      GoRoute(
        path: '/registration-sent',
        pageBuilder: (context, state) =>
            const MaterialPage(child: RegistrationSentPage()),
      ),
      GoRoute(
        path: '/registration-confirmed',
        pageBuilder: (context, state) {
          final token = state.uri.queryParameters['token'];
          return MaterialPage(
              child: RegistrationConfirmationPage(token: token!));
        },
      ),
      GoRoute(
        path: '/home-page',
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      ),
      GoRoute(
        path: '/report-page',
        pageBuilder: (context, state) {
          final MessageModel message = state.extra as MessageModel;
          return MaterialPage(child: ReportPage(message: message));
        },
      ),
      GoRoute(
        path: '/new-message-page/:paperId',
        pageBuilder: (context, state) {
          final paperId = int.parse(state.pathParameters['paperId']!);
          return MaterialPage(
            child: NewMessagePage(
              paperId: paperId,
            ),
          );
        },
      ),
      GoRoute(
        name: 'reply-message',
        path:
            '/reply-message-page/:paperId/:messageIdToReplyTo', 
        pageBuilder: (context, state) {
          final paperId = int.parse(state.pathParameters['paperId']!);
          final messageIdToReplyTo =
              int.parse(state.pathParameters['messageIdToReplyTo']!);
          return MaterialPage(
            child: NewMessagePage(
              paperId: paperId,
              messageIdToReplyTo: messageIdToReplyTo,
            ),
          );
        },
      ),
      GoRoute(
        path: '/report-confirmation-page',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ReportConfirmationPage()),
      ),
      GoRoute(
        path: '/faq-page',
        pageBuilder: (context, state) => const MaterialPage(child: FaqPage()),
      ),
      GoRoute(
          path: '/contact-us-page',
          pageBuilder: (context, state) =>
              const MaterialPage(child: ContactUsPage())),
      GoRoute(
          path: '/what-is-page',
          pageBuilder: (context, state) =>
              const MaterialPage(child: WhatIsPage())),
      GoRoute(
          path: '/settings-page',
          pageBuilder: (context, state) =>
              const MaterialPage(child: SettingsPage())),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
}
