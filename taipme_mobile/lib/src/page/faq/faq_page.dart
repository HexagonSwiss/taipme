import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/custom_header.dart';
import 'package:taipme_mobile/src/component/faq_body.dart';
import 'package:taipme_mobile/src/component/menu.dart';
import 'package:taipme_mobile/src/controller/faq_controller/faq_controller.dart';
import 'package:taipme_mobile/src/model/data_model/faq_model/faq_model.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class FaqPage extends ConsumerWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faqController = ref.watch(faqControllerProvider);

    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      endDrawer: const Menu(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
          child: faqController.when(
            data: (List<FaqModel>? faqList) {
              debugPrint('FAQ List: $faqList'); 
              if (faqList == null || faqList.isEmpty) {
                return const Text(
                  'Nessuna FAQ disponibile',
                  style: TextStyle(color: Colors.white),
                );
              }
              return FaqBody();
            },
            error: (_, __) => Text('Error'),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
