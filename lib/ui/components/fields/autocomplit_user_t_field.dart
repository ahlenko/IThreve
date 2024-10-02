import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/domain/model/team_members.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/components/text/autocomplete_user_item.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class AutocomplitUserTField extends StatefulWidget {
  final String? hintText;
  final void Function(TeamMembers)? onSubmitted;
  final Widget? prefix;
  final String? errorText;
  final bool clearSubmittedText;
  final TextEditingController controller;
  final double fontSize;
  final String? title;
  final String icon;
  final bool confirmed;
  final List<TeamMembers>? autocompleteData;
  final void Function(String)? onNeedMoreData;
  final void Function(String)? onChanged;

  const AutocomplitUserTField(
      {super.key,
      this.onSubmitted,
      this.errorText,
      required this.controller,
      this.hintText,
      required this.icon,
      this.prefix,
      this.title,
      this.fontSize = 32,
      required this.confirmed,
      this.clearSubmittedText = true,
      this.autocompleteData,
      this.onNeedMoreData,
      this.onChanged});

  @override
  State<AutocomplitUserTField> createState() => _AutocomplitUserTFieldState();
}

class _AutocomplitUserTFieldState extends State<AutocomplitUserTField> {
  List<TeamMembers> _options = [];

  List<TeamMembers> filteredOptions = [];

  final FocusNode _focusNode = FocusNode(canRequestFocus: true);

  @override
  void initState() {
    super.initState();
    if (widget.autocompleteData != null) {
      _options = widget.autocompleteData!;
    }
    widget.controller.addListener(_filterOptions);
  }

  void _filterOptions() {
    setState(() {
      filteredOptions = _options
          .where((option) => option.name
              .toLowerCase()
              .startsWith(widget.controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(widget.title!, style: Types.textFieldTitleTStyle),
          Stack(
            children: [
              TextFormField(
                onChanged: (value) {
                  widget.onChanged!(value);
                },
                focusNode: _focusNode,
                cursorColor: WEBColors.cyan,
                controller: widget.controller,
                decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: SvgPicture.asset(widget.icon),
                    ),
                    suffixIcon: widget.confirmed
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8, left: 8),
                            child: SvgPicture.asset(Vector.checkCircle),
                          )
                        : null,
                    hintStyle: Types.textFieldTStyle
                        .copyWith(fontSize: widget.fontSize)),
                style: Types.textFieldTStyle.copyWith(
                    color: WEBColors.white, fontSize: widget.fontSize),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: horizontalLine(0.5, WEBColors.white.withOpacity(0.66)),
              ),
            ],
          ),
          spacerVertical(4),
          if (filteredOptions.isNotEmpty &&
              _focusNode.hasFocus &&
              widget.controller.text.isNotEmpty)
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  for (var i = 0; i < filteredOptions.length; i++)
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: AutocompleteUserItem(
                        isLast: i == filteredOptions.length - 1,
                        isFirst: i == 0,
                        text: filteredOptions[i].name,
                        addText: filteredOptions[i].role,
                        onTap: () {
                          if (widget.onSubmitted != null) {
                            widget.onSubmitted!(filteredOptions[i]);
                          }
                          if (widget.clearSubmittedText) {
                            widget.controller.clear();
                          } else {
                            widget.controller.text = filteredOptions[i].name;
                          }
                          _focusNode.unfocus();
                        },
                      ),
                    )
                ],
              ),
            ),
          spacerVertical(4),
          Row(
            children: [
              if (widget.errorText != null)
                const Icon(
                  Icons.info_outline_rounded,
                  color: WEBColors.erroeRed,
                  size: 18,
                ),
              spacerHorizontal(4),
              Text(widget.errorText ?? '', style: Types.errorTStyle),
            ],
          )
        ],
      ),
    );
  }
}
