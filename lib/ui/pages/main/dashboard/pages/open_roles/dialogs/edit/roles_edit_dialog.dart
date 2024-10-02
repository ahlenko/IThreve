import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/ui/components/drop_down/icon_drop_down_field.dart';
import 'package:ithreve_web/ui/components/fields/icon_rounded_field.dart';
import 'package:ithreve_web/ui/components/fields/regular_text_with_point.dart';
import 'package:ithreve_web/ui/components/fields/rounded_add_removable.dart';
import 'package:ithreve_web/ui/components/video/video_player_preview.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/edit/roles_edit_dialog_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/edit/roles_edit_dialog_state.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class RolesEditDialog extends StatefulWidget {
  final Function(bool) onNeedReviewDialog;
  final bool isMaxSize;
  const RolesEditDialog(
      {super.key, required this.onNeedReviewDialog, this.isMaxSize = false});

  @override
  State<RolesEditDialog> createState() => _RolesEditDialogState();
}

class _RolesEditDialogState extends State<RolesEditDialog> {
  RolesEditDialogCubit cubit = getIt.get<RolesEditDialogCubit>();

  @override
  void initState() {
    cubit.changeDialogSizeBool(widget.isMaxSize);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RolesEditDialogCubit, RolesEditDialogState>(
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
                                    widget.onNeedReviewDialog(
                                        state.maxDialogSize);
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        Vector.download,
                                      ),
                                      spacerHorizontal(4),
                                      Text(Strings.save,
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
                  controller: cubit.locationCtrl,
                ),
                IconRoundedField(
                  title: Strings.officeRequirement,
                  icon: Vector.officeBuilding,
                  controller: cubit.officeRequirementCtrl,
                ),
                IconDropDownField(
                  title: Strings.workAuthorization,
                  icon: Vector.identification,
                  selected: cubit.state.visaSponsorship,
                  items: [Strings.notVisaSponsor, Strings.visaSponsorship],
                  onSelected: (value) => cubit.setVisaSponsorship([
                    Strings.notVisaSponsor,
                    Strings.visaSponsorship
                  ].indexOf(value)),
                ),
                IconRoundedField(
                  title: Strings.salary,
                  icon: Vector.currencyDollar,
                  controller: cubit.salaryCtrl,
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
              for (var i = 0; i < (cubit.state.benefits ?? []).length; i++)
                RoundedAddRemovable(
                  title: (cubit.state.benefits ?? [])[i],
                  isRemove: true,
                  onClick: () => cubit.removeBenefits(i),
                ),
            ],
          ),
          RoundedAddRemovable(
            title: Strings.add,
            isAddition: true,
            controller: cubit.benefitsCtrl,
            onClick: () => cubit.addBenefit(),
          ),
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
          Row(
            children: [
              Text(
                Strings.uresponsibilities,
                style: Types.buttonH4TStyle
                    .copyWith(color: WEBColors.white.withOpacity(0.66)),
              ),
              spacerHorizontal(8),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () => setState(() {
                          cubit.responsibillitieAdd();
                        }),
                    child: SvgPicture.asset(
                      Vector.plus,
                      width: 16,
                      height: 16,
                    )),
              )
            ],
          ),
          spacerVertical(4),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < cubit.responsibilitiesCtrl.length; i++)
                  RegularTextWithPoint(
                      focusNode: i == cubit.responsibilitiesCtrl.length - 1
                          ? cubit.newItemNode
                          : null,
                      controller: cubit.responsibilitiesCtrl[i],
                      removeClick: () => setState(() {
                            cubit.responsibillitieRemove(i);
                          })),
              ],
            ),
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
              for (var i = 0; i < (cubit.state.coreSkills ?? []).length; i++)
                RoundedAddRemovable(
                  title: (cubit.state.coreSkills ?? [])[i],
                  isRemove: true,
                  onClick: () => cubit.removeCoreSkills(i),
                ),
            ],
          ),
          RoundedAddRemovable(
            title: Strings.add,
            isAddition: true,
            controller: cubit.coreSkillsCtrl,
            onClick: () => cubit.addCoreSkill(),
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
              for (var i = 0;
                  i < (cubit.state.niceToHaveSkills ?? []).length;
                  i++)
                RoundedAddRemovable(
                  title: (cubit.state.niceToHaveSkills ?? [])[i],
                  isRemove: true,
                  onClick: () => cubit.removeNiceToHaveSkills(i),
                ),
            ],
          ),
          RoundedAddRemovable(
            title: Strings.add,
            isAddition: true,
            controller: cubit.niceToSkillsCtrl,
            onClick: () => cubit.addNiceToHaveSkill(),
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
              for (var i = 0;
                  i < (cubit.state.candidateAttributes ?? []).length;
                  i++)
                RoundedAddRemovable(
                  title: (cubit.state.candidateAttributes ?? [])[i],
                  isRemove: true,
                  onClick: () => cubit.removeCandidateAttributes(i),
                ),
            ],
          ),
          RoundedAddRemovable(
            title: Strings.add,
            isAddition: true,
            controller: cubit.candidateAttributeCtrl,
            onClick: () => cubit.addCandidateAttribute(),
          ),
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
                    for (var i = 0;
                        i < (cubit.state.managers ?? []).length;
                        i++)
                      RoundedAddRemovable(
                        title: (cubit.state.managers ?? [])[i],
                        isRemove: true,
                        onClick: () => cubit.removeTeamManager(i),
                      ),
                    RoundedAddRemovable(
                      title: Strings.add,
                      withoutButton: true,
                      isAddition: true,
                      controller: cubit.managerCtrl,
                      onClick: () => cubit.addTeamManager(),
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
                    for (var i = 0;
                        i < (cubit.state.teamMembers ?? []).length;
                        i++)
                      RoundedAddRemovable(
                        title: (cubit.state.teamMembers ?? [])[i],
                        isRemove: true,
                        onClick: () => cubit.removeTeamMember(i),
                      ),
                    RoundedAddRemovable(
                      title: Strings.add,
                      withoutButton: true,
                      isAddition: true,
                      controller: cubit.memberCtrl,
                      onClick: () => cubit.addTeamMember(),
                    ),
                  ],
                ),
                VideoPlayerPreview(
                  videoName: Strings.managerVideo,
                  isEnableDelete: true,
                  isDelete: cubit.state.editState?.managerVideoRemoved ?? false,
                  onPlayClick: () => {},
                  onDeleteClick: () => cubit.deleteManagerVideo(),
                  onLoadClick: () => cubit.loadManagerVideo(),
                ),
                VideoPlayerPreview(
                  videoName: Strings.teamVideo,
                  isEnableDelete: true,
                  isDelete: cubit.state.editState?.teamVideoRemoved ?? false,
                  onPlayClick: () => {},
                  onDeleteClick: () => cubit.deleteTeamVideo(),
                  onLoadClick: () => cubit.loadTeamVideo(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
