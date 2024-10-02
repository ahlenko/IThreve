import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/fields/icon_multiline_text_field.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class RoleInfoStep extends StatefulWidget {
  final Function() onNeedNextPage;
  final Function() onNeedPrewPage;
  final bool withAi;
  const RoleInfoStep(
      {super.key,
      required this.onNeedNextPage,
      required this.onNeedPrewPage,
      required this.withAi});

  @override
  State<RoleInfoStep> createState() => _RoleInfoStepState();
}

class _RoleInfoStepState extends State<RoleInfoStep> {
  TextEditingController locationCtrl = TextEditingController();
  TextEditingController typeCtrl = TextEditingController();
  TextEditingController officeRequireCtrl = TextEditingController();
  TextEditingController salaryCtrl = TextEditingController();
  TextEditingController sponsorshipCtrl = TextEditingController();
  TextEditingController benefitsCtrl = TextEditingController();
  String? locationError,
      typeError,
      officeRequireError,
      salaryError,
      sponsorshipError,
      benefitsError;

  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    locationCtrl.addListener(_onLocationCtrl);
    typeCtrl.addListener(_onTypeCtrl);
    officeRequireCtrl.addListener(_onOfficeRequireCtrl);
    salaryCtrl.addListener(_onSalaryCtrl);
    sponsorshipCtrl.addListener(_onSponsorshipCtrl);
    benefitsCtrl.addListener(_onBenefitsCtrl);
  }

  bool _checkFildsError() {
    bool ishasError = false;
    if (locationCtrl.text.isEmpty) {
      locationError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (typeCtrl.text.isEmpty) {
      typeError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (officeRequireCtrl.text.isEmpty) {
      officeRequireError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (salaryCtrl.text.isEmpty) {
      salaryError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (sponsorshipCtrl.text.isEmpty) {
      sponsorshipError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (benefitsCtrl.text.isEmpty) {
      benefitsError = Strings.mustBeFilled;
      ishasError = true;
    }
    return !ishasError;
  }

  void _onLocationCtrl() {
    setState(() {
      locationError = null;
    });
  }

  void _onTypeCtrl() {
    setState(() {
      typeError = null;
    });
  }

  void _onOfficeRequireCtrl() {
    setState(() {
      officeRequireError = null;
    });
  }

  void _onSalaryCtrl() {
    setState(() {
      salaryError = null;
    });
  }

  void _onSponsorshipCtrl() {
    setState(() {
      sponsorshipError = null;
    });
  }

  void _onBenefitsCtrl() {
    setState(() {
      benefitsError = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    locationCtrl.removeListener(_onLocationCtrl);
    typeCtrl.removeListener(_onTypeCtrl);
    officeRequireCtrl.removeListener(_onOfficeRequireCtrl);
    salaryCtrl.removeListener(_onSalaryCtrl);
    sponsorshipCtrl.removeListener(_onSponsorshipCtrl);
    benefitsCtrl.removeListener(_onBenefitsCtrl);
  }

  @override
  Widget build(BuildContext context) {
    var width = screenWidth(context);

    return RawKeyboardListener(
        focusNode: _focusNode,
        onKey: (event) => {
              setState(() {}),
              if (event.isKeyPressed(LogicalKeyboardKey.enter))
                if (_checkFildsError()) {widget.onNeedNextPage()}
            },
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RegularBoltRegularText(
                firstText:
                    widget.withAi ? Strings.doThese : Strings.letSFillInWhat,
                secondText: widget.withAi
                    ? ' ${Strings.informationForTheRole} '
                    : ' ${Strings.thisRoleOffers}',
                thirdText: widget.withAi ? Strings.seemRight : null,
              ),
              Offstage(
                offstage: !widget.withAi,
                child: Column(
                  children: [
                    spacerVertical(12),
                    Text(
                      Strings.automaticallyFilledInFromInformation,
                      style: Types.grayRegular24TStyle,
                    ),
                  ],
                ),
              ),
              spacerVertical(12),
              Text(
                Strings.weLlBeAbleToGuideYouBetter,
                style: Types.grayRegular24TStyle,
              ),
              spacerVertical(65),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 240,
                children: [
                  SizedBox(
                    width: width >= 1160 ? 380 : null,
                    child: IconMultilineTextField(
                      fontSize: 24,
                      icon: Vector.location,
                      title: Strings.location,
                      controller: locationCtrl,
                      errorText: locationError,
                    ),
                  ),
                  if (width < 1160) spacerVertical(55),
                  SizedBox(
                    width: width >= 1160 ? 380 : null,
                    child: IconMultilineTextField(
                      fontSize: 24,
                      icon: Vector.briefcase,
                      title: Strings.type,
                      controller: typeCtrl,
                      errorText: typeError,
                    ),
                  )
                ],
              ),
              spacerVertical(55),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 240,
                children: [
                  SizedBox(
                    width: width >= 1160 ? 380 : null,
                    child: IconMultilineTextField(
                      fontSize: 24,
                      icon: Vector.officeBuilding,
                      title: Strings.officeRequirement,
                      controller: officeRequireCtrl,
                      errorText: officeRequireError,
                    ),
                  ),
                  if (width < 1160) spacerVertical(55),
                  SizedBox(
                    width: width >= 1160 ? 380 : null,
                    child: IconMultilineTextField(
                      fontSize: 24,
                      icon: Vector.currencyDollar,
                      title: Strings.salary,
                      controller: salaryCtrl,
                      errorText: salaryError,
                    ),
                  )
                ],
              ),
              spacerVertical(55),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 240,
                children: [
                  SizedBox(
                    width: width >= 1160 ? 380 : null,
                    child: IconMultilineTextField(
                      fontSize: 24,
                      icon: Vector.identification,
                      title: Strings.visaSponsorship,
                      controller: sponsorshipCtrl,
                      errorText: sponsorshipError,
                    ),
                  ),
                ],
              ),
              spacerVertical(55),
              IconMultilineTextField(
                fontSize: 24,
                icon: Vector.hand,
                title: Strings.benefits,
                controller: benefitsCtrl,
                errorText: benefitsError,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Row(
                  children: [
                    GradientButton(
                        height: 75,
                        horizontalSpacer: 54,
                        gradientSource: Raster.greenGradient,
                        onClick: () => {widget.onNeedNextPage()},
                        text: Strings.next),
                    spacerHorizontal(32),
                    ClickableTextButton(
                        onClick: () => widget.onNeedPrewPage(),
                        text: Strings.back,
                        hoveredStyle: Types.textFieldTitleTStyle
                            .copyWith(color: WEBColors.white),
                        regularStyle: Types.textFieldTitleTStyle)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
