class SwipesMainPageState {
  int selectedPageIndex;
  bool projectExpanded;

  SwipesMainPageState(
      {this.selectedPageIndex = 0, this.projectExpanded = false});

  SwipesMainPageState copyWith(
      {int? selectedPageIndex, bool? projectExpanded}) {
    return SwipesMainPageState(
        selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex,
        projectExpanded: projectExpanded ?? this.projectExpanded);
  }
}
