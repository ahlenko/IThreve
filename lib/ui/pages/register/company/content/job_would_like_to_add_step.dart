import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/domain/model/selected_unselected.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/selectors/check_bocks_text_selector.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class JobWouldLikeToAddStep extends StatefulWidget {
  final Function() onNeedNextPage;
  const JobWouldLikeToAddStep({super.key, required this.onNeedNextPage});

  @override
  State<JobWouldLikeToAddStep> createState() => _JobWouldLikeToAddStepState();
}

class _JobWouldLikeToAddStepState extends State<JobWouldLikeToAddStep> {
  List<SelectedUnselected> items = [
    SelectedUnselected(title: 'Select all'),
    SelectedUnselected(title: 'Product Designer'),
    SelectedUnselected(title: 'Software Engineer'),
    SelectedUnselected(title: 'Marketing Specialist'),
  ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RegularBoltRegularText(
                firstText: Strings.whichOneOfTheseJobs,
              ),
              spacerVertical(12),
              Text(
                Strings.weFoundTheseJobPosts,
                style: Types.grayRegular24TStyle,
              ),
              spacerVertical(65),
              Column(
                children: [
                  for (int i = 0; i < items.length; i++)
                    if (items.length > i)
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: i == items.length - 1 ? 0 : 24),
                        child: CheckBocksTextSelector(
                          selected: items[i].selected,
                          maintext: items[i].title,
                          description:
                              i != 0 ? Strings.shortJobDescription : null,
                          suffix: i != 0 ? Strings.viaLinkedin : null,
                          onSelect: (selected) {
                            setState(() {
                              if (i == 0) {
                                for (SelectedUnselected item in items) {
                                  item.selected = selected;
                                }
                              } else {
                                items[i].selected = selected;
                                var allSelected = true;
                                for (int i = 1; i < items.length; i++) {
                                  if (!items[i].selected) allSelected = false;
                                }
                                items[0].selected = allSelected;
                              }
                            });
                          },
                        ),
                      )
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
                        onClick: () => widget.onNeedNextPage(),
                        text: Strings.skip,
                        hoveredStyle: Types.textFieldTitleTStyle
                            .copyWith(color: WEBColors.white),
                        regularStyle: Types.textFieldTitleTStyle)
                  ],
                ),
              ),
            ]));
  }
}
