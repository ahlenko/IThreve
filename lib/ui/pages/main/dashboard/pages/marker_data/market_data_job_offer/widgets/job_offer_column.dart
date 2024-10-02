import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class JobOfferColumn extends StatelessWidget {
  const JobOfferColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.jobOffer,
          style: Types.buttonBoltH4TStyle.apply(
            color: WEBColors.white.withOpacity(
              0.66,
            ),
          ),
        ),
        spacerVertical(35),
        Text(
          'Top 30%',
          style: Types.headerItemTStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Text(
            'Top 20%',
            style: Types.headerItemTStyle,
          ),
        ),
        Text(
          'Top 30%',
          style: Types.headerItemTStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Text(
            'Top 40%',
            style: Types.headerItemTStyle,
          ),
        ),
        Text(
          'Top 40%',
          style: Types.headerItemTStyle,
        ),
        spacerVertical(35),
        Text(
          'Top 50%',
          style: Types.headerItemTStyle,
        ),
      ],
    );
  }
}
