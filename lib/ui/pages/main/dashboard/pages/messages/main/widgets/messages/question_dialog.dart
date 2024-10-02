import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class QuestionsDialog extends StatelessWidget {
  const QuestionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: WEBColors.white.withOpacity(
            0.1,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 110,
          horizontal: 350,
        ),
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                Strings.interviewQuestions,
                style: Types.whiteBottonTStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                Strings.interviewQuestionsDescription,
                textAlign: TextAlign.center,
                style: Types.headerItemTStyle.apply(
                  color: WEBColors.white.withOpacity(
                    0.66,
                  ),
                ),
              ),
            ),
            Text(
              '${Strings.role.capitalize()}: Product Designer',
              style: Types.headerItemTStyle.apply(
                color: WEBColors.white.withOpacity(
                  0.66,
                ),
              ),
            ),
            spacerVertical(8),
            Text(
              '${Strings.date}: 8/30/24',
              style: Types.headerItemTStyle.apply(
                color: WEBColors.white.withOpacity(
                  0.66,
                ),
              ),
            ),
            spacerVertical(16),
            Text(
              Strings.questions,
              style: Types.headerItemTStyle.apply(
                color: WEBColors.white.withOpacity(
                  0.66,
                ),
              ),
            ),
            spacerVertical(9),
            ...List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '${index + 1}. What made you want to come work with us?',
                  style: Types.headerItemTStyle,
                ),
              );
            }),
            spacerVertical(40),
            SizedBox(
              height: 72,
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: WEBColors.darkGreen,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  context.pop();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: Text(
                    Strings.okay,
                    style: Types.whiteBottonTStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
