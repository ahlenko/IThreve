import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/fields/autocomplit_text_t_field.dart';
import 'package:ithreve_web/ui/components/fields/regular_text_field.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class CompanyNameStep extends StatefulWidget {
  final Function() onNeedNextPage;
  final bool withAi;
  const CompanyNameStep(
      {super.key, required this.onNeedNextPage, required this.withAi});

  @override
  State<CompanyNameStep> createState() => _CompanyNameStepState();
}

class _CompanyNameStepState extends State<CompanyNameStep> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController urlctrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? urlError;
  bool linkSubmitted = false;

  @override
  void initState() {
    super.initState();
    nameCtrl.addListener(_onNameChange);
    urlctrl.addListener(_onUrlChange);
  }

  void _onNameChange() {
    setState(() {});
  }

  void _onUrlChange() {
    setState(() {
      urlError = null;
    });
  }

  bool _checkValidUrl() {
    String? error;
    if (widget.withAi) {
      if (!linkSubmitted) {
        error = Strings.theUrlIsRequired;
      }
    } else {
      if (urlctrl.text.isEmpty) {
        error = Strings.theUrlIsRequired;
      }
    }

    setState(() {
      urlError = error;
    });

    return error == null;
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    nameCtrl.removeListener(_onNameChange);
    urlctrl.removeListener(_onUrlChange);
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (event) => {
        if (event.isKeyPressed(LogicalKeyboardKey.enter))
          if (_checkValidUrl()) {widget.onNeedNextPage()}
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RegularBoltRegularText(
              firstText: Strings.whatSYour,
              secondText: ' ${Strings.companyName}?',
            ),
            spacerVertical(50),
            if (widget.withAi)
              AutocomplitTextTField(
                clearSubmittedText: false,
                hintText: Strings.typeHere,
                onChanged: (value) => {},
                onSubmitted: (value) => {
                  setState(() {
                    linkSubmitted = true;
                  }),
                },
              )
            else
              RegularTextField(
                fontSize: 32,
                hintText: Strings.typeHere,
                controller: nameCtrl,
              ),
            Offstage(
                offstage: widget.withAi || nameCtrl.text.length < 2,
                child: Column(
                  children: [
                    spacerVertical(50),
                    RegularTextField(
                      fontSize: 32,
                      errorText: urlError,
                      hintText: Strings.url,
                      controller: urlctrl,
                    )
                  ],
                )),
            Offstage(
              offstage: !linkSubmitted && nameCtrl.text.length < 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    GradientButton(
                        height: 75,
                        horizontalSpacer: 54,
                        gradientSource: Raster.greenGradient,
                        onClick: () => {
                              if (_checkValidUrl()) {widget.onNeedNextPage()}
                            },
                        text: Strings.next),
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
            )
          ],
        ),
      ),
    );
  }
}
