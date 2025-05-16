import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/paper_status_model/paper_status_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/user_papers_summary_model/user_papers_summary_model.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class PaperIndexCarousel extends ConsumerWidget {
  const PaperIndexCarousel({
    super.key,
    required this.summaryData,
    required this.selectedPaperId,
    required this.onPaperSelected,
  });

  final UserPapersSummaryModel summaryData;
  final int selectedPaperId;
  final Function(int) onPaperSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PaperStatusModel> activePapers = summaryData.papers;

    List<Widget> paperIndicatorWidgets = [];

    // Iterate ONLY over the papers provided in summaryData.papers
    for (final PaperStatusModel currentPaperStatus in activePapers) {
      final int paperId = currentPaperStatus.paperId;
      final bool isSelected = paperId == selectedPaperId;

      paperIndicatorWidgets.add(
        GestureDetector(
          onTap: () => onPaperSelected(paperId),
          child: Container(
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? TaipmeStyle.primaryColor
                  : TaipmeStyle.backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? Colors.white : Colors.transparent,
                width: 2,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$paperId',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: isSelected
                          ? TaipmeStyle.backgroundColor
                          : TaipmeStyle.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  if (currentPaperStatus.hasReply ||
                      currentPaperStatus.myTurnToReply)
                    Icon(
                      currentPaperStatus.myTurnToReply
                          ? Icons.edit_note
                          : Icons.mark_chat_unread_rounded,
                      color: isSelected
                          ? TaipmeStyle.inputFieldReadOnlyColor
                          : TaipmeStyle.backgroundColor,
                      size: 16,
                    )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...paperIndicatorWidgets,
                if (summaryData.canAddNewPaper)
                  Container(
                    width: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: TaipmeStyle.backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: TaipmeStyle.primaryColor,
                        ),
                        onPressed: () => ref
                            .read(goRouterProvider)
                            .go('/new-message-page/${selectedPaperId + 1}'),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
