class RolesMessagesPageState {
  bool statePauseHovered;
  bool stateDeleteHovered;

  RolesMessagesPageState(
      {this.stateDeleteHovered = false, this.statePauseHovered = false});
  RolesMessagesPageState copyWith(
      {bool? statePauseHovered, bool? stateDeleteHovered}) {
    return RolesMessagesPageState(
        stateDeleteHovered: stateDeleteHovered ?? this.stateDeleteHovered,
        statePauseHovered: statePauseHovered ?? this.statePauseHovered);
  }
}
