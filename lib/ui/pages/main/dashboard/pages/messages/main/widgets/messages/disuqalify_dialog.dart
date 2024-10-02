import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class DisuqualifyDialog extends StatelessWidget {
  const DisuqualifyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
            left: (context.screenWidth > UiConst.adaptiveWidth
                    ? UiConst.drawerWidth
                    : UiConst.drawerWidthCompact) +
                15,
            right: 15,
            top: 64),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 400, maxWidth: 450),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: WEBColors.white.withOpacity(
                0.1,
              ),
            ),
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    Strings.reasonForDesqualification,
                    style: Types.whiteBottonTStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    Strings.feedbackAnonymousForCandidate,
                    textAlign: TextAlign.center,
                    style: Types.headerItemTStyle.apply(
                      color: WEBColors.white.withOpacity(
                        0.66,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildContainer(Strings.interestInProduct),
                      _buildContainer(Strings.experience),
                      _buildContainer(Strings.gutFeeling),
                      _buildContainer(Strings.logistics),
                      _buildContainer(Strings.personality),
                      _buildContainer(Strings.skill),
                      _buildContainer(Strings.other),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: TextField(
                    maxLines: null,
                    minLines: 5,
                    style: Types.whiteRegular24TStyle,
                    decoration: InputDecoration(
                      hintText: Strings.reasonForDesqualificationHintText,
                      hintStyle: Types.grayRegular24TStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: WEBColors.white.withOpacity(0.1),
                    ),
                  ),
                ),
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
                        Strings.submit,
                        style: Types.whiteBottonTStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: WEBColors.white.withOpacity(
          0.1,
        ),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Text(
        text,
        style: Types.buttonH4TStyle.apply(
          color: WEBColors.white.withOpacity(0.66),
        ),
      ),
    );
  }
}
