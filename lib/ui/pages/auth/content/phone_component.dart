import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/policy_link_text.dart';
import 'package:ithreve_web/ui/components/buttons/rounded_background_button.dart';
import 'package:ithreve_web/ui/components/buttons/rounded_icon_button.dart';
import 'package:ithreve_web/ui/components/fields/phone_text_field.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/pages/auth/content/auth_content_types.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class PhoneComponent extends StatefulWidget {
  final Function(String redirectType) onRedirect;
  final Function() onConfirmPhone;
  final bool isLogin;
  const PhoneComponent(
      {super.key,
      required this.onRedirect,
      required this.isLogin,
      required this.onConfirmPhone});

  @override
  State<PhoneComponent> createState() => _PhoneComponentState();
}

class _PhoneComponentState extends State<PhoneComponent> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380, minWidth: 380),
      child: Column(
        children: [
          Text(
            widget.isLogin
                ? Strings.signInUsingYourPhone
                : Strings.signUpUsingYourPhone,
            style:
                Types.headerLogoTStyle.copyWith(fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          spacerVertical(32),
          PhoneNumberField(
            title: Strings.phone,
            hintText: Strings.enterYourNumber,
            initValue: '',
          ),
          spacerVertical(4),
          SizedBox(
            width: double.infinity,
            height: 65,
            child: RoundedBackgroundButton(
              onClick: () => widget.onConfirmPhone(),
              backgroundColor: WEBColors.darkGreen,
              text: widget.isLogin ? Strings.next : Strings.agreeAndJoin,
            ),
          ),
          if (!widget.isLogin) spacerVertical(24),
          if (!widget.isLogin) const PolicyLinkText(),
          spacerVertical(24),
          orHorizontalLine(),
          spacerVertical(24),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: RoundedIconButton(
              onClick: () => widget.onRedirect(AuthTypes.email),
              iconPath: Vector.linkedidLogo,
              text: widget.isLogin
                  ? Strings.signInWithEmail
                  : Strings.continueWithEmail,
            ),
          ),
          spacerVertical(16),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: RoundedIconButton(
              onClick: () => widget.onRedirect(AuthTypes.linkedid),
              iconPath: Vector.linkedidLogo,
              text: widget.isLogin
                  ? Strings.signInWithLinkedIn
                  : Strings.continueWithLinkedIn,
            ),
          ),
          spacerVertical(40),
          alreadyDontHaveAccount(
              widget.isLogin,
              () => widget.onRedirect(
                  widget.isLogin ? AuthTypes.signUp : AuthTypes.logIn))
        ],
      ),
    );
  }
}
