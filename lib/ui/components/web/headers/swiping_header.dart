import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class SwipingHeader extends StatelessWidget {
  final bool autoMessageSelected;
  final String currentVacancy;
  final List<String> vacancyList;

  final VoidCallback onFiltersClick;
  final Function(String) onSelectVacancy;
  final Function(bool) onAutoMessageStateChange;
  const SwipingHeader(
      {super.key,
      required this.autoMessageSelected,
      required this.currentVacancy,
      required this.onFiltersClick,
      required this.onAutoMessageStateChange,
      required this.onSelectVacancy,
      required this.vacancyList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onFiltersClick,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(Vector.filters),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Row(
                  children: [
                    Text(
                      currentVacancy,
                      style: Types.whiteRegular24TStyle.copyWith(
                          fontSize: 24,
                          color: WEBColors.fontWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SvgPicture.asset(Vector.arrowDownBolt),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                Strings.automaticInterestMessage,
                style: Types.buttonH4TStyle,
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Switch(
                      value: autoMessageSelected,
                      activeColor: WEBColors.white,
                      activeTrackColor: WEBColors.cyan,
                      onChanged: (value) => onAutoMessageStateChange(value))),
            ],
          )
        ],
      ),
    );
  }
}
