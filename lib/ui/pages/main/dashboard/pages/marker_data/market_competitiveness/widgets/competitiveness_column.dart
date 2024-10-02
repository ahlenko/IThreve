import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

enum CompetitivenessStatusEnum { low, medium, high }

class CompetitivenessColumn extends StatelessWidget {
  const CompetitivenessColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '',
          style: Types.buttonBoltH4TStyle.apply(
            color: WEBColors.white.withOpacity(
              0.66,
            ),
          ),
        ),
        spacerVertical(35),
        _buildContainer(status: CompetitivenessStatusEnum.low),
        _buildContainer(
          status: CompetitivenessStatusEnum.high,
          margin: const EdgeInsets.symmetric(vertical: 32),
        ),
        _buildContainer(
          status: CompetitivenessStatusEnum.medium,
        ),
        _buildContainer(
          status: CompetitivenessStatusEnum.high,
          margin: const EdgeInsets.symmetric(vertical: 32),
        ),
        _buildContainer(
          status: CompetitivenessStatusEnum.low,
        ),
        _buildContainer(
          status: CompetitivenessStatusEnum.medium,
          margin: const EdgeInsets.only(top: 32),
        ),
      ],
    );
  }

  Widget _buildContainer(
      {EdgeInsets margin = EdgeInsets.zero,
      required CompetitivenessStatusEnum status}) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          6,
        ),
        color: _getContainerColor(status),
      ),
      child: Text(
        _getText(status),
        style: Types.buttonH4TStyle.copyWith(
          fontWeight: FontWeight.w500,
          color: _getTextColor(status),
        ),
      ),
    );
  }

  Color _getContainerColor(CompetitivenessStatusEnum status) {
    switch (status) {
      case CompetitivenessStatusEnum.low:
        return WEBColors.green100;
      case CompetitivenessStatusEnum.medium:
        return WEBColors.purple100;

      case CompetitivenessStatusEnum.high:
        return WEBColors.red100;
    }
  }

  Color _getTextColor(CompetitivenessStatusEnum status) {
    switch (status) {
      case CompetitivenessStatusEnum.low:
        return WEBColors.green;
      case CompetitivenessStatusEnum.medium:
        return WEBColors.purple;

      case CompetitivenessStatusEnum.high:
        return WEBColors.red;
    }
  }

  String _getText(CompetitivenessStatusEnum status) {
    switch (status) {
      case CompetitivenessStatusEnum.low:
        return Strings.low;
      case CompetitivenessStatusEnum.medium:
        return Strings.medium;

      case CompetitivenessStatusEnum.high:
        return Strings.high;
    }
  }
}
