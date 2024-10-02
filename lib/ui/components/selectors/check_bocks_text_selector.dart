import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class CheckBocksTextSelector extends StatefulWidget {
  final String maintext;
  final String? description;
  final String? suffix;
  final bool selected;
  final double? width;
  final Function(bool) onSelect;
  const CheckBocksTextSelector(
      {super.key,
      required this.selected,
      required this.maintext,
      this.description,
      this.suffix,
      this.width,
      required this.onSelect});

  @override
  State<CheckBocksTextSelector> createState() => _CheckBocksTextSelectorState();
}

class _CheckBocksTextSelectorState extends State<CheckBocksTextSelector> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onSelect(!widget.selected),
        child: Container(
          width: widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: WEBColors.white.withOpacity(hovered ? 0.1 : 0),
          ),
          child: Row(
            children: [
              Checkbox(
                  value: widget.selected,
                  onChanged: (selected) =>
                      {widget.onSelect(selected ?? false)}),
              spacerHorizontal(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.maintext,
                    style: Types.whiteRegular24TStyle.copyWith(fontSize: 24),
                  ),
                  if (widget.description != null)
                    Text(
                      widget.description!,
                      style: Types.textFieldTitleTStyle
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  if (widget.suffix != null)
                    Text(
                      widget.suffix!,
                      style: Types.textFieldTitleTStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
