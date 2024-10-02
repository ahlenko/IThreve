import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/components/text/autocomplete_item.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class AutocomplitTextTField extends StatefulWidget {
  final String? hintText;
  final void Function(String)? onSubmitted;
  final Widget? prefix;
  final String? errorText;
  final bool clearSubmittedText;
  final double fontSize;
  final double autocompleteSize;
  final bool transparentBackground;

  final List<String>? autocompleteData;
  final void Function(String)? onNeedMoreData;
  final void Function(String)? onChanged;

  const AutocomplitTextTField(
      {super.key,
      this.onSubmitted,
      this.errorText,
      this.hintText,
      this.prefix,
      this.fontSize = 32,
      this.autocompleteSize = 20,
      this.transparentBackground = true,
      this.clearSubmittedText = true,
      this.autocompleteData,
      this.onNeedMoreData,
      this.onChanged});

  @override
  State<AutocomplitTextTField> createState() => _AutocomplitTextTFieldState();
}

class _AutocomplitTextTFieldState extends State<AutocomplitTextTField> {
  List<String> _options = [
    'www.apple.com',
    'www.applevision.com',
    'www.futureapple.io'
  ];

  List<String> filteredOptions = [];

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.autocompleteData != null) {
      _options = widget.autocompleteData!;
    }
    _controller.addListener(_filterOptions);
  }

  void _filterOptions() {
    setState(() {
      filteredOptions = _options
          .where((option) =>
              option.toLowerCase().contains(_controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              widget.transparentBackground
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: horizontalLine(1, WEBColors.white),
                    )
                  : Positioned.fill(
                      child: Container(
                      decoration: BoxDecoration(
                          color: WEBColors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                    )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.transparentBackground ? 0 : 12),
                child: TextFormField(
                  onChanged: (value) => {widget.onChanged!(value)},
                  focusNode: _focusNode,
                  onFieldSubmitted: (value) =>
                      {_controller.text = '', widget.onSubmitted!(value)},
                  cursorColor: WEBColors.cyan,
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      hintStyle: Types.textFieldTStyle
                          .copyWith(fontSize: widget.fontSize)),
                  style: Types.textFieldTStyle.copyWith(
                      color: WEBColors.white, fontSize: widget.fontSize),
                ),
              ),
            ],
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
              if (widget.errorText != null)
                Text(widget.errorText ?? '', style: Types.errorTStyle),
            ],
          ),
          if (filteredOptions.isNotEmpty &&
              _focusNode.hasFocus &&
              _controller.text.isNotEmpty)
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  for (String item in filteredOptions)
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: AutocompleteItem(
                        text: item,
                        fontSize: widget.autocompleteSize,
                        searchValue: _controller.text,
                        onTap: () {
                          if (widget.onSubmitted != null) {
                            widget.onSubmitted!(item);
                          }
                          if (widget.clearSubmittedText) {
                            _controller.clear();
                          } else {
                            _controller.text = item;
                          }
                          _focusNode.unfocus();
                        },
                      ),
                    )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
