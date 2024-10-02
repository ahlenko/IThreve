class SelectedDashboardItem {
  final String icon;
  final String iconChecked;
  final String title;
  final int messages;
  final String? pageType;

  SelectedDashboardItem({
    required this.icon,
    this.pageType,
    this.iconChecked = '',
    required this.title,
    this.messages = 0,
  });

  SelectedDashboardItem copyWith({
    String? icon,
    String? iconChecked,
    String? title,
    int? messages,
    String? pageType,
  }) {
    return SelectedDashboardItem(
      icon: icon ?? this.icon,
      title: title ?? this.title,
      iconChecked: iconChecked ?? this.iconChecked,
      messages: messages ?? this.messages,
      pageType: pageType ?? this.pageType,
    );
  }
}
