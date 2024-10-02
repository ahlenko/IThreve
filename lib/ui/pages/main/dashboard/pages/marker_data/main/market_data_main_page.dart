import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/ui/components/buttons/rounded_icon_button.dart';
import 'package:ithreve_web/ui/components/web/headers/dashboard_header.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/main/market_data_main_page_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/main/market_data_main_page_state.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/main/widgets/gain_access_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/main/widgets/know_comment_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/market_competitiveness/market_competitiveness.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/market_data_job_offer/job_offer_competitiveness.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/your_company_data/your_company_data.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class MarketDataMainPage extends StatefulWidget {
  const MarketDataMainPage({super.key});

  @override
  State<MarketDataMainPage> createState() => _MarketDataMainPageState();
}

class _MarketDataMainPageState extends State<MarketDataMainPage> {
  final MarketDataMainPageCubit cubit = getIt.get<MarketDataMainPageCubit>();

  bool _isDialogOpen = false;
  int _selectedIndex = 0;
  static const defaultRadius = Radius.circular(8);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (callback) {
        setState(() {
          _isDialogOpen = true;
        });
        showDialog(
          context: context,
          builder: (context) => GainAccessDialog(
            onClosed: () {
              setState(() {
                _isDialogOpen = false;
              });
            },
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: _isDialogOpen ? 10 : 0,
        sigmaY: _isDialogOpen ? 10 : 0,
      ),
      child: BlocBuilder<MarketDataMainPageCubit, MarketDataMainPageState>(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            children: [
              DashboardHeader(
                headerTitle: Strings.marketData,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildTapBarItem(
                      index: 0,
                      title: Strings.yourCompanyData,
                    ),
                    _buildTapBarItem(
                      index: 1,
                      title: Strings.marketCompetitiveness,
                    ),
                    _buildTapBarItem(
                      index: 2,
                      title: Strings.jobOfferCompetitiveness,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  decoration: BoxDecoration(
                    color: WEBColors.drawerColor,
                    borderRadius: BorderRadius.only(
                      topRight: defaultRadius,
                      bottomLeft: defaultRadius,
                      bottomRight: defaultRadius,
                      topLeft:
                          _selectedIndex == 1 ? defaultRadius : Radius.zero,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (_selectedIndex != 0) ...[
                                SvgPicture.asset(Vector.exclamationCircle),
                                spacerHorizontal(16),
                              ],
                              SizedBox(
                                height: 35,
                                child: RoundedIconButton(
                                  onClick: () {
                                    setState(() {
                                      _isDialogOpen = true;
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (context) => KnowCommentDialog(
                                        onClosed: () {
                                          setState(() {
                                            _isDialogOpen = false;
                                          });
                                        },
                                      ),
                                    );
                                  },
                                  text: Strings.add,
                                  iconPath: Vector.plusCircle,
                                  borderColor: Colors.transparent,
                                  borderRadius: 20,
                                  backgroundColor:
                                      WEBColors.white.withOpacity(0.1),
                                ),
                              ),
                            ],
                          ),
                          spacerVertical(16),
                          _selectedIndex == 0
                              ? const YourCompanyData()
                              : _selectedIndex == 1
                                  ? const MarketCompetitiveness()
                                  : const JobOfferCompetitiveness(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              spacerVertical(32),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTapBarItem({
    required int index,
    required String title,
  }) {
    return InkWell(
      borderRadius: const BorderRadius.only(
        topLeft: defaultRadius,
        topRight: defaultRadius,
      ),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: defaultRadius,
            topRight: defaultRadius,
          ),
          color: _selectedIndex == index
              ? WEBColors.drawerColor
              : Colors.transparent,
        ),
        child: Text(
          title,
          style: Types.headerItemTStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
