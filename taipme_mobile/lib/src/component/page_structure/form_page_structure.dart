import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/text/page_title.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class FormPageStructure extends ConsumerWidget {
  const FormPageStructure({
    super.key,
    required this.title,
    required this.formFields,
    required this.formKey,
    this.footer,
  });

  final GlobalKey<FormState> formKey;
  final String title;
  final List<Widget> formFields;
  final Widget? footer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.unfocus();
            }
          },
          child: Form(
            key: formKey,
            child: Column(
              spacing: 16,
              children: [
                const Spacer(flex: 2),
                PageTitle(title: title),
                const Spacer(flex: 1),
                ...formFields,
                const Spacer(flex: 2),
                if (footer != null) ...[
                  footer!,
                ],
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
