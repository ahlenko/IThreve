import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class JobOfferPercentContainerColumn extends StatelessWidget {
  const JobOfferPercentContainerColumn({super.key});

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
        _buildContainer(text: '.14%'),
        _buildContainer(
          text: '.14%',
          margin: const EdgeInsets.symmetric(vertical: 37),
        ),
        _buildContainer(text: '.14%'),
        _buildContainer(
          text: '.14%',
          margin: const EdgeInsets.symmetric(vertical: 37),
        ),
        _buildContainer(text: '.14%'),
        _buildContainer(
          text: '.14%',
          margin: const EdgeInsets.only(top: 37),
        ),
      ],
    );
  }

  Widget _buildContainer({
    EdgeInsets margin = EdgeInsets.zero,
    required String text,
  }) {
    return Container(
      margin: margin,
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
