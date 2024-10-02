import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/rounded_background_button.dart';
import 'package:ithreve_web/ui/components/fields/icon_multiline_text_field.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class CompanyInfoStep extends StatefulWidget {
  final Function() onNeedNextPage;
  final bool withAi;
  const CompanyInfoStep(
      {super.key, required this.onNeedNextPage, required this.withAi});

  @override
  State<CompanyInfoStep> createState() => _CompanyInfoStepState();
}

class _CompanyInfoStepState extends State<CompanyInfoStep> {
  TextEditingController locationCtrl = TextEditingController();
  TextEditingController industryCtrl = TextEditingController();
  TextEditingController employeeCtrl = TextEditingController();
  TextEditingController yearCtrl = TextEditingController();
  TextEditingController productCtrl = TextEditingController();
  TextEditingController coreCtrl = TextEditingController();
  TextEditingController missionCtrl = TextEditingController();
  String? locationError,
      industryError,
      employeeError,
      yearError,
      productError,
      coreError,
      missionError;

  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    locationCtrl.addListener(_onLocationCtrl);
    industryCtrl.addListener(_onIndustryCtrl);
    employeeCtrl.addListener(_onEmployeeCtrl);
    yearCtrl.addListener(_onYearCtrl);
    productCtrl.addListener(_onProductCtrl);
    coreCtrl.addListener(_onCoreCtrl);
    missionCtrl.addListener(_onMissionCtrl);
  }

  bool _checkFildsError() {
    bool ishasError = false;
    if (locationCtrl.text.isEmpty) {
      locationError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (industryCtrl.text.isEmpty) {
      industryError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (employeeCtrl.text.isEmpty) {
      employeeError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (yearCtrl.text.isEmpty) {
      yearError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (productCtrl.text.isEmpty) {
      productError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (coreCtrl.text.isEmpty) {
      coreError = Strings.mustBeFilled;
      ishasError = true;
    }
    if (missionCtrl.text.isEmpty) {
      missionError = Strings.mustBeFilled;
      ishasError = true;
    }
    return !ishasError;
  }

  void _onLocationCtrl() {
    setState(() {
      locationError = null;
    });
  }

  void _onIndustryCtrl() {
    setState(() {
      industryError = null;
    });
  }

  void _onEmployeeCtrl() {
    setState(() {
      employeeError = null;
    });
  }

  void _onYearCtrl() {
    setState(() {
      yearError = null;
    });
  }

  void _onProductCtrl() {
    setState(() {
      productError = null;
    });
  }

  void _onCoreCtrl() {
    setState(() {
      coreError = null;
    });
  }

  void _onMissionCtrl() {
    setState(() {
      missionError = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    locationCtrl.removeListener(_onLocationCtrl);
    industryCtrl.removeListener(_onIndustryCtrl);
    employeeCtrl.removeListener(_onEmployeeCtrl);
    yearCtrl.removeListener(_onYearCtrl);
    productCtrl.removeListener(_onProductCtrl);
    coreCtrl.removeListener(_onCoreCtrl);
    missionCtrl.removeListener(_onMissionCtrl);
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
                    widget.withAi ? Strings.doYour : Strings.letSFillInYour,
                secondText: widget.withAi
                    ? ' ${Strings.companyInformation} '
                    : ' ${Strings.companyInformation}!',
                thirdText: widget.withAi ? Strings.lookRight : null,
              ),
              spacerVertical(12),
              Text(
                widget.withAi
                    ? Strings.automaticallyFilledIn
                    : Strings.youCanEditThisLater,
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
                      icon: Vector.officeBuilding,
                      title: Strings.industry,
                      controller: industryCtrl,
                      errorText: industryError,
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
                      icon: Vector.userGroup,
                      title: Strings.employeeCount,
                      controller: employeeCtrl,
                      errorText: employeeError,
                    ),
                  ),
                  if (width < 1160) spacerVertical(55),
                  SizedBox(
                    width: width >= 1160 ? 380 : null,
                    child: IconMultilineTextField(
                      fontSize: 24,
                      icon: Vector.cake,
                      title: Strings.yearFounded,
                      controller: yearCtrl,
                      errorText: yearError,
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
                      icon: Vector.ightningBolt,
                      title: Strings.productsServices,
                      controller: productCtrl,
                      errorText: productError,
                    ),
                  ),
                  if (width < 1160) spacerVertical(55),
                  SizedBox(
                    width: width >= 1160 ? 380 : null,
                    child: IconMultilineTextField(
                      fontSize: 24,
                      icon: Vector.star,
                      title: Strings.coreValues,
                      controller: coreCtrl,
                      errorText: coreError,
                    ),
                  )
                ],
              ),
              spacerVertical(55),
              IconMultilineTextField(
                fontSize: 24,
                icon: Vector.globe,
                title: Strings.missionStatement,
                controller: missionCtrl,
                errorText: missionError,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Row(
                  children: [
                    SizedBox(
                      height: 75,
                      child: RoundedBackgroundButton(
                          backgroundColor: WEBColors.darkGreen,
                          horizontalSpacer: 48,
                          onClick: () => {
                                if (_checkFildsError())
                                  {widget.onNeedNextPage()}
                              },
                          text: Strings.yup),
                    ),
                    spacerHorizontal(32),
                    Text(
                      Strings.or,
                      style: Types.whiteRegular24TStyle,
                    ),
                    spacerHorizontal(32),
                    RegularBoltRegularText(
                      besicTextStyle: Types.whiteRegular24TStyle,
                      firstText: Strings.press,
                      secondText: ' ${Strings.enter}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
