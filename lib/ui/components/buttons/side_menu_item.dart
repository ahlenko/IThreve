import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/domain/model/selected_dashboard_item.dart';

import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class SideMenuItem extends StatefulWidget {
  final SelectedDashboardItem item;
  final bool isLogOut;
  final bool isExpanded;
  final void Function() onTap;
  final bool isSelected;

  const SideMenuItem({
    super.key,
    required this.isExpanded,
    required this.item,
    required this.onTap,
    required this.isSelected,
    this.isLogOut = false,
  });

  @override
  State<SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          hovered = value;
        });
      },
      onTap: () {
        if (widget.item.pageType != null) {
          widget.onTap();
        }
      },
      child: Container(
        height: 49,
        padding: EdgeInsets.only(left: !widget.isLogOut ? 16 : 0),
        decoration: BoxDecoration(
            color:
                hovered ? WEBColors.cyan.withOpacity(0.1) : Colors.transparent),
        child: Row(
          mainAxisAlignment: widget.isLogOut || !widget.isExpanded
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(children: [
                  SvgPicture.asset(
                    widget.isSelected
                        ? widget.item.iconChecked
                        : widget.item.icon,
                    color: widget.isSelected ? WEBColors.cyan : null,
                  ),
                  Offstage(
                    offstage: widget.isExpanded || widget.item.messages == 0,
                    child: Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: WEBColors.erroeRed,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ]),
                spacerHorizontal(widget.isExpanded ? 8 : 0),
                Offstage(
                  offstage: !widget.isExpanded,
                  child: Text(widget.item.title,
                      style: widget.isSelected
                          ? Types.buttonBoltH4TStyle
                              .copyWith(color: WEBColors.cyan)
                          : Types.buttonH4TStyle.copyWith(
                              color: widget.isLogOut
                                  ? WEBColors.white
                                  : WEBColors.whiteGray.withOpacity(0.6))),
                ),
              ],
            ),
            Row(
              children: [
                Offstage(
                  offstage: widget.item.messages == 0 || !widget.isExpanded,
                  child: Container(
                    decoration: BoxDecoration(
                        color: WEBColors.cyan.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(8),
                    child: Text(widget.item.messages.toString(),
                        style: widget.isSelected
                            ? Types.buttonBoltH4TStyle
                                .copyWith(color: WEBColors.cyan)
                            : Types.buttonH4TStyle.copyWith(
                                color: WEBColors.whiteGray.withOpacity(0.6))),
                  ),
                ),
                spacerHorizontal(!widget.isLogOut ? 16 : 0),
                if (widget.isSelected)
                  Container(
                    height: 39,
                    width: 4,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    color: widget.isSelected && widget.isExpanded
                        ? WEBColors.cyan
                        : Colors.transparent,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
