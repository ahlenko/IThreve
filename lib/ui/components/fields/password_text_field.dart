import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;
  final String? hintText;
  final String title;
  final void Function(bool)? passwordValidationCallback;
  final bool withSpace;
  const PasswordTextField({
    super.key,
    this.errorText,
    this.hintText,
    required this.title,
    this.withSpace = true,
    required this.controller,
    this.passwordValidationCallback,
  });

  @override
  State<StatefulWidget> createState() {
    return _PasswordTextFieldState();
  }
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;
  bool _isPasswordStrong = false;

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
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Text(Strings.forgotPassword,
                    style: Types.buttonH4TStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
              ),
            )
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
                onChanged: (value) {
                  setState(() {
                    _validatePassword(value);
                  });
                },
                controller: widget.controller,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Positioned(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        spacerHorizontal(16),
                        GestureDetector(
                          onTap: () => {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            })
                          },
                          child: _isPasswordVisible
                              ? SvgPicture.asset(
                                  Vector.passEyeOn,
                                )
                              : SvgPicture.asset(
                                  Vector.passEyeOff,
                                ),
                        ),
                      ],
                    )),
                    hintText: widget.hintText,
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

  void _validatePassword(String value) {
    _isPasswordStrong = _checkPasswordStrong(value);
    if (widget.passwordValidationCallback != null) {
      widget.passwordValidationCallback!(_isPasswordStrong);
    }
  }

  bool _checkPasswordLength(String password) {
    return password.length >= 8 && password.length <= 20;
  }

  bool _checkPasswordContainNumberSpecialCharacterLetter(String password) {
    return RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!.,@#?\$&*~])')
        .hasMatch(password);
  }

  bool _checkPasswordStrong(String password) {
    return _checkPasswordLength(password) &&
        _checkPasswordContainNumberSpecialCharacterLetter(password) &&
        !password.contains('qwerty') &&
        !password.contains('password') &&
        !password.contains('123456');
  }
}
