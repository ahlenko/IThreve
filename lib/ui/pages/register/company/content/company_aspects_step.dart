import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/domain/model/selected_unselected.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/selectors/text_selector.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class CompanyAspectsStep extends StatefulWidget {
  final Function() onNeedNextPage;
  final Function() onNeedPrewPage;
  const CompanyAspectsStep(
      {super.key, required this.onNeedNextPage, required this.onNeedPrewPage});

  @override
  State<CompanyAspectsStep> createState() => _CompanyAspectsStepState();
}

class _CompanyAspectsStepState extends State<CompanyAspectsStep> {
  List<SelectedUnselected> items = [
    SelectedUnselected(title: 'Design'),
    SelectedUnselected(title: 'Engineering'),
    SelectedUnselected(title: 'Data'),
    SelectedUnselected(title: 'Marketing'),
    SelectedUnselected(title: 'Business'),
    SelectedUnselected(title: 'Other'),
  ];

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
                firstText: Strings.whatAspectOfTheCompany,
              ),
              spacerVertical(65),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 24,
                children: [
                  SizedBox(
                      width: width >= 1160 ? 317.33 : null,
                      child: Column(
                        children: [
                          for (int i = 0; i < 3; i++)
                            if (items.length > i)
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: i == 3 - 1 ? 0 : 24),
                                child: TextSelector(
                                  selected: items[i].selected,
                                  text: items[i].title,
                                  onSelect: (selected) {
                                    setState(() {
                                      items[i].selected = selected;
                                    });
                                  },
                                ),
                              )
                        ],
                      )),
                  if (width < 1160) spacerVertical(24),
                  SizedBox(
                      width: width >= 1160 ? 317.33 : null,
                      child: Column(
                        children: [
                          for (int i = 3; i < 6; i++)
                            if (items.length > i)
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: i == 6 - 1 ? 0 : 24),
                                child: TextSelector(
                                  selected: items[i].selected,
                                  text: items[i].title,
                                  onSelect: (selected) {
                                    setState(() {
                                      items[i].selected = selected;
                                    });
                                  },
                                ),
                              )
                        ],
                      )),
                  if (width < 1160) spacerVertical(24),
                  SizedBox(
                      width: width >= 1160 ? 317.33 : null,
                      child: Column(
                        children: [
                          for (int i = 6; i < 9; i++)
                            if (items.length > i)
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: i == 9 - 1 ? 0 : 24),
                                child: TextSelector(
                                  selected: items[i].selected,
                                  text: items[i].title,
                                  onSelect: (selected) {
                                    setState(() {
                                      items[i].selected = selected;
                                    });
                                  },
                                ),
                              )
                        ],
                      ))
                ],
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
              ),
            ]));
  }
}
