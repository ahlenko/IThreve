import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class EmailLoginTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? errorText;
  final String? hintText;
  final bool withSpace;
  const EmailLoginTextField({
    super.key,
    required this.title,
    this.errorText,
    this.hintText,
    this.withSpace = true,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() {
    return _EmailLoginTextFieldState();
  }
}

class _EmailLoginTextFieldState extends State<EmailLoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title,
                style: Types.buttonH4TStyle
                    .copyWith(color: WEBColors.white.withOpacity(0.66))),
          ],
        ),
        spacerVertical(8),
        Stack(
          children: [
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                  color: WEBColors.fieldGray.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10)),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                onChanged: (value) {},
                controller: widget.controller,
                decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    hintStyle: Types.textFieldTStyle),
                style: Types.textFieldTStyle.copyWith(color: WEBColors.white),
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
            if (widget.errorText != null || widget.withSpace)
              Text(widget.errorText ?? '', style: Types.errorTStyle),
          ],
        )
      ],
    );
  }
}
