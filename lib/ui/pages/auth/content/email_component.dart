import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/policy_link_text.dart';
import 'package:ithreve_web/ui/components/buttons/rounded_background_button.dart';
import 'package:ithreve_web/ui/components/buttons/rounded_icon_button.dart';
import 'package:ithreve_web/ui/components/fields/email_login_text_field.dart';
import 'package:ithreve_web/ui/components/fields/password_text_field.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/pages/auth/content/auth_content_types.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class EmailComponent extends StatefulWidget {
  final Function(String redirectType) onRedirect;
  final Function() onConfirmEmail;
  final bool isLogin;
  const EmailComponent(
      {super.key,
      required this.onRedirect,
      required this.isLogin,
      required this.onConfirmEmail});

  @override
  State<EmailComponent> createState() => _EmailComponentState();
}

class _EmailComponentState extends State<EmailComponent> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380, minWidth: 380),
      child: Column(
        children: [
          Text(
            widget.isLogin
                ? Strings.signInUsingYourEmail
                : Strings.signUpUsingYourEmail,
            style:
                Types.headerLogoTStyle.copyWith(fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          spacerVertical(32),
          EmailLoginTextField(
            title: Strings.email,
            hintText: Strings.email,
            withSpace: false,
            controller: TextEditingController(),
          ),
          spacerVertical(16),
          PasswordTextField(
            hintText: Strings.password,
            title: Strings.password,
            withSpace: false,
            controller: TextEditingController(),
            passwordValidationCallback: (p0) {},
          ),
          if (!widget.isLogin) spacerVertical(24),
          if (!widget.isLogin) const PolicyLinkText(),
          spacerVertical(24),
          SizedBox(
            width: double.infinity,
            height: 65,
            child: RoundedBackgroundButton(
              onClick: () => widget.onConfirmEmail(),
              backgroundColor: WEBColors.darkGreen,
              text: widget.isLogin ? Strings.signIn : Strings.agreeAndJoin,
            ),
          ),
          spacerVertical(24),
          orHorizontalLine(),
          spacerVertical(24),
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
          spacerVertical(16),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: RoundedIconButton(
              onClick: () => widget.onRedirect(AuthTypes.phone),
              iconPath: Vector.linkedidLogo,
              text: widget.isLogin
                  ? Strings.signInWithPhone
                  : Strings.continueWithPhone,
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
