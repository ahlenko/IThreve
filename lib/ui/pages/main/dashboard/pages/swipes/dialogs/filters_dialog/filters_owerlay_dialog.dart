import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/domain/model/selected_unselected.dart';
import 'package:ithreve_web/ui/components/fields/autocomplit_text_t_field.dart';
import 'package:ithreve_web/ui/components/fields/number_field_with_background.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/components/selectors/adding_selectable_item_filters.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/dialogs/filters_dialog/filters_owerlay_dialog_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/dialogs/filters_dialog/filters_owerlay_dialog_state.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class FiltersOwerlayDialog extends StatefulWidget {
  const FiltersOwerlayDialog({super.key});

  @override
  State<FiltersOwerlayDialog> createState() => _FiltersOwerlayDialogState();
}

class _FiltersOwerlayDialogState extends State<FiltersOwerlayDialog> {
  FiltersOwerlayDialogCubit cubit = getIt.get<FiltersOwerlayDialogCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersOwerlayDialogCubit, FiltersOwerlayDialogState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 515),
                child: Container(
                    decoration: BoxDecoration(
                        color: WEBColors.white.withOpacity(0.1),
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(20))),
                    padding: const EdgeInsets.only(
                        left: 32, top: 32, bottom: 32, right: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(Vector.filters),
                                  spacerHorizontal(8),
                                  Text(
                                    'Filters',
                                    style: Types.grayRegular24TStyle.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: WEBColors.white),
                                  )
                                ],
                              ),
                              MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: const Icon(Icons.close,
                                        color: WEBColors.fontWhite),
                                  ))
                            ],
                          ),
                        ),
                        spacerVertical(24),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                horizontalLine(
                                    0.5, WEBColors.white.withOpacity(0.33)),
                                spacerVertical(20),
                                Row(
                                  children: [
                                    SvgPicture.asset(Vector.hand,
                                        width: 24, height: 24),
                                    spacerHorizontal(8),
                                    Text(
                                      'Skills',
                                      style: Types.grayRegular24TStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: WEBColors.white),
                                    )
                                  ],
                                ),
                                spacerVertical(20),
                                Text(
                                  Strings.ucoreSkills.toUpperCase(),
                                  style: Types.buttonBoltH4TStyle.copyWith(
                                      color: WEBColors.white.withOpacity(0.66)),
                                ),
                                spacerVertical(8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      for (var i = 0;
                                          i <= (state.coreSkills ?? []).length;
                                          i++)
                                        if (i < (state.coreSkills ?? []).length)
                                          AddingSelectableItemFilters(
                                            onChangeSelection: () =>
                                                cubit.removeCoreSkill(i),
                                            item: state.coreSkills![i],
                                          )
                                        else
                                          AddingSelectableItemFilters(
                                            onChangeSelection: () =>
                                                cubit.addNewCoreSkill(
                                                    cubit.coreSkillText),
                                            item: SelectedUnselected(
                                                title: 'Add one',
                                                selected: false),
                                          )
                                    ],
                                  ),
                                ),
                                spacerVertical(12),
                                AutocomplitTextTField(
                                  fontSize: 16,
                                  onChanged: (value) =>
                                      cubit.coreSkillText = value,
                                  autocompleteSize: 16,
                                  onSubmitted: (value) =>
                                      cubit.addNewCoreSkill(value),
                                  transparentBackground: false,
                                ),
                                spacerVertical(24),
                                Text(
                                  Strings.niceToHaveSkills.toUpperCase(),
                                  style: Types.buttonBoltH4TStyle.copyWith(
                                      color: WEBColors.white.withOpacity(0.66)),
                                ),
                                spacerVertical(8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      for (var i = 0;
                                          i <=
                                              (state.niceToHaveSkills ?? [])
                                                  .length;
                                          i++)
                                        if (i <
                                            (state.niceToHaveSkills ?? [])
                                                .length)
                                          AddingSelectableItemFilters(
                                            onChangeSelection: () =>
                                                cubit.removeNiceToHaveSkill(i),
                                            item: state.niceToHaveSkills![i],
                                          )
                                        else
                                          AddingSelectableItemFilters(
                                            onChangeSelection: () =>
                                                cubit.addNiceToHaveSkill(
                                                    cubit.niceToHaveText),
                                            item: SelectedUnselected(
                                                title: 'Add one',
                                                selected: false),
                                          )
                                    ],
                                  ),
                                ),
                                spacerVertical(12),
                                AutocomplitTextTField(
                                  fontSize: 16,
                                  onChanged: (value) =>
                                      cubit.niceToHaveText = value,
                                  autocompleteSize: 16,
                                  onSubmitted: (value) =>
                                      cubit.addNiceToHaveSkill(value),
                                  transparentBackground: false,
                                ),
                                spacerVertical(24),
                                horizontalLine(
                                    0.5, WEBColors.white.withOpacity(0.33)),
                                spacerVertical(24),
                                Row(
                                  children: [
                                    SvgPicture.asset(Vector.bookOpen,
                                        width: 24, height: 24),
                                    spacerHorizontal(8),
                                    Text(
                                      'Logistics',
                                      style: Types.grayRegular24TStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: WEBColors.white),
                                    )
                                  ],
                                ),
                                spacerVertical(16),
                                Text(
                                  'RESIDING LOCATION'.toUpperCase(),
                                  style: Types.buttonBoltH4TStyle.copyWith(
                                      color: WEBColors.white.withOpacity(0.66)),
                                ),
                                spacerVertical(8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      for (var i = 0;
                                          i <=
                                              (state.residingLocation ?? [])
                                                  .length;
                                          i++)
                                        if (i <
                                            (state.residingLocation ?? [])
                                                .length)
                                          AddingSelectableItemFilters(
                                            onChangeSelection: () =>
                                                cubit.removeLocation(i),
                                            item: state.residingLocation![i],
                                          )
                                        else
                                          AddingSelectableItemFilters(
                                            onChangeSelection: () =>
                                                cubit.addNewLocation(
                                                    cubit.residingLocationText),
                                            item: SelectedUnselected(
                                                title: 'Add one',
                                                selected: false),
                                          )
                                    ],
                                  ),
                                ),
                                spacerVertical(12),
                                AutocomplitTextTField(
                                  fontSize: 16,
                                  onChanged: (value) =>
                                      cubit.residingLocationText = value,
                                  autocompleteSize: 16,
                                  onSubmitted: (value) =>
                                      cubit.addNewLocation(value),
                                  transparentBackground: false,
                                ),
                                spacerVertical(24),
                                Text(
                                  'TYPE'.toUpperCase(),
                                  style: Types.buttonBoltH4TStyle.copyWith(
                                      color: WEBColors.white.withOpacity(0.66)),
                                ),
                                spacerVertical(8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      for (var i = 0;
                                          i < (state.type ?? []).length;
                                          i++)
                                        AddingSelectableItemFilters(
                                          onChangeSelection: () =>
                                              cubit.selectUnselectType(i),
                                          item: state.type![i],
                                        )
                                    ],
                                  ),
                                ),
                                spacerVertical(24),
                                horizontalLine(
                                    0.5, WEBColors.white.withOpacity(0.33)),
                                spacerVertical(24),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Visa Sponsorship',
                                      style: Types.buttonBoltH4TStyle.copyWith(
                                          color: WEBColors.white
                                              .withOpacity(0.66)),
                                    ),
                                    Switch(
                                      value: state.visaSponsorship,
                                      activeColor: WEBColors.white,
                                      activeTrackColor: WEBColors.cyan,
                                      onChanged: (value) =>
                                          cubit.setVisaSponsorship(value),
                                    )
                                  ],
                                ),
                                spacerVertical(24),
                                horizontalLine(
                                    0.5, WEBColors.white.withOpacity(0.33)),
                                spacerVertical(24),
                                Text(
                                  'Benefits'.toUpperCase(),
                                  style: Types.buttonBoltH4TStyle.copyWith(
                                      color: WEBColors.white.withOpacity(0.66)),
                                ),
                                spacerVertical(8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      for (var i = 0;
                                          i <= (state.benefits ?? []).length;
                                          i++)
                                        if (i < (state.benefits ?? []).length)
                                          AddingSelectableItemFilters(
                                            onChangeSelection: () =>
                                                cubit.removeBenefits(i),
                                            item: state.benefits![i],
                                          )
                                        else
                                          AddingSelectableItemFilters(
                                            onChangeSelection: () =>
                                                cubit.addBenefits(
                                                    cubit.benefitsText),
                                            item: SelectedUnselected(
                                                title: 'Add one',
                                                selected: false),
                                          )
                                    ],
                                  ),
                                ),
                                spacerVertical(12),
                                AutocomplitTextTField(
                                  fontSize: 16,
                                  onChanged: (value) =>
                                      cubit.benefitsText = value,
                                  autocompleteSize: 16,
                                  onSubmitted: (value) =>
                                      cubit.addBenefits(value),
                                  transparentBackground: false,
                                ),
                                spacerVertical(24),
                                horizontalLine(
                                    0.5, WEBColors.white.withOpacity(0.33)),
                                spacerVertical(24),
                                Text(
                                  'Salary',
                                  style: Types.buttonBoltH4TStyle.copyWith(
                                      color: WEBColors.white.withOpacity(0.66)),
                                ),
                                spacerVertical(8),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 110,
                                      child: NumberFieldWithBackground(
                                        hintText: 'Min price',
                                        withSpacer: false,
                                        fontSize: 16,
                                        controller: cubit.minSalary,
                                      ),
                                    ),
                                    spacerHorizontal(14),
                                    SizedBox(
                                      width: 110,
                                      child: NumberFieldWithBackground(
                                        hintText: 'Max Price',
                                        withSpacer: false,
                                        fontSize: 16,
                                        controller: cubit.maxSalary,
                                      ),
                                    ),
                                  ],
                                ),
                                spacerVertical(24),
                                horizontalLine(
                                    0.5, WEBColors.white.withOpacity(0.33)),
                                spacerVertical(24),
                                Text(
                                  'Contract',
                                  style: Types.buttonBoltH4TStyle.copyWith(
                                      color: WEBColors.white.withOpacity(0.66)),
                                ),
                                Text(
                                  'Per project',
                                  style: Types.textLinkTStyle.copyWith(
                                      color: WEBColors.white.withOpacity(0.66)),
                                ),
                                spacerVertical(8),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 110,
                                      child: NumberFieldWithBackground(
                                        hintText: 'Min price',
                                        withSpacer: false,
                                        fontSize: 16,
                                        controller: cubit.minContract,
                                      ),
                                    ),
                                    spacerHorizontal(14),
                                    SizedBox(
                                      width: 110,
                                      child: NumberFieldWithBackground(
                                        hintText: 'Max Price',
                                        withSpacer: false,
                                        fontSize: 16,
                                        controller: cubit.maxContract,
                                      ),
                                    ),
                                  ],
                                ),
                                spacerVertical(24),
                                horizontalLine(
                                    0.5, WEBColors.white.withOpacity(0.33)),
                              ],
                            ),
                          ),
                        ))
                      ],
                    ))));
      },
    );
  }
}
