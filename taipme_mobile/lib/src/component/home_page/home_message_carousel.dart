import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/home_page/home_message_card.dart';
import 'package:taipme_mobile/src/controller/message_controller/message_controller.dart';

class HomeMessageCarousel extends ConsumerWidget {
  const HomeMessageCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getAllMessages = ref.watch(getAllMessagesProvider);

    return getAllMessages.when(
      error: (_, __) => Text('Messagi non trovati'),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) => PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        itemCount: data.length,
        onPageChanged: (index) => ref
            .read(messageControllerProvider.notifier)
            .updateIsSelected(index),
        itemBuilder: (context, index) {
          final List<HomeMessageCard> homeMessageCard = [];
          for (final message in data) {
            homeMessageCard.add(HomeMessageCard(message: message));
          }
          return homeMessageCard[index];
        },
      ),
    );
  }
}
