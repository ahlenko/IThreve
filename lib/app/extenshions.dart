import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  ThemeData get theme => Theme.of(this);

  TextTheme get textStyles => theme.textTheme;

  MediaQueryData get media => MediaQuery.of(this);

  bool get canPop => Navigator.of(this).canPop();
  
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);
}

extension StringExtensions on String {
  String? get nullIfEmpty => isEmpty ? null : this;
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeFirstLetterOfEachWord() {
    return split(' ') // Разделяем строку по пробелам на отдельные слова
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1)}'
            : '') // Делаем первую букву заглавной
        .join(' '); // Соединяем слова обратно в строку
  }
}

extension DateTimeExtensions on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(
      const Duration(days: 1),
    );

    return yesterday.year == year &&
        yesterday.month == month &&
        yesterday.day == day;
  }

  bool get isThisYear => DateTime.now().year == year;
}
