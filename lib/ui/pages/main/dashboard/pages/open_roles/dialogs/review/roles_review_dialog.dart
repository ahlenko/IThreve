import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/ui/components/drop_down/icon_drop_down_field.dart';
import 'package:ithreve_web/ui/components/fields/icon_rounded_field.dart';
import 'package:ithreve_web/ui/components/fields/rounded_add_removable.dart';
import 'package:ithreve_web/ui/components/video/video_player_preview.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/review/roles_review_dialog_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/review/roles_review_dialog_state.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class RolesReviewDialog extends StatefulWidget {
  final Function(bool) onNeedEditDialog;
  final bool isMaxSize;
  const RolesReviewDialog(
      {super.key, required this.onNeedEditDialog, this.isMaxSize = false});

  @override
  State<RolesReviewDialog> createState() => _RolesReviewDialogState();
}

class _RolesReviewDialogState extends State<RolesReviewDialog> {
  RolesReviewDialogCubit cubit = getIt.get<RolesReviewDialogCubit>();

  @override
  void initState() {
    cubit.changeDialogSizeBool(widget.isMaxSize);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RolesReviewDialogCubit, RolesReviewDialogState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                margin: EdgeInsets.only(
                    left: (screenWidth(context) > UiConst.adaptiveWidth
                            ? UiConst.drawerWidth
                            : UiConst.drawerWidthCompact) +
                        15,
                    right: 15,
                    top: !state.maxDialogSize ? 120 : 20,
                    bottom: !state.maxDialogSize ? 120 : 20),
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: WEBColors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Strings.jobDescription,
                              style: Types.headerBoldButtonTStyle),
                          Row(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    widget
                                        .onNeedEditDialog(state.maxDialogSize);
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(Vector.pencil,
                                          color: WEBColors.white,
                                          width: 24,
                                          height: 24),
                                      spacerHorizontal(4),
                                      Text(Strings.edit,
                                          style: Types.headerBoldButtonTStyle),
                                    ],
                                  ),
                                ),
                              ),
                              spacerHorizontal(20),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => cubit.changeDialogSize(),
                                  child: SvgPicture.asset(!state.maxDialogSize
                                      ? Vector.arrowsExpand
                                      : Vector.minus),
                                ),
                              ),
                              spacerHorizontal(20),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: SvgPicture.asset(Vector.cross,
                                      color: WEBColors.white,
                                      width: 21,
                                      height: 21),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      spacerVertical(24),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                _buildLogisticsComponent(),
                                spacerVertical(16),
                                _buildSkillsComponent(),
                                spacerVertical(16),
                                _buildTeamComponent()
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ))));
      },
    );
  }

  _buildLogisticsComponent() {
    return Container(
      decoration: BoxDecoration(
        color: WEBColors.black.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.logistics.toUpperCase(),
            style: Types.buttonBoltH4TStyle
                .copyWith(color: WEBColors.fontWhite.withOpacity(0.66)),
          ),
          spacerVertical(16),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 40,
              runSpacing: 8,
              children: [
                IconRoundedField(
                  title: Strings.location,
                  icon: Vector.location,
                  value: cubit.state.location,
                ),
                IconRoundedField(
                  title: Strings.officeRequirement,
                  icon: Vector.officeBuilding,
                  value: cubit.state.office,
                ),
                IconDropDownField(
                  title: Strings.workAuthorization,
                  icon: Vector.identification,
                  value: cubit.state.authorization,
                ),
                IconRoundedField(
                  title: Strings.salary,
                  icon: Vector.currencyDollar,
                  value: cubit.state.salary,
                ),
              ],
            ),
          ),
          spacerVertical(12),
          Row(
            children: [
              SvgPicture.asset(
                Vector.hand,
                width: 16,
                height: 16,
              ),
              spacerHorizontal(4),
              Text(
                Strings.benefits,
                style: Types.buttonH4TStyle
                    .copyWith(color: WEBColors.white.withOpacity(0.66)),
              )
            ],
          ),
          spacerVertical(4),
          Wrap(
            spacing: 8,
            children: [
              for (String item in cubit.state.benefits ?? [])
                RoundedAddRemovable(
                  icon: Vector.heart,
                  title: item,
                ),
            ],
          )
        ],
      ),
    );
  }

  _buildSkillsComponent() {
    return Container(
      decoration: BoxDecoration(
        color: WEBColors.black.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.skillUpr.toUpperCase(),
            style: Types.buttonBoltH4TStyle
                .copyWith(color: WEBColors.fontWhite.withOpacity(0.66)),
          ),
          spacerVertical(16),
          Text(
            Strings.uresponsibilities,
            style: Types.buttonH4TStyle
                .copyWith(color: WEBColors.white.withOpacity(0.66)),
          ),
          spacerVertical(4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String item in cubit.state.candidateResponsibillities ?? [])
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Row(
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: WEBColors.white),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      Flexible(
                        child: Text(
                          item,
                          style: Types.buttonH4TStyle,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          spacerVertical(10),
          Text(
            Strings.ucoreSkills,
            style: Types.buttonH4TStyle
                .copyWith(color: WEBColors.white.withOpacity(0.66)),
          ),
          spacerVertical(4),
          Wrap(
            spacing: 8,
            children: [
              for (String item in cubit.state.coreSkills ?? [])
                RoundedAddRemovable(
                  title: item,
                ),
            ],
          ),
          spacerVertical(12),
          Text(
            Strings.niceToHaveSkills,
            style: Types.buttonH4TStyle
                .copyWith(color: WEBColors.white.withOpacity(0.66)),
          ),
          spacerVertical(4),
          Wrap(
            spacing: 8,
            children: [
              for (String item in cubit.state.niceToHaveSkills ?? [])
                RoundedAddRemovable(
                  title: item,
                ),
            ],
          ),
          spacerVertical(12),
          Text(
            Strings.attributesOfTheIdealCandidate,
            style: Types.buttonH4TStyle
                .copyWith(color: WEBColors.white.withOpacity(0.66)),
          ),
          spacerVertical(4),
          Wrap(
            spacing: 8,
            children: [
              for (String item in cubit.state.candidateAttributes ?? [])
                RoundedAddRemovable(
                  icon: Vector.heart,
                  title: item,
                ),
            ],
          )
        ],
      ),
    );
  }

  _buildTeamComponent() {
    return Container(
      decoration: BoxDecoration(
        color: WEBColors.black.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.team.toUpperCase(),
            style: Types.buttonBoltH4TStyle
                .copyWith(color: WEBColors.fontWhite.withOpacity(0.66)),
          ),
          spacerVertical(16),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 40,
              runSpacing: 8,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.manager,
                      style: Types.buttonH4TStyle
                          .copyWith(color: WEBColors.white.withOpacity(0.66)),
                    ),
                    spacerVertical(4),
                    for (String item in cubit.state.managers ?? [])
                      RoundedAddRemovable(
                        title: item,
                      ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.teamMembers,
                      style: Types.buttonH4TStyle
                          .copyWith(color: WEBColors.white.withOpacity(0.66)),
                    ),
                    spacerVertical(4),
                    for (String item in cubit.state.teamMembers ?? [])
                      RoundedAddRemovable(
                        title: item,
                      ),
                  ],
                ),
                VideoPlayerPreview(
                  videoName: Strings.managerVideo,
                  onPlayClick: () => {},
                ),
                VideoPlayerPreview(
                  videoName: Strings.teamVideo,
                  onPlayClick: () => {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
