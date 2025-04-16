import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/home_page/home_message_card.dart';
import 'package:taipme_mobile/src/controller/message_controller/message_controller.dart';
import 'package:taipme_mobile/src/model/data_model/message_model/message_model.dart';

// TODO: GET DATA FROM THE BACKEND

class HomeMessageCarousel extends ConsumerWidget {
  const HomeMessageCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MessageModel> messageList = ref.watch(messageControllerProvider);

    return PageView.builder(
      controller: PageController(viewportFraction: 0.85),
      itemCount: messageList.length,
      onPageChanged: (index) =>
          ref.read(messageControllerProvider.notifier).updateIsSelected(index),
      itemBuilder: (context, index) {
        final List<HomeMessageCard> homeMessageCard = [];
        for (final message in messageList) {
          homeMessageCard.add(HomeMessageCard(message: message));
        }
        return homeMessageCard[index];
      },
    );
  }
}
