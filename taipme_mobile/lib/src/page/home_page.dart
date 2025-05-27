import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taipme_mobile/src/component/app_bar/custom_header.dart';
import 'package:taipme_mobile/src/component/drawer/end_drawer.dart';
import 'package:taipme_mobile/src/component/home_page/home_message_card.dart';
import 'package:taipme_mobile/src/component/home_page/paper_index_carousel.dart';
import 'package:taipme_mobile/src/component/home_page/search_field.dart';
import 'package:taipme_mobile/src/controller/paper_controller/paper_controller.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/papers_summary_model/papers_summary_model.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(fetchUserPapersSummaryProvider);

    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      endDrawer: const EndDrawer(),
      bottomNavigationBar: BottomNavBar(),
      body: summaryAsync.when(
        loading: () => CircularProgressIndicator.adaptive(),
        error: (e, st) => Center(
          child: Text(
            AppLocalizations.of(context)!.thereAreNoPapers,
            style: TextStyle(
              color: TaipmeStyle.primaryColor,
              fontSize: TaipmeStyle.largeTextSize,
            ),
          ),
        ),
        data: (PapersSummaryModel summaryData) {
          return Consumer(
            builder: (context, ref, child) {
              final paperId = ref.watch(currentPaperIdProvider(summaryData));

              return Column(
                children: [
                  SizedBox(height: 16),
                  Expanded(
                    flex: 10,
                    child: SearchField(),
                  ),
                  Expanded(
                    flex: 65,
                    child: HomeMessageCard(
                      selectedPaperId: paperId,
                      key: ValueKey(paperId),
                    ),
                  ),
                  Expanded(
                    flex: 25,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PaperIndexCarousel(
                          summaryData: summaryData,
                          selectedPaperId: paperId,
                          onPaperSelected: (paperId) {
                            ref
                                .read(currentPaperIdProvider(summaryData)
                                    .notifier)
                                .setCurrentPaperId(paperId);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
