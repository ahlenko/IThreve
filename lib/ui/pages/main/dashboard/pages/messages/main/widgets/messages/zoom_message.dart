import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/domain/model/message_model.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/messages_main_page_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/widgets/messages/disuqalify_dialog.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class ZoomMessage extends StatelessWidget {
  const ZoomMessage({
    required this.message,
    super.key,
  });
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: context.screenWidth / 4,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: WEBColors.drawerColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              message.title!,
              style: Types.headerBoldButtonTStyle,
              textAlign: TextAlign.center,
            ),
            spacerVertical(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Vector.calendar,
                  ),
                  spacerHorizontal(8),
                  Text(
                    message.zoom!.meetingDate,
                    style: Types.buttonH4TStyle,
                  ),
                ],
              ),
            ),
            spacerVertical(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Vector.location,
                    width: 19,
                    height: 19,
                    fit: BoxFit.scaleDown,
                  ),
                  spacerHorizontal(8),
                  Text(
                    'Zoom',
                    style: Types.buttonH4TStyle.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: WEBColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                message.text,
                style: Types.buttonH4TStyle.apply(
                  color: WEBColors.white.withOpacity(
                    0.66,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            _buildButton(
              onTap: () {},
              text: Strings.nextRound,
              textColor: WEBColors.liteGreen,
              bgColor: WEBColors.liteGreen,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: _buildButton(
                onTap: () {},
                text: Strings.maybe,
                textColor: WEBColors.yellow,
              ),
            ),
            _buildButton(
              onTap: () {
                context.read<MessagesMainPageCubit>().emitDialogOpen(true);
                showDialog(
                    context: context,
                    builder: (con) => const DisuqualifyDialog()).then((va) {
                  context.read<MessagesMainPageCubit>().emitDialogOpen(false);
                });
              },
              text: Strings.disuqalify,
              textColor: WEBColors.erroeRed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      {required VoidCallback onTap,
      required String text,
      required Color textColor,
      Color bgColor = WEBColors.white}) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: bgColor.withOpacity(
              0.1,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            )),
        child: Text(text,
            style: Types.buttonH4TStyle.apply(
              color: textColor,
            )),
      ),
    );
  }
}
