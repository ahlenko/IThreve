import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';
import 'package:ithreve_web/ui/utils/svg_utils.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.companyInformation.capitalizeFirstLetterOfEachWord(),
              style: Types.headerItemTStyle,
            ),
            SvgPicture.asset(
              Vector.pencil,
            ),
          ],
        ),
        spacerVertical(16),
        Text(
          Strings.websiteLink,
          style: Types.buttonH4TStyle.apply(
            color: WEBColors.white.withOpacity(0.66),
          ),
        ),
        spacerVertical(5),
        Text('https://www.ithrive.io', style: Types.buttonH4TStyle),
        spacerVertical(16),
        Text(
          Strings.companyInformation.capitalizeFirstLetterOfEachWord(),
          style: Types.buttonH4TStyle.apply(
            color: WEBColors.white.withOpacity(0.66),
          ),
        ),
        spacerVertical(8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContainer(
              Vector.officeBuilding,
              Strings.industry,
              'HR Tech',
            ),
            spacerHorizontal(16),
            _buildContainer(
              Vector.users,
              Strings.employeeCount,
              '20',
            ),
            spacerHorizontal(16),
            _buildContainer(
              Vector.officeBuilding,
              Strings.foundingDate,
              '2024',
            ),
            spacerHorizontal(16),
            Expanded(
              child: _buildContainer(
                Vector.chartSquareBar,
                Strings.products,
                'Mobile and web app software, as well as independent software to improve the efficiency of our product.',
                textSize: 20,
              ),
            ),
          ],
        ),
        spacerVertical(16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildContainer(
                Vector.heart,
                Strings.values,
                '',
                contentWidget: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    _mockedQualitiesList.length,
                    (index) => _buildSmallContianer(
                      _mockedQualitiesList[index],
                    ),
                  ),
                ),
              ),
            ),
            spacerHorizontal(16),
            Expanded(
              child: _buildContainer(
                Vector.hand,
                Strings.mission,
                'To make recruitment easy, fun and efficient for both employees and employers. To bring hope and limitlessness into people’s lives. ',
              ),
            ),
          ],
        ),
        spacerVertical(16),
        _buildContainer(Vector.sun, Strings.oneGoal,
            'To be the #1 platform in the market. To have the most amount of users on our platform. Be the most innovative and high quality and effective and efficient product by far in the market and to continue pushing beyond our own limits. '),
        spacerVertical(16),
        StaggeredGrid.count(
          crossAxisCount: context.screenWidth > 1270
              ? 6
              : context.screenWidth > 800
                  ? 4
                  : 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: _buildGridItem(
                title: Strings.productImage,
                description: Strings.productImageDescription,
                isLarge: true,
              ),
            ),
            _buildGridItem(
              title: Strings.teamImage,
            ),
            _buildGridItem(
              title: Strings.productImage,
            ),
            _buildGridItem(
              title: Strings.officeImage,
            ),
            _buildGridItem(
              title: Strings.officeImage,
            ),
            _buildGridItem(
              title: Strings.officeImage,
            ),
            _buildGridItem(
              title: Strings.ceoIntro,
            ),
            _buildGridItem(
              title: Strings.managerIntro,
            ),
            _buildGridItem(
              title: Strings.teamVideo,
            ),
            _buildGridItem(
              title: Strings.teamVideo,
            ),
            _buildGridItem(
              title: Strings.teamVideo,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContainer(
    String svgPath,
    String title,
    String contentText, {
    double textSize = 24,
    Widget? contentWidget,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: WEBColors.tertiaryBG,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                svgPath,
                width: 20,
                height: 20,
                fit: BoxFit.scaleDown,
                colorFilter: svgColorFilter(WEBColors.white.withOpacity(0.66)),
              ),
              spacerHorizontal(6),
              Text(
                title,
                style: Types.buttonH4TStyle.apply(
                  color: WEBColors.white.withOpacity(0.66),
                ),
              ),
            ],
          ),
          spacerVertical(8),
          contentWidget ??
              Text(
                contentText,
                style: Types.whiteBottonTStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: textSize,
                ),
              ),
        ],
      ),
    );
  }

  Widget _buildSmallContianer(
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: WEBColors.white.withOpacity(
          0.1,
        ),
      ),
      child: Text(
        text,
        style: Types.buttonH4TStyle,
      ),
    );
  }

  Widget _buildGridItem(
      {required String title, String? description, bool isLarge = false}) {
    return AspectRatio(
      aspectRatio: isLarge ? 1 / 1 : 2.04 / 1,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: WEBColors.tertiaryBG,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: WEBColors.white),
            spacerVertical(8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Types.buttonH4TStyle,
            ),
            if (description != null) ...[
              spacerVertical(8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Types.buttonH4TStyle,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

const List<String> _mockedQualitiesList = [
  'Responsibility',
  'Communication skills',
  'Adaptability',
  'Creativity',
  'Teamwork skills',
  'Desire for development'
];
