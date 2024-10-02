import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/domain/model/selected_with_count.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/messages/roles_messages_page_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/messages/roles_messages_page_state.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/roles_page_controller_types.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class RolesMessagesPage extends StatefulWidget {
  final Function(String dialogName) onNeedDialog;
  const RolesMessagesPage({super.key, required this.onNeedDialog});

  @override
  State<RolesMessagesPage> createState() => _RolesMessagesPageState();
}

class _RolesMessagesPageState extends State<RolesMessagesPage> {
  RolesMessagesPageCubit cubit = getIt.get<RolesMessagesPageCubit>();
  final ScrollController _scrollController = ScrollController();
  bool descriptionHovered = false;
  bool hireByHovered = false;
  bool toTopHovered = false;
  bool stateHovered = false;
  bool _isExpanded = false;
  OverlayEntry? _overlayEntry;

  bool hireMenuOpened = false;
  bool top10MenuOpened = false;

  List<SelectedWithCount> interviewStages = [
    SelectedWithCount(title: Strings.messages, count: 20),
    SelectedWithCount(title: '1st Interview', count: 10),
    SelectedWithCount(title: '2st Interview', count: 3),
    SelectedWithCount(title: '3st Interview', count: 2),
    SelectedWithCount(title: '4st Interview', count: 3),
    SelectedWithCount(title: Strings.disqualified, count: 12),
  ];

  void _toggleDropdown() {
    if (_isExpanded) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) =>
          BlocBuilder<RolesMessagesPageCubit, RolesMessagesPageState>(
              bloc: cubit,
              builder: (context, state) {
                return Positioned(
                  top: 154,
                  right: 40,
                  child: SizedBox(
                    width: 111,
                    child: Column(
                      children: [
                        MouseRegion(
                          onEnter: (_) => cubit.changePauseState(true),
                          onExit: (_) => cubit.changePauseState(false),
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => {
                              widget.onNeedDialog(
                                  RolesPageControllerTypes.roleDeleted),
                              _toggleDropdown()
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: WEBColors.yellow, width: 1),
                                  borderRadius: BorderRadius.circular(25),
                                  color: state.statePauseHovered
                                      ? WEBColors.yellow.withOpacity(0.4)
                                      : WEBColors.yellow.withOpacity(0.2)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: WEBColors.yellow,
                                    ),
                                  ),
                                  spacerHorizontal(8),
                                  Text(
                                    Strings.pause,
                                    style: Types.buttonH4TStyle.copyWith(
                                        color: WEBColors.fontWhite,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        spacerVertical(5),
                        MouseRegion(
                          onEnter: (_) => cubit.changeDeleteState(true),
                          onExit: (_) => cubit.changeDeleteState(false),
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => {
                              widget.onNeedDialog(
                                  RolesPageControllerTypes.roleDeleted),
                              _toggleDropdown()
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: WEBColors.erroeRed, width: 1),
                                  borderRadius: BorderRadius.circular(25),
                                  color: state.stateDeleteHovered
                                      ? WEBColors.erroeRed.withOpacity(0.4)
                                      : WEBColors.erroeRed.withOpacity(0.2)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: WEBColors.erroeRed,
                                    ),
                                  ),
                                  spacerHorizontal(8),
                                  Text(
                                    Strings.close,
                                    style: Types.buttonH4TStyle.copyWith(
                                        color: WEBColors.fontWhite,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isExpanded = true;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RolesMessagesPageCubit, RolesMessagesPageState>(
      bloc: cubit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Designer',
                    style: Types.headerLogoTStyle
                        .copyWith(color: WEBColors.fontGray),
                  ),
                  spacerHorizontal(10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      MouseRegion(
                        onEnter: (_) =>
                            setState(() => descriptionHovered = true),
                        onExit: (_) =>
                            setState(() => descriptionHovered = false),
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => widget.onNeedDialog(
                              RolesPageControllerTypes.reviewDialog),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: descriptionHovered
                                        ? WEBColors.cyan
                                        : Colors.transparent,
                                    width: 1),
                                borderRadius: BorderRadius.circular(25),
                                color: descriptionHovered
                                    ? WEBColors.white.withOpacity(0.4)
                                    : WEBColors.white.withOpacity(0.2)),
                            child: Text(
                              Strings.jobDescription,
                              style: Types.buttonH4TStyle
                                  .copyWith(color: WEBColors.fontWhite),
                            ),
                          ),
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) => setState(() => hireByHovered = true),
                        onExit: (_) => setState(() => hireByHovered = false),
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: hireByHovered
                                      ? WEBColors.cyan
                                      : Colors.transparent,
                                  width: 1),
                              color: hireByHovered
                                  ? WEBColors.white.withOpacity(0.4)
                                  : WEBColors.white.withOpacity(0.2)),
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Text(
                                      '${Strings.hireBy} 9/24/24',
                                      style: Types.buttonH4TStyle
                                          .copyWith(color: WEBColors.fontWhite),
                                    ),
                                  ),
                                  Positioned(
                                      right: -9,
                                      top: -11,
                                      child: PopupMenuButton<int>(
                                          menuPadding: EdgeInsets.zero,
                                          icon: SvgPicture.asset(
                                            Vector.dotsVertical,
                                            color: hireMenuOpened
                                                ? WEBColors.cyan
                                                : null,
                                          ),
                                          color: WEBColors.midnightDark,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          offset: const Offset(0, 42),
                                          onOpened: () => setState(
                                              () => hireMenuOpened = true),
                                          onCanceled: () => setState(
                                              () => hireMenuOpened = false),
                                          onSelected: (value) {
                                            widget.onNeedDialog(
                                                RolesPageControllerTypes
                                                    .calendarDialog);
                                            setState(
                                                () => hireMenuOpened = false);
                                          },
                                          itemBuilder: (context) => [
                                                PopupMenuItem<int>(
                                                  value: 1,
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        Vector.pencil,
                                                        color: WEBColors.white,
                                                      ),
                                                      spacerHorizontal(4),
                                                      Text(
                                                        Strings.edit,
                                                        style: Types
                                                            .buttonH4TStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) => setState(() => toTopHovered = true),
                        onExit: (_) => setState(() => toTopHovered = false),
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: toTopHovered
                                      ? WEBColors.cyan
                                      : Colors.transparent,
                                  width: 1),
                              borderRadius: BorderRadius.circular(25),
                              color: toTopHovered
                                  ? WEBColors.white.withOpacity(0.4)
                                  : WEBColors.white.withOpacity(0.2)),
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Text(
                                      Strings.top10Offer,
                                      style: Types.buttonH4TStyle
                                          .copyWith(color: WEBColors.fontWhite),
                                    ),
                                  ),
                                  Positioned(
                                      right: -9,
                                      top: -11,
                                      child: PopupMenuButton<int>(
                                          menuPadding: EdgeInsets.zero,
                                          icon: SvgPicture.asset(
                                            Vector.dotsVertical,
                                            color: top10MenuOpened
                                                ? WEBColors.cyan
                                                : null,
                                          ),
                                          color: WEBColors.midnightDark,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          offset: const Offset(0, 42),
                                          onOpened: () => setState(
                                              () => top10MenuOpened = true),
                                          onCanceled: () => setState(
                                              () => top10MenuOpened = false),
                                          onSelected: (value) {
                                            setState(
                                                () => top10MenuOpened = false);
                                          },
                                          itemBuilder: (context) => [
                                                PopupMenuItem<int>(
                                                  value: 1,
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        Vector.arrowRight20,
                                                        color: WEBColors.white,
                                                      ),
                                                      spacerHorizontal(4),
                                                      Text(
                                                        Strings.seeMore,
                                                        style: Types
                                                            .buttonH4TStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) => setState(() => stateHovered = true),
                        onExit: (_) => setState(() => stateHovered = false),
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: _toggleDropdown,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: WEBColors.liteGreen, width: 1),
                                borderRadius: BorderRadius.circular(25),
                                color: stateHovered
                                    ? WEBColors.liteGreen.withOpacity(0.4)
                                    : WEBColors.liteGreen.withOpacity(0.2)),
                            child: Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: WEBColors.liteGreen,
                                  ),
                                ),
                                spacerHorizontal(8),
                                Text(
                                  Strings.active,
                                  style: Types.buttonH4TStyle
                                      .copyWith(color: WEBColors.fontWhite),
                                ),
                                spacerHorizontal(4),
                                SvgPicture.asset(Vector.arrowDown)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              spacerVertical(24),
              SizedBox(
                  width: double.infinity,
                  child:
                      horizontalLine(0.5, WEBColors.white.withOpacity(0.33))),
              spacerVertical(40),
              Scrollbar(
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    constraints:
                        BoxConstraints(minWidth: screenWidth(context) - 355),
                    height: screenHeight(context) - 224,
                    child: Flexible(
                      child: Row(
                        children: [
                          for (var i = 0; i < interviewStages.length; i++)
                            InterviewStageItem(
                              onDeleteClick: () => widget.onNeedDialog(
                                  RolesPageControllerTypes.deleteStage),
                              stage: interviewStages[i],
                              isMessages: i == 0,
                              isDisquilied: i == interviewStages.length - 1,
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class InterviewStageItem extends StatefulWidget {
  final SelectedWithCount stage;
  final bool isMessages;
  final bool isDisquilied;
  final Function() onDeleteClick;
  const InterviewStageItem(
      {super.key,
      required this.stage,
      required this.isMessages,
      required this.isDisquilied,
      required this.onDeleteClick});

  @override
  State<InterviewStageItem> createState() => _InterviewStageItemState();
}

class _InterviewStageItemState extends State<InterviewStageItem> {
  void message(context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool hovered = false;
  bool menuOpened = false;
  bool secondMenuOpened = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            onEnter: (_) => setState(() => hovered = true),
            onExit: (_) => setState(() => hovered = false),
            cursor: SystemMouseCursors.click,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      color: menuOpened ? WEBColors.cyan : Colors.transparent,
                      width: 1),
                  color: hovered
                      ? widget.isDisquilied
                          ? WEBColors.erroeRed.withOpacity(0.4)
                          : WEBColors.white.withOpacity(0.4)
                      : widget.isDisquilied
                          ? WEBColors.erroeRed.withOpacity(0.2)
                          : WEBColors.white.withOpacity(0.2)),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: widget.isDisquilied || widget.isMessages
                                ? 0
                                : 25),
                        child: Text(
                          '${widget.stage.title} (${widget.stage.count})',
                          style: Types.buttonH4TStyle
                              .copyWith(color: WEBColors.fontWhite),
                        ),
                      ),
                      Positioned(
                        right: -9,
                        top: -11,
                        child: Offstage(
                          offstage: widget.isDisquilied || widget.isMessages,
                          child: PopupMenuButton<int>(
                            menuPadding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              Vector.dotsVertical,
                              color: menuOpened ? WEBColors.cyan : null,
                            ),
                            color: WEBColors.midnightDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            offset: const Offset(0, 42),
                            onOpened: () => setState(() => menuOpened = true),
                            onCanceled: () =>
                                setState(() => menuOpened = false),
                            onSelected: (value) {
                              setState(() => menuOpened = false);
                              if (value == 3) {
                                widget.onDeleteClick();
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem<int>(
                                value: 1,
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Vector.pencil20svg,
                                      color: WEBColors.white,
                                    ),
                                    spacerHorizontal(4),
                                    Text(
                                      Strings.rename,
                                      style: Types.buttonH4TStyle,
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem<int>(
                                value: 2,
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Vector.plusCircle20,
                                          color: WEBColors.white,
                                        ),
                                        spacerHorizontal(4),
                                        Text(
                                          Strings.addStage,
                                          style: Types.buttonH4TStyle,
                                        ),
                                      ],
                                    ),
                                    PopupMenuButton<int>(
                                      icon: SvgPicture.asset(
                                        Vector.chevronRight,
                                        color: WEBColors.white,
                                      ),
                                      color: WEBColors.midnightDark,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      offset: const Offset(178, -32),
                                      onOpened: () => setState(
                                          () => secondMenuOpened = true),
                                      onCanceled: () => setState(
                                          () => secondMenuOpened = false),
                                      onSelected: (value) {
                                        setState(
                                            () => secondMenuOpened = false);
                                      },
                                      itemBuilder: (context) => [
                                        PopupMenuItem<int>(
                                          value: 1,
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                Vector.arrowLeft20,
                                                color: WEBColors.white,
                                              ),
                                              spacerHorizontal(4),
                                              Text(
                                                Strings.addStageToLeft,
                                                style: Types.buttonH4TStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 2,
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                Vector.arrowRight20,
                                                color: WEBColors.white,
                                              ),
                                              spacerHorizontal(4),
                                              Text(
                                                Strings.addStageToRight,
                                                style: Types.buttonH4TStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              PopupMenuItem<int>(
                                value: 3,
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      Vector.trash20,
                                    ),
                                    spacerHorizontal(4),
                                    Text(
                                      Strings.deleteStage,
                                      style: Types.buttonH4TStyle
                                          .copyWith(color: WEBColors.erroeRed),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          spacerVertical(16),
          Container(
            height: screenHeight(context) - 320,
            width: 296,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: WEBColors.black.withOpacity(0.1)),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < widget.stage.count; i++)
                      const MessageItem(),
                  ],
                ),
              ),
            ),
          ),
          spacerVertical(43),
        ],
      ),
    );
  }
}

class MessageItem extends StatefulWidget {
  const MessageItem({super.key});

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      cursor: SystemMouseCursors.click,
      child: Container(
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: WEBColors.white.withOpacity(hovered ? 0.3 : 0.1),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: WEBColors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              spacerHorizontal(9),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            lorem(paragraphs: 1, words: 2),
                            overflow: TextOverflow.ellipsis,
                            style: Types.textFieldTitleTStyle
                                .copyWith(color: WEBColors.white),
                          ),
                        ),
                        SvgPicture.asset(Vector.dotsVertical)
                      ],
                    ),
                    spacerVertical(4),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: WEBColors.cyan,
                          ),
                          width: 8,
                          height: 8,
                        ),
                        spacerHorizontal(8),
                        Flexible(
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            lorem(paragraphs: 1, words: 10),
                            style: Types.buttonH4TStyle.copyWith(
                                color: WEBColors.white.withOpacity(0.66)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
