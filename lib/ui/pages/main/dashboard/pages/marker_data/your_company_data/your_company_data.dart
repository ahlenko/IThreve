import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/domain/model/month_statisctic_model.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class YourCompanyData extends StatefulWidget {
  const YourCompanyData({super.key});

  @override
  State<YourCompanyData> createState() => _YourCompanyDataState();
}

class _YourCompanyDataState extends State<YourCompanyData> {
  String _yearValue = '2024';

  static const _years = [
    '2024',
    '2025',
    '2026',
  ];

  final _monthStatistic = [
    MonthStatisticModel(month: "Jan.", counter: 30),
    MonthStatisticModel(month: "Feb.", counter: 15),
    MonthStatisticModel(month: "Mar.", counter: 15),
    MonthStatisticModel(month: "Apr.", counter: 30),
    MonthStatisticModel(month: "May.", counter: 20),
    MonthStatisticModel(month: "Jun.", counter: 30),
    MonthStatisticModel(month: "Jul.", counter: 30),
    MonthStatisticModel(month: "Aug.", counter: 15),
    MonthStatisticModel(month: "Sept.", counter: 5),
    MonthStatisticModel(month: "Oct.", counter: 50),
    MonthStatisticModel(month: "Nov.", counter: 20),
    MonthStatisticModel(month: "Dec.", counter: 30),
  ];

  List<Color> _listColumnColors = [];

  @override
  void initState() {
    _listColumnColors =
        List.filled(_monthStatistic.length, WEBColors.cyan.withOpacity(0.33));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StaggeredGrid.count(
          crossAxisCount: context.screenWidth < 1168 ? 2 : 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildContainer(
              svgPath: Vector.userGroup,
              title: Strings.totalCandidates,
              contentText: '1.2M',
            ),
            _buildContainer(
              svgPath: Vector.briefcaseSmall,
              title: Strings.totalJob,
              contentText: '400',
            ),
            _buildContainer(
              svgPath: Vector.briefcaseSmall,
              title: Strings.candidateSatisfactionRate,
              contentText: '99%',
            ),
            _buildContainer(
              svgPath: Vector.clock,
              title: Strings.averageOfferAcceptanceRate,
              contentText: '100%',
            ),
            _buildContainer(
              svgPath: Vector.thumbUp,
              title: Strings.fastestHire,
              contentText: '60 minutes',
            ),
            _buildContainer(
              svgPath: Vector.thumbUp,
              title: Strings.fastestHire,
              contentText: '60 minutes',
            ),
          ],
        ),
        spacerVertical(24),
        Container(
          padding: const EdgeInsets.all(24),
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: WEBColors.black.withOpacity(
                0.1,
              )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.yourJobsPosted,
                    style: Types.headerItemTStyle,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      color: WEBColors.white.withOpacity(0.1),
                    ),
                    child: DropdownButton<String>(
                      value: _yearValue,
                      icon: SvgPicture.asset(Vector.chevronDown),
                      elevation: 16,
                      dropdownColor: WEBColors.darkGray,
                      style: Types.headerItemTStyle,
                      onChanged: (String? value) {
                        setState(() {
                          _yearValue = value!;
                        });
                      },
                      underline: const SizedBox.shrink(),
                      items:
                          _years.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              spacerVertical(42),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  _monthStatistic.length,
                  (index) {
                    return MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          _listColumnColors[index] = WEBColors.cyan;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          _listColumnColors[index] =
                              WEBColors.cyan.withOpacity(0.33);
                        });
                      },
                      child: _buildStatiscicContainer(
                        _monthStatistic[index],
                        isHover: _listColumnColors[index] == WEBColors.cyan,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContainer({
    required String svgPath,
    required String title,
    required String contentText,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: WEBColors.black.withOpacity(0.1),
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
              ),
              spacerHorizontal(6),
              Text(
                title,
                style: Types.buttonH4TStyle.apply(),
              ),
            ],
          ),
          spacerVertical(8),
          Text(
            contentText,
            style: Types.whiteBottonTStyle.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          spacerVertical(32),
        ],
      ),
    );
  }

  Widget _buildStatiscicContainer(MonthStatisticModel model,
      {bool isHover = false}) {
    return Column(
      children: [
        Text(
          model.counter.toString(),
          style: isHover
              ? Types.headerBoldButtonTStyle
              : Types.headerItemTStyle.copyWith(
                  color: WEBColors.white.withOpacity(
                    0.66,
                  ),
                ),
        ),
        spacerVertical(12),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 24,
              height: 260,
              decoration: BoxDecoration(
                color: WEBColors.fontWhite.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: 24,
              height: (260 * model.counter / 100 >= 260)
                  ? 260
                  : 260 * model.counter / 100,
              decoration: BoxDecoration(
                color:
                    isHover ? WEBColors.cyan : WEBColors.cyan.withOpacity(0.33),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
        spacerVertical(12),
        Text(
          model.month,
          style: isHover
              ? Types.headerBoldButtonTStyle
              : Types.headerItemTStyle.copyWith(
                  color: WEBColors.white.withOpacity(
                    0.66,
                  ),
                ),
        )
      ],
    );
  }
}
