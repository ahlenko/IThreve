import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatefulWidget {
  final String error;
  final TextEditingController controller;

  const PinCodeField(
      {super.key, required this.error, required this.controller});

  @override
  State<StatefulWidget> createState() {
    return _PinCodeFieldState();
  }
}

class _PinCodeFieldState extends State<PinCodeField> {
  @override
  Widget build(BuildContext context) {
    final underlineColor = widget.error != ''
        ? WEBColors.erroeRed
        : WEBColors.white.withOpacity(0.66);

    return Column(children: [
      PinCodeTextField(
        length: 6,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            fieldHeight: 50,
            fieldWidth: 50,
            selectedColor: underlineColor,
            selectedFillColor: Colors.transparent,
            disabledColor: underlineColor,
            inactiveFillColor: Colors.transparent,
            inactiveColor: underlineColor,
            activeFillColor: Colors.transparent,
            activeColor: underlineColor),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9\/]')),
        ],
        keyboardType: TextInputType.number,
        enableActiveFill: true,
        controller: widget.controller,
        onCompleted: (v) {},
        onChanged: (value) {},
        appContext: context,
        textStyle:
            Types.headerLogoTStyle.copyWith(fontWeight: FontWeight.normal),
      ),
      if (widget.error != '')
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.error,
            style: Types.errorTStyle,
          ),
        )
    ]);
  }
}
