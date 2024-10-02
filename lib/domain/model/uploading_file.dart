import 'dart:typed_data';

class UploadingFile {
  Uint8List? data;
  double progress;
  String name;
  int size;

  UploadingFile(
      {required this.data,
      this.progress = 0.0,
      required this.name,
      required this.size});
}
