class Message {
  final String text;
  final int id;
  final DateTime date;
  final String? title;
  final String? buttonTitle;
  final MessageZoomModel? zoom;

  Message({
    required this.text,
    required this.id,
    required this.date,
    this.buttonTitle,
    this.title,
    this.zoom,
  });
}

class MessageZoomModel {
  MessageZoomModel({
    required this.link,
    required this.meetingDate,
  });

  final String link;
  final String meetingDate;
}
