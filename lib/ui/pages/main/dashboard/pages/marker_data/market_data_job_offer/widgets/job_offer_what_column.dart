import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class JobOfferWhatColumn extends StatelessWidget {
  const JobOfferWhatColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.what,
          style: Types.buttonBoltH4TStyle.apply(
            color: WEBColors.white.withOpacity(
              0.66,
            ),
          ),
        ),
        spacerVertical(35),
        Text(
          'All Market',
          style: Types.headerItemTStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Text(
            'Tech - Industry',
            style: Types.headerItemTStyle,
          ),
        ),
        Text(
          'Product Designer',
          style: Types.headerItemTStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Text(
            'Software Engineer',
            style: Types.headerItemTStyle,
          ),
        ),
        Text(
          'Market Data Engineer',
          style: Types.headerItemTStyle,
        ),
        spacerVertical(35),
        Text(
          'Data Scientist',
          style: Types.headerItemTStyle,
        ),
      ],
    );
  }
}
