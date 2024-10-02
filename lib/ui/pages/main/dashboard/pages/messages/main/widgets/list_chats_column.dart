import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/widgets/chat_widget.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class ListChatsColumn extends StatelessWidget {
  const ListChatsColumn({
    required this.onTapChat,
    super.key,
  });
  final VoidCallback onTapChat;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = context.screenWidth > 1200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: WEBColors.white.withOpacity(
                  0.33,
                ),
              ),
            ),
          ),
          child: isLargeScreen
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                        top: 24,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Software Engineer',
                            style: Types.whiteBottonTStyle,
                          ),
                          spacerHorizontal(8),
                          SvgPicture.asset(
                            Vector.chevronDown,
                          ),
                        ],
                      ),
                    ),
                    spacerVertical(16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin: const EdgeInsets.only(
                        left: 32,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        color: WEBColors.white.withOpacity(0.1),
                      ),
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(20),
                        isDense: true,
                        padding: EdgeInsets.zero,
                        value: 'Final offer stage',
                        icon: SvgPicture.asset(
                          Vector.chevronDown,
                          width: 16,
                          height: 16,
                          fit: BoxFit.scaleDown,
                        ),
                        elevation: 16,
                        dropdownColor: WEBColors.darkGray,
                        style: Types.buttonH4TStyle,
                        onChanged: (String? value) {},
                        underline: const SizedBox.shrink(),
                        items: ['Final offer stage']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    spacerVertical(16),
                  ],
                )
              : const SizedBox.shrink(),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ChatWidget(
                onTapChat: onTapChat,
              );
            },
          ),
        ),
      ],
    );
  }
}
