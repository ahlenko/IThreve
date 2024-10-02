import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/components/text/autocomplete_item.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class LinkTextField extends StatefulWidget {
  final String? hintText;
  final void Function(String)? onSubmitted;
  final Widget? prefix;
  final String? errorText;
  final bool clearSubmittedText;
  final bool linkSubmitted;
  final double fontSize;
  final void Function(String)? onChanged;

  const LinkTextField(
      {super.key,
      this.onSubmitted,
      this.linkSubmitted = false,
      this.errorText,
      this.hintText,
      this.prefix,
      this.fontSize = 32,
      this.clearSubmittedText = true,
      this.onChanged});

  @override
  State<LinkTextField> createState() => _LinkTextFieldState();
}

class _LinkTextFieldState extends State<LinkTextField> {
  final List<String> _options = [
    'www.apple.com',
    'www.applevision.com',
    'www.futureapple.io'
  ];
  List<String> filteredOptions = [];

  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
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
              Autocomplete<String>(
                optionsViewBuilder:
                    (context, Function(String) onSelected, options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        constraints: const BoxConstraints(
                          maxHeight: 300,
                          maxWidth: 1000,
                        ),
                        color: widget.linkSubmitted
                            ? WEBColors.darkDialogGray.withOpacity(0.5)
                            : Colors.transparent,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: options.map((option) {
                            return AutocompleteItem(
                              text: option,
                              searchValue: _controller.text,
                              onTap: () {
                                if (widget.onSubmitted != null) {
                                  widget.onSubmitted!(option);
                                }
                                if (widget.clearSubmittedText) {
                                  _controller.clear();
                                } else {
                                  _controller.text = option;
                                }
                                _focusNode.unfocus();
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  _controller = textEditingController;
                  _focusNode = focusNode;
                  return TextField(
                    onChanged: widget.onChanged,
                    controller: _controller,
                    focusNode: focusNode,
                    onSubmitted: (p0) {
                      if (widget.onSubmitted != null) {
                        widget.onSubmitted!(p0);
                        if (widget.clearSubmittedText) {
                          textEditingController.clear();
                        }
                      }
                    },
                    style: Types.textFieldTStyle.copyWith(
                        color: WEBColors.white, fontSize: widget.fontSize),
                    cursorColor: WEBColors.cyan,
                    decoration: InputDecoration(
                      hintStyle: Types.textFieldTStyle
                          .copyWith(fontSize: widget.fontSize),
                      hintText: widget.hintText,
                      filled: true,
                      hoverColor: Colors.transparent,
                      fillColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  );
                },
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '' ||
                      textEditingValue.text.length < 2) {
                    return const Iterable<String>.empty();
                  }
                  return _options.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: horizontalLine(1, WEBColors.white),
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
          if (filteredOptions.isNotEmpty && _focusNode.hasFocus)
            Container(
              color: widget.linkSubmitted
                  ? WEBColors.darkDialogGray.withOpacity(0.5)
                  : Colors.transparent,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: filteredOptions.length,
                itemBuilder: (context, index) {
                  final option = filteredOptions[index];
                  return ListTile(
                    title: Text(option),
                    onTap: () {
                      _controller.text = option;
                      _focusNode.unfocus();
                      setState(() {
                        filteredOptions = [];
                      });
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
