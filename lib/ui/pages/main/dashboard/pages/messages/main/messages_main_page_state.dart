class MessagesMainPageState {
  final bool isDialogOpen;

  MessagesMainPageState({this.isDialogOpen = false});

  MessagesMainPageState copyWith({bool? isDialogOpen}) {
    return MessagesMainPageState(
      isDialogOpen: isDialogOpen ?? this.isDialogOpen,
    );
  }
}
