import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taipme_mobile/src/component/app_bar/custom_header.dart';
import 'package:taipme_mobile/src/component/button/primary_button.dart';
import 'package:taipme_mobile/src/component/drawer/end_drawer.dart';
import 'package:taipme_mobile/src/component/card/read_only_message_card.dart';
import 'package:taipme_mobile/src/component/input_field.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/controller/paper_controller/paper_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/message_model/message_model.dart';
import 'package:taipme_mobile/src/util/key/key.dart';

class ReportPage extends ConsumerStatefulWidget {
  const ReportPage({super.key, required this.message});

  final MessageModel message;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportPageState();
}

class _ReportPageState extends ConsumerState<ReportPage> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: CustomHeader(),
      endDrawer: const EndDrawer(),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.85,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => ref.read(goRouterProvider).go('/home-page'),
                child: Text(
                  AppLocalizations.of(context)!.goBack,
                  style: TextStyle(
                    color: TaipmeStyle.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            flex: 30,
            child: MessageCard(
              message: AppLocalizations.of(context)!.messageToBeReported,
              textAlign: TextAlign.start,
              showReportButton: false,
              icon: Icons.info_outline,
              shouldRotate: false,
              isReadOnly: true,
              preLoadedMessage: widget.message.desMsg,
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: Form(
              key: reportKey,
              child: InputField(
                minLines: 3,
                maxLines: 5,
                controller: controller,
                focusNode: focusNode,
                hintText: AppLocalizations.of(context)!.reportReasonHint,
                icon: Icons.info_outline,
                validator: (value) => ref
                    .read(formControllerProvider.notifier)
                    .validateEmptyOrNull(value, context),
              ),
            ),
          ),
          SizedBox(height: 24),
          PrimaryButton(
            title: AppLocalizations.of(context)!.reportButton,
            onPressed: () async {
              await ref
                  .read(formControllerProvider.notifier)
                  .handleForm(globalKey: reportKey, context: context, actions: [
                () async => await ref
                    .read(paperActionsControllerProvider.notifier)
                    .reportMessage(
                      messageId: widget.message.idMsg,
                      paperId: widget.message.idFoglio,
                      reason: controller.text,
                    ),
              ], onEnd: [
                () =>
                    ref.read(goRouterProvider).go('/report-confirmation-page'),
              ]);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
