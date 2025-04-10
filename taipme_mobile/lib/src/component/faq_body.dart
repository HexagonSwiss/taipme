import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/controller/faq_controller/faq_controller.dart';
import 'package:taipme_mobile/src/model/data_model/faq_model/faq_model.dart';

class FaqBody extends ConsumerWidget {
  const FaqBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faqList = ref.watch(faqSyncControllerProvider);

    return ListView.builder(
      itemCount: faqList.length,
      itemBuilder: (context, index) {
        final FaqModel faq = faqList[index];
        return GestureDetector(
          onTap: () => ref
              .read(faqSyncControllerProvider.notifier)
              .toggleExpansion(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.white),
                color: faq.isExpanded ? Colors.white10 : Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    faqList[index].domFaq,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (faqList[index].isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        faq.risFaq,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
