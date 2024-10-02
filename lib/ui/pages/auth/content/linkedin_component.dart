import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
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

class LinkedinComponent extends StatelessWidget {
  final Function(String redirectType) onRedirect;
  final Function() onConfirmlinkedIn;
  final bool isLogin;
  const LinkedinComponent(
      {super.key,
      required this.onRedirect,
      required this.isLogin,
      required this.onConfirmlinkedIn});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380, minWidth: 380),
      child: Column(
        children: [
          Text(
            Strings.signIntoLinkedInToContinue,
            style:
                Types.headerLogoTStyle.copyWith(fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          spacerVertical(48),
          EmailLoginTextField(
            title: Strings.userNameOrEmailAddress,
            controller: TextEditingController(),
          ),
          spacerVertical(16),
          PasswordTextField(
            title: Strings.password,
            controller: TextEditingController(),
            passwordValidationCallback: (p0) {},
          ),
          spacerVertical(24),
          SizedBox(
            width: double.infinity,
            height: 65,
            child: RoundedBackgroundButton(
              onClick: () => onConfirmlinkedIn(),
              backgroundColor: WEBColors.darkGreen,
              text: Strings.continueWithLinkedIn,
            ),
          ),
          spacerVertical(24),
          orHorizontalLine(),
          spacerVertical(24),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: RoundedIconButton(
              onClick: () => onRedirect(AuthTypes.phone),
              iconPath: Vector.linkedidLogo,
              text:
                  isLogin ? Strings.signInWithPhone : Strings.continueWithPhone,
            ),
          ),
          spacerVertical(16),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: RoundedIconButton(
              onClick: () => onRedirect(AuthTypes.email),
              iconPath: Vector.linkedidLogo,
              text:
                  isLogin ? Strings.signInWithEmail : Strings.continueWithEmail,
            ),
          ),
        ],
      ),
    );
  }
}
