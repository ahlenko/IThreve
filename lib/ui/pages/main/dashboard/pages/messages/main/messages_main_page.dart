import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ithreve_web/app/constants/strings.dart';

import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/domain/model/message_model.dart';

import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/messages_main_page_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/messages_main_page_state.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/pages/list_chats_page.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/widgets/list_chats_column.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/widgets/messages/messages_screen.dart';
import 'package:ithreve_web/ui/theme/colors.dart';

class MessagesMainPage extends StatefulWidget {
  const MessagesMainPage({super.key});

  @override
  State<MessagesMainPage> createState() => _MessagesMainPageState();
}

class _MessagesMainPageState extends State<MessagesMainPage> {
  final TextEditingController _controller = TextEditingController();
  List<Message> _messages = [];
  int _selectedPage = 0;

  @override
  void initState() {
    _messages = List.generate(30, (i) {
      return i == 1
          ? Message(
              text:
                  'You’ll be able to review which includes the list of questions that we suggest that you ask which is  AI-optimized to have the best assessment relating  to what kind of candidate you’re looking for. ',
              id: 1,
              date: DateTime.now(),
              title: 'Would you like to review the interview notes?',
              buttonTitle: 'Review interview notes',
            )
          : i == 0
              ? Message(
                  text:
                      Strings.moveCandidateForward,
                  id: 1,
                  date: DateTime.now(),
                  title: '1st Interview finished.',
                  zoom: MessageZoomModel(
                    link: 'link',
                    meetingDate: 'Mon, 8/29/24, 3:00-3:30 PM',
                  ),
                )
              : Message(
                  text: 'Message $i',
                  id: i % 2 == 0 ? 0 : 1,
                  date: i <= 10
                      ? DateTime.now()
                      : i <= 20
                          ? DateTime.now().subtract(
                              const Duration(
                                days: 1,
                              ),
                            )
                          : DateTime.now().subtract(
                              const Duration(
                                days: 2,
                              ),
                            ),
                );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = context.screenWidth > 1200;

    return BlocBuilder<MessagesMainPageCubit, MessagesMainPageState>(
      builder: (context, state) {
        return ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: state.isDialogOpen ? 10 : 0,
            sigmaY: state.isDialogOpen ? 10 : 0,
          ),
          child: Scaffold(
            backgroundColor: WEBColors.dark,
            body: _selectedPage == 0
                ? ListChatPage(
                    onTapChat: () {
                      setState(() {
                        _selectedPage = 1;
                      });
                    },
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isLargeScreen
                          ? Expanded(
                              child: ListChatsColumn(
                                onTapChat: () {
                                  setState(() {
                                    _selectedPage = 1;
                                  });
                                },
                              ),
                            )
                          : SizedBox(
                              width: 80,
                              child: ListChatsColumn(
                                onTapChat: () {
                                  setState(() {
                                    _selectedPage = 1;
                                  });
                                },
                              ),
                            ),
                      MessagesScreen(
                        onPop: () {
                          setState(() {
                            _selectedPage = 0;
                          });
                        },
                        messages: _messages,
                        controller: _controller,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
