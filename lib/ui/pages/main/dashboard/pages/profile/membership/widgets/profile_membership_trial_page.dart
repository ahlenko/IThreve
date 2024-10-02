import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class ProfileMembershipTrialPage extends StatelessWidget {
  const ProfileMembershipTrialPage({
    required this.onPop,
    super.key,
  });

  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: onPop,
              child: SvgPicture.asset(
                Vector.arrowBack,
              ),
            ),
            Text(
              Strings.becomeProMember,
              style: Types.headerLogoTStyle,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: SvgPicture.asset(
                Vector.dotsHorizontal,
              ),
            ),
          ],
        ),
        spacerVertical(60),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('\$0.00',
                          style: Types.headerLogoTStyle.copyWith(
                            fontSize: 42,
                          )),
                      spacerHorizontal(10),
                      Text(
                        'due today',
                        style: Types.grayRegular24TStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  spacerVertical(55),
                  _buildMembershipRow('iThrive PRO membership', '\$0.00'),
                  spacerVertical(8),
                  Text(
                    'Billed monthly',
                    style: Types.grayRegular24TStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 22),
                    child: Divider(color: WEBColors.whiteGray),
                  ),
                  _buildMembershipRow('Subtotal', '\$0.00'),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 42,
                      bottom: 22,
                    ),
                    child: Divider(color: WEBColors.whiteGray),
                  ),
                  _buildMembershipRow('Total due today', '\$0.00'),
                ],
              ),
            ),
            spacerHorizontal(40),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: WEBColors.white.withOpacity(
                        0.1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 23,
                              height: 23,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: WEBColors.liteGray),
                            ),
                            spacerHorizontal(8),
                            Text(
                              'Stripe',
                              style: Types.h3TitleTStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 27,
                            bottom: 12,
                          ),
                          child: Divider(color: WEBColors.whiteGray),
                        ),
                        Row(
                          children: [
                            Text(
                              'Email',
                              style: Types.whiteRegular24TStyle,
                            ),
                            const Spacer(),
                            Text(
                              'terauchiayana@gmail.com',
                              style: Types.whiteRegular24TStyle,
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 21,
                          ),
                          child: Divider(
                            color: WEBColors.whiteGray,
                          ),
                        ),
                        _buildPaymentDropdown(),
                        spacerVertical(16),
                      ],
                    ),
                  ),
                  spacerVertical(36),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      Expanded(
                        child: Text(
                          'I agree to Stripe\'s Terms of Service and Privacy Policy.',
                          style: Types.whiteRegular24TStyle,
                        ),
                      ),
                    ],
                  ),
                  spacerVertical(36),
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: WEBColors.darkGreen,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Subscribe',
                          style: Types.whiteRegular24TStyle,
                        ),
                      ),
                    ),
                  ),
                  spacerVertical(
                    21,
                  ),
                  Text(
                    'By confirming your subscription you allow Stripe to charge you for future payments in accordance with their terms. You can always cancel your subscription.',
                    style: Types.whiteRegular24TStyle,
                  ),
                  spacerVertical(28),
                  Text(
                    'Powered by STRIPE | Legal | Contact',
                    style: Types.whiteRegular24TStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMembershipRow(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: Types.grayRegular24TStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          amount,
          style: Types.grayRegular24TStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Pay with',
          style: Types.whiteRegular24TStyle,
        ),
        Container(
          width: 40,
          height: 27,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5,
            ),
            color: WEBColors.liteGray,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'American Express Gold...',
              style: Types.whiteRegular24TStyle,
            ),
            Text(
              '...1008',
              style: Types.whiteRegular24TStyle,
            ),
          ],
        ),
        SvgPicture.asset(
          Vector.chevronDown,
        ),
      ],
    );
  }
}
