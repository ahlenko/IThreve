import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/domain/model/team_members.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/buttons/rounded_icon_button.dart';
import 'package:ithreve_web/ui/components/fields/autocomplit_user_t_field.dart';
import 'package:ithreve_web/ui/components/fields/icon_multiline_text_field.dart';
import 'package:ithreve_web/ui/components/fields/regular_text_field.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class CandidateTeamJoinedStep extends StatefulWidget {
  final Function() onNeedNextPage;
  final Function() onNeedPrewPage;
  const CandidateTeamJoinedStep(
      {super.key, required this.onNeedNextPage, required this.onNeedPrewPage});

  @override
  State<CandidateTeamJoinedStep> createState() =>
      _CandidateTeamJoinedStepState();
}

class _CandidateTeamJoinedStepState extends State<CandidateTeamJoinedStep> {
  TextEditingController teamCtrl = TextEditingController();

  List<TextEditingController> nameControllers = [
    TextEditingController(text: ''),
    TextEditingController(text: '')
  ];

  List<TextEditingController> phoneControllers = [
    TextEditingController(text: ''),
    TextEditingController(text: '')
  ];

  List<TeamMembers> addedMembers = [
    TeamMembers(name: '', role: ''),
    TeamMembers(name: '', role: ''),
  ];

  List<TeamMembers> existMembers = [
    TeamMembers(name: 'Alan Matviienko', role: 'CTO', newMember: false),
    TeamMembers(name: 'Alana Peterson', role: 'UX Copy', newMember: false),
    TeamMembers(name: 'Sofia Yay', role: 'Developer', newMember: false),
  ];

  @override
  void dispose() {
    for (var controller in nameControllers) {
      controller.dispose();
    }
    for (var controller in phoneControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = screenWidth(context);
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RegularBoltRegularText(
                firstText: Strings.whatTeamWillTheCandidate,
              ),
              spacerVertical(12),
              Text(
                Strings.youCanPutTheirContactInformation,
                style: Types.grayRegular24TStyle,
              ),
              spacerVertical(65),
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: width >= 1160 ? 720 : 1000),
                child: RegularTextField(
                  withSpacer: false,
                  fontSize: 32,
                  hintText: Strings.teamName,
                  controller: teamCtrl,
                ),
              ),
              spacerVertical(65),
              for (var i = 0; i < addedMembers.length; i++)
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 240,
                  children: [
                    SizedBox(
                      width: width >= 1160 ? 380 : null,
                      child: AutocomplitUserTField(
                        fontSize: 24,
                        controller: nameControllers[i],
                        autocompleteData: existMembers,
                        clearSubmittedText: false,
                        onSubmitted: (value) => setState(() {
                          addedMembers[i] = value.copy();
                        }),
                        confirmed: !addedMembers[i].newMember,
                        errorText: addedMembers[i].nameError,
                        onChanged: (value) => setState(() {
                          addedMembers[i].name = value;

                          addedMembers[i].newMember = true;
                        }),
                        icon: i == 0 ? Vector.user : Vector.users,
                        title: i == 0
                            ? Strings.manager
                            : i == 1
                                ? Strings.teamMembers
                                : null,
                      ),
                    ),
                    SizedBox(
                      width: width >= 1160 ? 380 : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Offstage(
                            offstage: (!addedMembers[i].newMember ||
                                    addedMembers[i].name.isEmpty) &&
                                ((addedMembers[i].phone ?? '').isEmpty),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxWidth: width >= 1160 ? 332 : width - 206),
                              child: IconMultilineTextField(
                                fontSize: 24,
                                controller: phoneControllers[i],
                                initValue: addedMembers[i].phone ?? '',
                                icon: Vector.phone,
                                errorText: addedMembers[i].phoneEmailError,
                                onEnter: (value) => setState(() {
                                  addedMembers[i].phone = value;
                                }),
                                title: i == 0
                                    ? Strings.managerEmailOrPhoneNumber
                                    : i == 1
                                        ? Strings.teamMemberEmailOrPhoneNumber
                                        : null,
                              ),
                            ),
                          ),
                          Offstage(
                            offstage: i < 2 &&
                                ((addedMembers[i].phone ?? '').isEmpty &&
                                    addedMembers[i].name.isEmpty),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: () => {
                                        setState(() {
                                          if (i < 2) {
                                            nameControllers[i].text = '';
                                            phoneControllers[i].text = '';
                                            addedMembers[i] =
                                                TeamMembers(name: '', role: '');
                                          } else {
                                            nameControllers.removeAt(i);
                                            phoneControllers.removeAt(i);
                                            addedMembers.removeAt(i);
                                          }
                                        })
                                      },
                                  child: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child:
                                          SvgPicture.asset(Vector.closeRound))),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (width < 1160) spacerVertical(55),
                  ],
                ),
              spacerVertical(40),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: RoundedIconButton(
                    backgroundColor: WEBColors.white,
                    borderColor: Colors.transparent,
                    onClick: () => {
                          setState(() {
                            addedMembers.add(
                              TeamMembers(name: '', role: ''),
                            );
                            nameControllers
                                .add(TextEditingController(text: ''));
                            phoneControllers
                                .add(TextEditingController(text: ''));
                          })
                        },
                    iconPath: Vector.plusCircle,
                    text: Strings.addMore),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Row(
                  children: [
                    GradientButton(
                        height: 75,
                        horizontalSpacer: 54,
                        gradientSource: Raster.greenGradient,
                        onClick: () => {widget.onNeedNextPage()},
                        text: Strings.next),
                    spacerHorizontal(32),
                    ClickableTextButton(
                        onClick: () => widget.onNeedPrewPage(),
                        text: Strings.back,
                        hoveredStyle: Types.textFieldTitleTStyle
                            .copyWith(color: WEBColors.white),
                        regularStyle: Types.textFieldTitleTStyle)
                  ],
                ),
              )
            ]));
  }
}
