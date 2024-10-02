import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class ChatPageItem extends StatefulWidget {
  const ChatPageItem({
    required this.onTapChat,
    super.key,
  });
  final VoidCallback onTapChat;

  @override
  State<ChatPageItem> createState() => _ChatPageItemState();
}

class _ChatPageItemState extends State<ChatPageItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      onHover: (event) {
        setState(() {
          isHover = true;
        });
      },
      child: GestureDetector(
        onTap: widget.onTapChat,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          color: isHover ? WEBColors.tertiaryBG : WEBColors.drawerColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: WEBColors.cyan,
                ),
              ),
              spacerHorizontal(
                25,
              ),
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
                          child: Text(
                            'Alan Matviienko',
                            style: Types.buttonBoltH4TStyle,
                          ),
                        ),
                        spacerVertical(8),
                        Text(
                          '7/14/24',
                          style: Types.buttonH4TStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Nice. I’m not sure if I know exactly',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Types.buttonH4TStyle.apply(
                              color: WEBColors.liteGray.withOpacity(
                                0.66,
                              ),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          Vector.chevronRight,
                        ),
                      ],
                    ),
                    spacerVertical(8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: WEBColors.lightBlue.withOpacity(
                          0.4,
                        ),
                      ),
                      child: Text(
                        'Engineering',
                        style: Types.textLinkTStyle.apply(
                          color: WEBColors.fontWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
