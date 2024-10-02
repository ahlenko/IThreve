import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class NumberOfColumn extends StatelessWidget {
  const NumberOfColumn({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Types.buttonBoltH4TStyle.apply(
            color: WEBColors.white.withOpacity(
              0.66,
            ),
          ),
        ),
        spacerVertical(35),
        _buildRow(number: 400, percent: 14),
        _buildRow(
          number: 400,
          percent: 14,
          padding: const EdgeInsets.symmetric(vertical: 35),
        ),
        _buildRow(number: 400, percent: 14),
        _buildRow(
          number: 400,
          percent: 14,
          padding: const EdgeInsets.symmetric(vertical: 35),
        ),
        _buildRow(number: 400, percent: 14),
        _buildRow(
          number: 400,
          percent: 14,
          padding: const EdgeInsets.only(top: 35),
        ),
      ],
    );
  }

  Widget _buildRow({
    required int number,
    required double percent,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Text(
            number.toString(),
            style: Types.headerItemTStyle,
          ),
          spacerHorizontal(30),
          _buildContainer(
            text: '.$percent%',
          ),
        ],
      ),
    );
  }

  Widget _buildContainer({
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: WEBColors.liteGreen.withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Vector.trendingUp,
          ),
          spacerHorizontal(4),
          Text(
            text,
            style: Types.liteGreenRegularSmallStyle,
          ),
        ],
      ),
    );
  }
}
