import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/ui/components/web/headers/dashboard_header.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/profile/main/profile_main_page_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/profile/main/profile_main_page_state.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/profile/membership/profile_membership.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/profile/membership/widgets/pause_trial_dialog/pause_trial_comment_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/profile/profile_information/profile_information.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class ProfileMainPage extends StatefulWidget {
  const ProfileMainPage({super.key});

  @override
  State<ProfileMainPage> createState() => _ProfileMainPageState();
}

class _ProfileMainPageState extends State<ProfileMainPage> {
  final ProfileMainPageCubit cubit = getIt.get<ProfileMainPageCubit>();
  int _selectedIndex = 0;
  bool _isDialogOpen = false;

  @override
  Widget build(BuildContext context) {
    const defaultRadius = Radius.circular(8);

    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: _isDialogOpen ? 10 : 0,
        sigmaY: _isDialogOpen ? 10 : 0,
      ),
      child: BlocBuilder<ProfileMainPageCubit, ProfileMainPageState>(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            children: [
              DashboardHeader(
                headerTitle: Strings.profile,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(
                          8,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
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
                          color: _selectedIndex == 0
                              ? WEBColors.drawerColor
                              : Colors.transparent,
                        ),
                        child: Text(
                          Strings.companyInformation.capitalizeFirstLetterOfEachWord(),
                          style: Types.headerItemTStyle.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: const BorderRadius.only(
                        topLeft: defaultRadius,
                        topRight: defaultRadius,
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 1;
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
                          color: _selectedIndex == 1
                              ? WEBColors.drawerColor
                              : Colors.transparent,
                        ),
                        child: Text(
                          Strings.membership,
                          style: Types.headerItemTStyle.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                 //width: double.maxFinite,
                
                  margin: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  decoration: BoxDecoration(
                    color: WEBColors.drawerColor,
                    borderRadius: BorderRadius.only(
                      topRight: defaultRadius,
                      bottomLeft: defaultRadius,
                      bottomRight: defaultRadius,
                      topLeft: _selectedIndex == 1 ? defaultRadius : Radius.zero,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: _selectedIndex == 0
                          ? const ProfileInformation()
                          : ProfileMembership(
                              onShowCommentDialog: () {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((callback) {
                                  _emitBlurValue(true);
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const PauseTrialCommentDialog(),
                                  ).then((va) {
                                    _emitBlurValue(false);
                                  });
                                });
                              },
                              onChangeDialog: _emitBlurValue,
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

  void _emitBlurValue(bool value) {
    setState(() {
      _isDialogOpen = value;
    });
  }
}
