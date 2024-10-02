import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/components/fields/search_text_field.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class DashboardHeader extends StatefulWidget {
  final bool withBackButton;
  final bool showCoinsCount;
  final String headerTitle;
  final Function()? onBackClick;

  const DashboardHeader(
      {super.key,
      required this.headerTitle,
      this.onBackClick,
      this.withBackButton = false,
      this.showCoinsCount = false});

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MouseRegion(
            cursor: widget.withBackButton
                ? SystemMouseCursors.click
                : MouseCursor.defer,
            child: GestureDetector(
              onTap: () => widget.onBackClick!(),
              child: Row(
                children: [
                  Offstage(
                    offstage: !widget.withBackButton,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(Vector.arrowBack),
                    ),
                  ),
                  Text(
                    widget.headerTitle,
                    style: Types.whiteRegular24TStyle.copyWith(
                        fontSize: widget.withBackButton ? 20 : 24,
                        color:
                            widget.withBackButton ? WEBColors.fontWhite : null),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Offstage(
                offstage: !widget.showCoinsCount,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: WEBColors.white.withOpacity(0.2)),
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset(Vector.coin),
                      spacerHorizontal(4),
                      Text('400',
                          style:
                              Types.whiteRegular24TStyle.copyWith(fontSize: 20))
                    ],
                  ),
                ),
              ),
              Offstage(
                offstage:
                    screenWidth(context) < (widget.showCoinsCount ? 780 : 700),
                child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 315),
                    child:
                        SearchTextField(controller: TextEditingController())),
              ),
              spacerHorizontal(
                  screenWidth(context) < (widget.showCoinsCount ? 760 : 700)
                      ? 0
                      : 16),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Stack(children: [
                    SvgPicture.asset(Vector.bell),
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: WEBColors.erroeRed),
                      ),
                    )
                  ]),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
