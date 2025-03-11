import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/app_inizialization/app_error_widget.dart';
import 'package:taipme_mobile/src/controller/app_initialization_controller/app_initialization.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class AppSplashPage extends ConsumerWidget {
  const AppSplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appInitializationProvider);

    return appStartupState.when(
      data: (_) {
        if (context.mounted) ref.read(goRouterProvider).go('/');
        return const SizedBox.shrink();
      },
      error: (obj, st) {
        debugPrint('AppSplashPage: Error: $obj and ST: $st');
        return const AppErrorWidget();
      },
      loading: () => Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        extendBodyBehindAppBar: true,
        body: FlutterSplashScreen(
          useImmersiveMode: true,
          splashScreenBody: Center(
            child: Image.asset(
              'assets/logo/taipme.png',
              width: 250,
              height: 233,
            ),
          ),
          backgroundColor: TaipmeStyle.backgroundColor,
        ),
      ),
    );
  }
}