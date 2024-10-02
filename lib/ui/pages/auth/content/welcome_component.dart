import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/rounded_icon_button.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/pages/auth/content/auth_content_types.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class WelcomeComponent extends StatelessWidget {
  final Function(String redirectType) onRedirect;
  const WelcomeComponent({super.key, required this.onRedirect});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380, minWidth: 380),
      child: Column(
        children: [
          Text(Strings.welcome, style: Types.headerLogoTStyle),
          spacerVertical(12),
          Text(
            Strings.signUpToIThriveUsingYour,
            style: Types.headerItemTStyle
                .copyWith(color: WEBColors.white.withOpacity(0.65)),
            textAlign: TextAlign.center,
          ),
          spacerVertical(40),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: RoundedIconButton(
              onClick: () => onRedirect(AuthTypes.linkedid),
              iconPath: Vector.linkedidLogo,
              text: Strings.continueWithLinkedIn,
            ),
          ),
          spacerVertical(16),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: RoundedIconButton(
              onClick: () => onRedirect(AuthTypes.phone),
              iconPath: Vector.linkedidLogo,
              text: Strings.continueWithPhoneOrEmail,
            ),
          ),
          spacerVertical(40),
          alreadyDontHaveAccount(false, () => onRedirect(AuthTypes.logIn),
              fromWelcome: true)
        ],
      ),
    );
  }
}
