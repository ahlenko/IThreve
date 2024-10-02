import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/domain/model/compact_role_model.dart';
import 'package:ithreve_web/domain/model/selected_with_count.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/main/roles_main_page_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/main/roles_main_page_state.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/roles_page_controller_types.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class RolesMainPage extends StatefulWidget {
  final Function(String roleId) onNeedPage;
  final Function(String dialogName) onNeedDialog;
  const RolesMainPage(
      {super.key, required this.onNeedDialog, required this.onNeedPage});

  @override
  State<RolesMainPage> createState() => _RolesMainPageState();
}

class _RolesMainPageState extends State<RolesMainPage> {
  RolesMainPageCubit cubit = getIt.get<RolesMainPageCubit>();

  List<SelectedWithCount> itemsSelector = [
    SelectedWithCount(title: Strings.all, selected: true, count: 39),
    SelectedWithCount(title: 'Programmers', count: 20),
    SelectedWithCount(title: 'Designers', count: 30),
    SelectedWithCount(title: 'Sales', count: 20),
    SelectedWithCount(title: 'Marketing', count: 23),
    SelectedWithCount(title: 'Business', count: 2),
    SelectedWithCount(title: Strings.paused, count: 1),
    SelectedWithCount(title: Strings.closed, count: 2),
  ];

  List<CompactRoleModel> roleItems = [
    CompactRoleModel(
        hireDate: '8/5/24',
        isDelayed: true,
        isDraft: false,
        currentStep: '2nd interview',
        nextStep: 'Waiting for @AyanaTerauchi to review 3 candidates',
        roleName: 'Software Engineering',
        step: 2,
        stepCount: 4,
        trains:
            'The effect the candidate will have on the business summary, potentially key words '),
    CompactRoleModel(
        hireDate: '',
        isDelayed: false,
        isDraft: true,
        nextStep: '',
        currentStep: 'Draft',
        roleName: 'Software Engineering',
        step: 0,
        stepCount: 0,
        trains: '')
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RolesMainPageCubit, RolesMainPageState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 54,
              child: Scrollbar(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: ListView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      spacerHorizontal(32),
                      for (SelectedWithCount item in itemsSelector)
                        ItemSelector(
                            item: item,
                            onChangeSelections: (selected) => setState(() {
                                  for (SelectedWithCount itemR
                                      in itemsSelector) {
                                    itemR.selected = false;
                                  }
                                  item.selected = selected;
                                })),
                      spacerHorizontal(20)
                    ],
                  ),
                ),
              ),
            ),
            const OnTimeDropdownButton(),
            spacerVertical(10),
            SizedBox(
              height: screenHeight(context) - 215,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  for (var i = 1; i < itemsSelector.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: i == 1 ? 10 : 20, bottom: 12),
                              child: Text(
                                itemsSelector[i].title.toUpperCase(),
                                style: Types.textFieldTitleTStyle
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            for (var i = 0; i < roleItems.length; i++)
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: i < roleItems.length - 1 ? 24 : 0),
                                child: RoleItem(
                                  item: roleItems[i],
                                  onClick: () => widget.onNeedPage(''),
                                  onDescription: () => widget.onNeedDialog(
                                      RolesPageControllerTypes.reviewDialog),
                                  onDelete: () => widget.onNeedDialog(
                                      RolesPageControllerTypes.roleDeleted),
                                  onPause: () => widget.onNeedDialog(
                                      RolesPageControllerTypes.roleDeleted),
                                ),
                              )
                          ]),
                    ),
                  spacerVertical(32)
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class RoleItem extends StatefulWidget {
  final CompactRoleModel item;
  final Function() onDelete;
  final Function() onPause;
  final Function() onDescription;
  final Function() onClick;

  const RoleItem(
      {super.key,
      required this.item,
      required this.onClick,
      required this.onDelete,
      required this.onDescription,
      required this.onPause});

  @override
  State<RoleItem> createState() => _RoleItemState();
}

class _RoleItemState extends State<RoleItem> {
  bool hoveredAll = false;
  bool hoveredDelete = false;
  bool hoveredPause = false;
  bool hoveredDescription = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hoveredAll = true),
      onExit: (_) => setState(() => hoveredAll = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onClick(),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: WEBColors.white),
                  color: hoveredAll
                      ? WEBColors.roleItemColorHovered
                      : WEBColors.roleItemColor),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 24, bottom: 24, left: 32, right: 136),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Offstage(
                      offstage: !widget.item.isDraft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          Strings.draft,
                          style: Types.buttonBoltH4TStyle
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(widget.item.roleName,
                                style: Types.whiteRegular24TStyle.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            Offstage(
                              offstage: !widget.item.isDelayed,
                              child: Container(
                                margin: const EdgeInsets.only(left: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: WEBColors.yellow.withOpacity(0.2),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 8),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Vector.clock),
                                    spacerHorizontal(8),
                                    Text(Strings.delayed,
                                        style: Types.buttonH4TStyle.copyWith(
                                            color: WEBColors.fontWhite)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        MouseRegion(
                          onEnter: (_) =>
                              setState(() => hoveredDescription = true),
                          onExit: (_) =>
                              setState(() => hoveredDescription = false),
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => widget.onDescription(),
                            child: Text(
                              Strings.jobDescription,
                              style: Types.buttonBoltH4TStyle.copyWith(
                                  decoration: hoveredDescription
                                      ? TextDecoration.underline
                                      : null),
                            ),
                          ),
                        ),
                      ],
                    ),
                    spacerVertical(16),
                    Wrap(
                      spacing: 10,
                      children: [
                        SizedBox(
                            width: 120,
                            child: Row(
                              children: [
                                SvgPicture.asset(Vector.nextClock),
                                spacerHorizontal(4),
                                Text(Strings.next,
                                    style: Types.buttonH4TStyle.copyWith(
                                        color:
                                            WEBColors.white.withOpacity(0.66))),
                              ],
                            )),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: WEBColors.cyan),
                            ),
                            spacerHorizontal(5),
                            Text(
                                widget.item.nextStep.isEmpty
                                    ? Strings.finishFillingOutTheJobPost
                                    : widget.item.nextStep,
                                style: Types.buttonH4TStyle),
                          ],
                        )
                      ],
                    ),
                    spacerVertical(4),
                    Wrap(
                      spacing: 10,
                      children: [
                        SizedBox(
                            width: 120,
                            child: Row(
                              children: [
                                SvgPicture.asset(Vector.pencil),
                                spacerHorizontal(4),
                                Text(
                                  Strings.traits,
                                  style: Types.buttonH4TStyle.copyWith(
                                      color: WEBColors.white.withOpacity(0.66)),
                                ),
                              ],
                            )),
                        Text(
                            widget.item.trains.isEmpty
                                ? Strings.tbd
                                : widget.item.trains,
                            style: Types.buttonH4TStyle)
                      ],
                    ),
                    spacerVertical(4),
                    Wrap(
                      spacing: 10,
                      children: [
                        SizedBox(
                            width: 120,
                            child: Row(
                              children: [
                                SvgPicture.asset(Vector.calendar),
                                spacerHorizontal(4),
                                Text(Strings.hireDate,
                                    style: Types.buttonH4TStyle.copyWith(
                                        color:
                                            WEBColors.white.withOpacity(0.66))),
                              ],
                            )),
                        Text(
                            widget.item.hireDate.isEmpty
                                ? Strings.tbd
                                : widget.item.hireDate,
                            style: Types.buttonH4TStyle)
                      ],
                    ),
                    spacerVertical(24),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: widget.item.isDraft
                              ? 0
                              : (1 / widget.item.stepCount) * widget.item.step,
                          backgroundColor: WEBColors.liteGray.withOpacity(0.1),
                          valueColor:
                              const AlwaysStoppedAnimation(WEBColors.cyan),
                        ),
                      ),
                    ),
                    spacerVertical(4),
                    Text(
                      widget.item.currentStep,
                      style: Types.buttonH4TStyle,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 1,
              top: 1,
              bottom: 1,
              child: Row(
                children: [
                  MouseRegion(
                    onEnter: (_) => setState(() => hoveredPause = true),
                    onExit: (_) => setState(() => hoveredPause = false),
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => widget.onPause(),
                      child: Container(
                        width: 52,
                        color: hoveredPause
                            ? WEBColors.yellow.withOpacity(0.45)
                            : WEBColors.yellow.withOpacity(0.2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Vector.pause),
                          ],
                        ),
                      ),
                    ),
                  ),
                  MouseRegion(
                    onEnter: (_) => setState(() => hoveredDelete = true),
                    onExit: (_) => setState(() => hoveredDelete = false),
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => widget.onDelete(),
                      child: Container(
                          width: 52,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(19)),
                            color: hoveredDelete
                                ? WEBColors.erroeRed.withOpacity(0.5)
                                : WEBColors.erroeRed.withOpacity(0.3),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(Vector.delete),
                              ])),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnTimeDropdownButton extends StatefulWidget {
  const OnTimeDropdownButton({super.key});

  @override
  State<OnTimeDropdownButton> createState() => _OnTimeDropdownButtonState();
}

class _OnTimeDropdownButtonState extends State<OnTimeDropdownButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => hovered = true),
          onExit: (_) => setState(() => hovered = false),
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: WEBColors.white.withOpacity(hovered ? 0.3 : 0.1)),
            margin: const EdgeInsets.only(right: 48),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(Vector.clock),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(Strings.onTime, style: Types.buttonH4TStyle)),
                SvgPicture.asset(Vector.arrowDown)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ItemSelector extends StatefulWidget {
  final SelectedWithCount item;
  final Function(bool) onChangeSelections;

  const ItemSelector(
      {super.key, required this.item, required this.onChangeSelections});

  @override
  State<ItemSelector> createState() => _ItemSelectorState();
}

class _ItemSelectorState extends State<ItemSelector> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => setState(() => hovered = true),
        onExit: (_) => setState(() => hovered = false),
        cursor: !widget.item.selected
            ? SystemMouseCursors.click
            : MouseCursor.defer,
        child: GestureDetector(
          onTap: () => {
            if (!widget.item.selected)
              widget.onChangeSelections(!widget.item.selected),
          },
          child: IntrinsicWidth(
            child: Container(
              alignment: Alignment.center,
              height: 40,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.item.selected
                      ? WEBColors.cyan.withOpacity(0.2)
                      : WEBColors.white.withOpacity(hovered ? 0.3 : 0.1),
                  border: Border.all(
                      width: 2,
                      color: widget.item.selected
                          ? WEBColors.cyan.withOpacity(0.4)
                          : Colors.transparent)),
              child: Text(
                '${widget.item.title} (${widget.item.count})',
                style: widget.item.selected
                    ? Types.buttonBoltH4TStyle
                    : Types.buttonH4TStyle.copyWith(
                        color:
                            WEBColors.white.withOpacity(hovered ? 0.66 : 0.33)),
              ),
            ),
          ),
        ));
  }
}
