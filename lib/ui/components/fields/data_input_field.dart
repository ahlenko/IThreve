import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class DataInputField extends StatefulWidget {
  final String? errorType;
  final String? error;
  final Function(int, int, int) onInputChange;
  final Function() onNeedChecking;
  const DataInputField(
      {super.key,
      required this.onInputChange,
      required this.onNeedChecking,
      this.error,
      this.errorType});

  @override
  State<DataInputField> createState() => _DataInputFieldState();
}

class _DataInputFieldState extends State<DataInputField> {
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  FocusNode dayFucus = FocusNode();
  FocusNode monthFucus = FocusNode();
  FocusNode yearFucus = FocusNode();

  @override
  void initState() {
    dayController.addListener(_onDayCtrl);
    monthController.addListener(_onMonthCtrl);
    yearController.addListener(_onYearCtrl);
    super.initState();
  }

  int parseOrZero(String value) {
    return int.tryParse(value) ?? 0;
  }

  void _onMonthCtrl() {
    widget.onInputChange(
      parseOrZero(monthController.text),
      parseOrZero(dayController.text),
      parseOrZero(yearController.text),
    );
    setState(() {
      if (monthFucus.hasFocus && monthController.text.length >= 2) {
        monthFucus.unfocus();
        dayFucus.requestFocus();
      }
    });
  }

  void _onDayCtrl() {
    widget.onInputChange(
      parseOrZero(monthController.text),
      parseOrZero(dayController.text),
      parseOrZero(yearController.text),
    );
    setState(() {
      if (dayFucus.hasFocus && dayController.text.length >= 2) {
        dayFucus.unfocus();
        yearFucus.requestFocus();
      } else if (dayController.text.isEmpty) {
        dayFucus.unfocus();
        monthFucus.requestFocus();
      }
    });
  }

  void _onYearCtrl() {
    widget.onInputChange(
      parseOrZero(monthController.text),
      parseOrZero(dayController.text),
      parseOrZero(yearController.text),
    );

    setState(() {
      if (yearFucus.hasFocus && yearController.text.length >= 4) {
        yearFucus.unfocus();
        widget.onNeedChecking();
      } else if (yearController.text.isEmpty) {
        yearFucus.unfocus();
        dayFucus.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    dayController.removeListener(_onDayCtrl);
    monthController.removeListener(_onMonthCtrl);
    yearController.removeListener(_onYearCtrl);
    dayFucus.dispose();
    monthFucus.dispose();
    yearFucus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Strings.month, style: Types.buttonH4TStyle),
                Stack(children: [
                  IntrinsicWidth(
                    child: TextFormField(
                      focusNode: monthFucus,
                      controller: monthController,
                      cursorColor: WEBColors.cyan,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: InputDecoration(
                          hintText: 'MM',
                          border: InputBorder.none,
                          hintStyle:
                              Types.textFieldTStyle.copyWith(fontSize: 32)),
                      style: Types.textFieldTStyle
                          .copyWith(color: WEBColors.white, fontSize: 32),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: horizontalLine(
                        1,
                        widget.errorType == 'm' || widget.errorType == 'a'
                            ? WEBColors.erroeRed.withOpacity(0.66)
                            : monthFucus.hasFocus
                                ? WEBColors.cyan.withOpacity(0.66)
                                : WEBColors.white.withOpacity(0.66)),
                  ),
                ])
              ],
            ),
            spacerHorizontal(40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Strings.day, style: Types.buttonH4TStyle),
                Stack(children: [
                  IntrinsicWidth(
                    child: TextFormField(
                      focusNode: dayFucus,
                      controller: dayController,
                      cursorColor: WEBColors.cyan,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: InputDecoration(
                          hintText: 'DD',
                          border: InputBorder.none,
                          hintStyle:
                              Types.textFieldTStyle.copyWith(fontSize: 32)),
                      style: Types.textFieldTStyle
                          .copyWith(color: WEBColors.white, fontSize: 32),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: horizontalLine(
                        1,
                        widget.errorType == 'd' || widget.errorType == 'a'
                            ? WEBColors.erroeRed.withOpacity(0.66)
                            : dayFucus.hasFocus
                                ? WEBColors.cyan.withOpacity(0.66)
                                : WEBColors.white.withOpacity(0.66)),
                  ),
                ])
              ],
            ),
            spacerHorizontal(40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Strings.year, style: Types.buttonH4TStyle),
                Stack(children: [
                  IntrinsicWidth(
                    child: TextFormField(
                      focusNode: yearFucus,
                      cursorColor: WEBColors.cyan,
                      controller: yearController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      decoration: InputDecoration(
                          hintText: 'YYYY',
                          border: InputBorder.none,
                          hintStyle:
                              Types.textFieldTStyle.copyWith(fontSize: 32)),
                      style: Types.textFieldTStyle
                          .copyWith(color: WEBColors.white, fontSize: 32),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: horizontalLine(
                        1,
                        widget.errorType == 'y' || widget.errorType == 'a'
                            ? WEBColors.erroeRed.withOpacity(0.66)
                            : yearFucus.hasFocus
                                ? WEBColors.cyan.withOpacity(0.66)
                                : WEBColors.white.withOpacity(0.66)),
                  ),
                ])
              ],
            )
          ],
        ),
        spacerVertical(4),
        Row(
          children: [
            if (widget.error != null)
              const Icon(
                Icons.info_outline_rounded,
                color: WEBColors.erroeRed,
                size: 18,
              ),
            spacerHorizontal(4),
            if (widget.error != null)
              Text(widget.error ?? '', style: Types.errorTStyle),
          ],
        )
      ],
    );
  }
}
