import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/profile/membership/widgets/pause_trial_dialog/pause_trial_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/profile/membership/widgets/profile_membership_trial_page.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class ProfileMembership extends StatefulWidget {
  const ProfileMembership({
    required this.onShowCommentDialog,
    required this.onChangeDialog,
    super.key,
  });
  final void Function(bool value) onChangeDialog;
  final VoidCallback onShowCommentDialog;

  @override
  State<ProfileMembership> createState() => _ProfileMembershipState();
}

class _ProfileMembershipState extends State<ProfileMembership> {
  // TODO do this logic in cubit
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return _selectedPage == 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.pro,
                    style: Types.headerLogoTStyle,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset(
                      Vector.dotsHorizontal,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  spacerVertical(24),
                  InkWell(
                    onTap: () {
                      widget.onChangeDialog(true);
                      showDialog(
                        context: context,
                        builder: (context) => PauseTrialDialog(
                          onChangeDialog: widget.onChangeDialog,
                          onShowCommentDialog: widget.onShowCommentDialog,
                        ),
                      ).then((va) {
                        widget.onChangeDialog(false);
                      });
                    },
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: WEBColors.black.withOpacity(
                              0.25,
                            ),
                            offset: const Offset(
                              4,
                              4,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: WEBColors.dark,
                      ),
                      child: Text(
                        Strings.pauseMembership,
                        style: Types.errorTStyle,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                Strings.yourHiringProcess,
                style: Types.whiteBottonTStyle,
              ),
              spacerVertical(28),
              _textWithCheck(
                Strings.customMatchingCandidates,
                Strings.customMatchingCandidatesDesciption,
              ),
              _textWithCheck(
                Strings.marketInsights,
                Strings.marketInsightsDescription,
              ),
              _textWithCheck(
                Strings.interviewAIAssistant,
                Strings.interviewAIAssistantDescription,
              ),
              _textWithCheck(
                Strings.asynchronousInterview,
                Strings.asynchronousInterviewDescription,
              ),
              spacerVertical(40),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    setState(() {
                      _selectedPage = 1;
                    });
                  },
                  child: Container(
                    height: 61,
                    width: 232,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: WEBColors.cyan, width: 2),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        color: WEBColors.cyan.withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        Strings.startMyFrial,
                        style: Types.whiteBottonTStyle,
                      ),
                    ),
                  ),
                ),
              ),
              spacerVertical(8),
              Text(
                Strings.afterFrialPrice.tr(
                  namedArgs: {
                    'price': '60',
                  },
                ),
                style: Types.textFieldTStyle,
              ),
            ],
          )
        : ProfileMembershipTrialPage(
            onPop: () {
              setState(() {
                _selectedPage = 0;
              });
            },
          );
  }

  Widget _textWithCheck(
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SvgPicture.asset(Vector.checkCircle),
          spacerHorizontal(16),
          Flexible(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: Types.whiteRegular24TStyle,
                  ),
                  TextSpan(
                    text: description,
                    style: Types.whiteRegular24TStyle.apply(
                      color: WEBColors.white.withOpacity(0.66),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
