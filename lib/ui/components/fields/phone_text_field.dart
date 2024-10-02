import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class PhoneNumberField extends StatefulWidget {
  final void Function(PhoneNumber, bool)? onInputChanged;
  final String initValue;
  final String title;
  final String? hintText;
  final String? errorText;

  const PhoneNumberField(
      {super.key,
      this.onInputChanged,
      required this.title,
      required this.initValue,
      this.hintText,
      this.errorText});

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  final TextEditingController _phoneController = TextEditingController();
  PhoneNumber _initialPhoneNumber =
      PhoneNumber(isoCode: Get.deviceLocale?.countryCode ?? "US");
  bool _validInput = false;

  @override
  void initState() {
    super.initState();
    _initializePhoneNumber();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _initializePhoneNumber() async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(widget.initValue);
    setState(() {
      _initialPhoneNumber = number;
      _phoneController.text = number.phoneNumber ?? widget.initValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              widget.onInputChanged?.call(number, _validInput);
              setState(() {
                _initialPhoneNumber = number;
              });
            },
            onInputValidated: (valid) => _validInput = valid,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
              showFlags: false,
              useEmoji: false,
              setSelectorButtonAsPrefixIcon: true,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle:
                Types.textFieldTStyle.copyWith(color: WEBColors.white),
            initialValue: _initialPhoneNumber,
            textFieldController: _phoneController,
            textStyle: Types.textFieldTStyle.copyWith(color: WEBColors.white),
            formatInput: true,
            keyboardType: TextInputType.phone,
            inputDecoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: Types.textFieldTStyle),
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
          Text(widget.errorText ?? '', style: Types.errorTStyle),
        ],
      )
    ]);
  }
}
