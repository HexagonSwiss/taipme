import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/paper_status_model/paper_status_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/papers_summary_model/papers_summary_model.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class PaperIndexCarousel extends ConsumerWidget {
  const PaperIndexCarousel({
    super.key,
    required this.summaryData,
    required this.selectedPaperId,
    required this.onPaperSelected,
  });

  final PapersSummaryModel summaryData;
  final int selectedPaperId;
  final Function(int) onPaperSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PaperStatusModel> activePapers = summaryData.papers;
    final bool canAddNewPaper = summaryData.canAddNewPaper;
    List<Widget> paperIndicatorWidgets = [];

    for (final PaperStatusModel currentPaperStatus in activePapers) {
      final int paperId = currentPaperStatus.paperId;
      final bool hasReply = currentPaperStatus.hasReply;
      final bool myTurn = currentPaperStatus.myTurnToReply;
      final bool isSelected = paperId == selectedPaperId;
      final bool isUserAuthoredSlot = currentPaperStatus.isUserAuthoredSlot;
      final bool showAddButton = !isSelected &&
          !hasReply &&
          !myTurn &&
          canAddNewPaper &&
          paperId != 1 &&
          !isUserAuthoredSlot;

      paperIndicatorWidgets.add(
        GestureDetector(
          onTap: () => onPaperSelected(paperId),
          child: Container(
            width: 50,
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
                  showAddButton
                      ? Icon(
                          Icons.add,
                          color: TaipmeStyle.primaryColor,
                        )
                      : Text(
                          '$paperId',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: isSelected
                                ? TaipmeStyle.backgroundColor
                                : TaipmeStyle.primaryColor,
                            fontSize: 18,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: paperIndicatorWidgets,
            ),
          ),
        ],
      ),
    );
  }
}
