import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDataEnterDialog extends StatefulWidget {
  const CalendarDataEnterDialog({super.key});

  @override
  State<CalendarDataEnterDialog> createState() =>
      _CalendarDataEnterDialogState();
}

class _CalendarDataEnterDialogState extends State<CalendarDataEnterDialog> {
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  String formatDate(DateTime date) {
    return DateFormat('MM/dd/yy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.only(
            left: (screenWidth(context) > UiConst.adaptiveWidth
                    ? UiConst.drawerWidth
                    : UiConst.drawerWidthCompact) +
                15,
            right: 15),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 350, maxWidth: 405),
            decoration: BoxDecoration(
              color: WEBColors.darkDialogGray.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(19)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Strings.adjustTheHireDate,
                      style: Types.headerLogoTStyle,
                      textAlign: TextAlign.center,
                    ),
                    spacerVertical(30),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        decoration: const BoxDecoration(
                          color: WEBColors.calendarColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          formatDate(selectedDay ?? focusedDay),
                          style:
                              Types.whiteRegular24TStyle.copyWith(fontSize: 24),
                        )),
                    spacerVertical(30),
                    Container(
                      decoration: const BoxDecoration(
                        color: WEBColors.calendarColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TableCalendar(
                        calendarStyle: const CalendarStyle(
                          defaultTextStyle: TextStyle(color: Colors.white),
                          weekendTextStyle: TextStyle(color: Colors.white),
                          todayTextStyle: TextStyle(color: Colors.white),
                          outsideTextStyle: TextStyle(color: Colors.white),
                          disabledTextStyle: TextStyle(color: Colors.white),
                          selectedTextStyle: TextStyle(color: Colors.white),
                        ),
                        headerStyle: const HeaderStyle(
                          titleTextStyle: TextStyle(color: Colors.white),
                          formatButtonTextStyle: TextStyle(color: Colors.white),
                          leftChevronIcon:
                              Icon(Icons.chevron_left, color: Colors.white),
                          rightChevronIcon:
                              Icon(Icons.chevron_right, color: Colors.white),
                        ),
                        selectedDayPredicate: (day) {
                          return isSameDay(selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            this.selectedDay = selectedDay;
                            this.focusedDay = focusedDay;
                          });
                        },
                        availableCalendarFormats: const {
                          CalendarFormat.month: "Month"
                        },
                        firstDay: DateTime.now(),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                        startingDayOfWeek: StartingDayOfWeek.monday,
                      ),
                    ),
                    spacerVertical(40),
                    GradientButton(
                        height: 75,
                        gradientSource: Raster.greenGradient,
                        onClick: () => {Navigator.pop(context)},
                        text: Strings.save),
                    spacerVertical(16),
                    ClickableTextButton(
                        onClick: () => {
                              Navigator.pop(context),
                            },
                        text: Strings.cancel,
                        hoveredStyle:
                            Types.buttonH4TStyle.copyWith(fontSize: 20),
                        regularStyle: Types.buttonH4TStyle
                            .copyWith(fontSize: 20)
                            .copyWith(color: WEBColors.white))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
