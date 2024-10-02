import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/domain/model/message_model.dart';
import 'package:ithreve_web/ui/components/web/headers/dashboard_header.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/messages_main_page_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/widgets/messages/advice_container.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/widgets/messages/question_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/widgets/messages/zoom_message.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({
    required this.messages,
    required this.controller,
    required this.onPop,
    super.key,
  });
  final List<Message> messages;
  final TextEditingController controller;
  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Row(
            children: [
              spacerHorizontal(16),
              TextButton(
                onPressed: onPop,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                ),
                child: SvgPicture.asset(
                  Vector.arrowBack,
                ),
              ),
              const Spacer(),
              const DashboardHeader(
                headerTitle: '',
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            color: WEBColors.drawerColor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: WEBColors.liteGray,
                  ),
                ),
                spacerHorizontal(16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              'Alan Matviiйцвьйщцьвйцвьзйцьвйцзьвenko',
                              style: Types.buttonBoltH4TStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          spacerVertical(8),
                          const Spacer(),
                          Text(
                            'Software Engineer',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Types.buttonH4TStyle.apply(
                              color: WEBColors.liteGray.withOpacity(
                                0.66,
                              ),
                            ),
                          ),
                        ],
                      ),
                      spacerVertical(8),
                      Text(
                        '2nd Interview',
                        style: Types.buttonH4TStyle,
                      ),
                    ],
                  ),
                ),
                spacerHorizontal(16),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(100),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        Vector.dotsVertical,
                        width: 40,
                        height: 40,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isFirstMessageOfDay = index != 0 &&
                    (index == messages.length - 1 ||
                        !isSameDay(
                          messages[index].date,
                          messages[index + 1].date,
                        ));

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isFirstMessageOfDay && index == messages.length - 1)
                      _buildDateHeader(messages[index].date),
                    if (messages[index].zoom != null)
                      ZoomMessage(
                        message: messages[index],
                      )
                    else if (messages[index].title != null)
                      _buildMessageWithButton(
                        messages[index],
                        context,
                      )
                    else
                      _buildMessageBubble(
                        messages[index],
                        context,
                      ),
                    if (isFirstMessageOfDay && index != messages.length - 1)
                      _buildDateHeader(messages[index].date),
                  ],
                );
              },
            ),
          ),
          const AdviceContainer(),
          const Divider(
            color: WEBColors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    cursorColor: WEBColors.cyan,
                    style: Types.headerItemTStyle,
                    decoration: InputDecoration(
                      hintText: Strings.typeHere,
                      border: InputBorder.none,
                      hintStyle: Types.headerItemTStyle.apply(
                        color: WEBColors.white.withOpacity(
                          0.33,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 99,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: WEBColors.darkGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          40,
                        ),
                      ),
                    ),
                    child: Text(
                      Strings.send,
                      style: Types.headerBoldButtonTStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader(DateTime date) {
    String formattedDate = DateFormat('EEE, MMM d, h:mm a').format(date);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          formattedDate,
          style: Types.textLinkTStyle.apply(
            color: WEBColors.white.withOpacity(
              0.33,
            ),
          ),
        ),
      ),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Widget _buildMessageBubble(
    Message message,
    BuildContext context,
  ) {
    final isMe = message.id == 1;
    final alignment = isMe ? Alignment.centerRight : Alignment.centerLeft;
    final color = isMe ? WEBColors.darkGreen : WEBColors.white.withOpacity(0.1);
    final borderRadius = isMe
        ? const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          );
    return Align(
      alignment: alignment,
      child: Container(
        width: context.screenWidth / 4,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Flexible(
          child: Flexible(
            child: Text(
              message.text,
              style: Types.buttonBoltH4TStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageWithButton(
    Message message,
    BuildContext context,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: context.screenWidth / 4,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: WEBColors.drawerColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            Text(
              message.title!,
              style: Types.headerBoldButtonTStyle,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                message.text,
                style: Types.buttonH4TStyle.apply(
                  color: WEBColors.white.withOpacity(
                    0.66,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<MessagesMainPageCubit>().emitDialogOpen(true);
                showDialog(
                    context: context,
                    builder: (context) => const QuestionsDialog()).then((val) {
                  context.read<MessagesMainPageCubit>().emitDialogOpen(false);
                });
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: WEBColors.white.withOpacity(
                    0.1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  )),
              child: Text(
                message.buttonTitle ?? '',
                style: Types.buttonH4TStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
