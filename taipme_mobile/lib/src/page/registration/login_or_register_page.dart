import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/button/primary_button.dart';
import 'package:taipme_mobile/src/controller/typing_controller/typing_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/text/type_writter.dart';
import 'package:taipme_mobile/src/util/helper/translated_text/translated_text.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

class LoginOrRegisterPage extends ConsumerWidget {
  const LoginOrRegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCount = ref.watch(clickCountProvider(2));
    final List<String> textList =
        ref.read(translatedTextProvider.notifier).getintroText(context);
    final String displayedText = ref.watch(displayedTextProvider(textList));
    final bool isTypingComplete = ref.watch(isTypingCompleteProvider(displayedText.hashCode.toString()));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isTypingComplete) {
        ref.read(charIndexProvider(displayedText).notifier).reset();
        ref
            .read(
                typingTimerProvider(const Duration(milliseconds: 90), displayedText.hashCode.toString()).notifier)
            .start(displayedText);
      }
    });

    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/logo/taipme.jpg',
                width: 250,
                height: 250,
              ),
              Container(
                height: 150.0,
                padding: const EdgeInsets.all(16.0),
                child: TypeWriter(
                  id: displayedText.hashCode.toString(),
                  fullText: displayedText, 
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    color: TaipmeStyle.primaryColor,
                    fontSize: TaipmeStyle.standardTextSize,
                  ),
                  typingSpeed: Duration(milliseconds: 90),
                ),
              ),
              if (clickCount < 2)
                TextButton(
                  onPressed: isTypingComplete
                      ? () =>
                          ref.read(clickCountProvider(2).notifier).increment(displayedText.hashCode.toString())
                      : null,
                  child: Text(
                    '_${AppLocalizations.of(context)!.continueTo}',
                    style: TextStyle(
                      color: TaipmeStyle.primaryColor,
                      fontSize: TaipmeStyle.standardTextSize,
                    ),
                  ),
                ),
              if (clickCount >= 2)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PrimaryButton(
                      title: '_${AppLocalizations.of(context)!.login}',
                      onPressed: () => ref.read(goRouterProvider).go('/login'),
                    ),
                    PrimaryButton(
                      title: '_${AppLocalizations.of(context)!.registration}',
                      onPressed: () =>
                          ref.read(goRouterProvider).go('/register'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
