import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/custom_footer.dart';
import 'package:taipme_mobile/src/component/custom_header.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class FaqPage extends ConsumerStatefulWidget {
  const FaqPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FaqPageState();
}

class _FaqPageState extends ConsumerState<FaqPage> {

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(26), // Padding intorno al TextField
              child: TextField(
                decoration: InputDecoration(
                  hintText: '#cerca',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: TaipmeStyle.borderInput),
                  ),
                ),
              )),

        ],
      )
    );
  }
}