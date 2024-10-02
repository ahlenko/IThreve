import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class IconDropDownField extends StatefulWidget {
  final String icon;
  final String title;
  final int selected;
  final List<String>? items;
  final String? value;
  final Function(String)? onSelected;
  const IconDropDownField(
      {super.key,
      required this.icon,
      required this.title,
      this.items,
      this.selected = 0,
      this.onSelected,
      this.value});

  @override
  State<IconDropDownField> createState() => _IconDropDownFieldState();
}

class _IconDropDownFieldState extends State<IconDropDownField> {
  bool selection = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: Types.buttonH4TStyle
              .copyWith(color: WEBColors.white.withOpacity(0.66)),
        ),
        spacerVertical(4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              widget.icon,
              width: 16,
              height: 16,
            ),
            spacerHorizontal(5),
            if (widget.items == null)
              Text(
                widget.value ?? '',
                style: Types.buttonH4TStyle,
              )
            else
              Container(
                decoration: BoxDecoration(
                  color: WEBColors.white.withOpacity(0.1),
                  border: Border(
                      bottom: BorderSide(
                          width: 0.5,
                          color: selection
                              ? WEBColors.white.withOpacity(0.66)
                              : Colors.transparent)),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(selection ? 0 : 8),
                      top: const Radius.circular(8)),
                ),
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.items![widget.selected],
                      style: Types.buttonH4TStyle,
                    ),
                    spacerHorizontal(2),
                    PopupMenuButton<String>(
                      onCanceled: () => setState(() {
                        selection = false;
                      }),
                      onOpened: () => setState(() {
                        selection = true;
                      }),
                      onSelected: (value) => setState(
                        () {
                          selection = false;
                          widget.onSelected!(value);
                        },
                      ),
                      elevation: 0,
                      constraints: const BoxConstraints.tightForFinite(),
                      color: WEBColors.white.withOpacity(0.1),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(8)),
                      ),
                      icon: SvgPicture.asset(Vector.arrowDown),
                      position: PopupMenuPosition.under,
                      offset: const Offset(0, 8),
                      itemBuilder: (context) {
                        return [
                          for (var i = 0; i < (widget.items ?? []).length; i++)
                            if (widget.selected != i)
                              PopupMenuItem<String>(
                                onTap: () => {
                                  setState(() {
                                    selection = false;
                                  })
                                },
                                height: 10,
                                padding: const EdgeInsets.all(0),
                                value: (widget.items ?? [])[i],
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 10),
                                  child: Text(
                                    (widget.items ?? [])[i],
                                    style: Types.buttonH4TStyle,
                                  ),
                                ),
                              ),
                        ];
                      },
                    ),
                  ],
                ),
              )
          ],
        )
      ],
    );
  }
}
