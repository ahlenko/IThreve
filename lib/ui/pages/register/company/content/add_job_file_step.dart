import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:path/path.dart' as p;
import 'dart:math' as math;
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/domain/model/uploading_file.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class AddJobFileStep extends StatefulWidget {
  final Function() onNeedNextPage;
  const AddJobFileStep({super.key, required this.onNeedNextPage});

  @override
  State<AddJobFileStep> createState() => _AddJobFileStepState();
}

class _AddJobFileStepState extends State<AddJobFileStep> {
  List<UploadingFile> files = [];

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List? fileBytes = result.files.single.bytes;
      if (fileBytes != null) {
        UploadingFile newFile = UploadingFile(
            data: fileBytes,
            name: result.files.single.name,
            size: result.files.single.size);
        List<UploadingFile> updatedFiles = List.from(files);
        updatedFiles.add(newFile);
        setState(() {
          files = updatedFiles;
        });

        Future.delayed(const Duration(milliseconds: 500), () {
          for (UploadingFile file1 in files) {
            if (file1.data == fileBytes) {
              file1.progress = 0.5;
              setState(() {
                files = files;
              });

              Future.delayed(const Duration(milliseconds: 500), () {
                for (UploadingFile file1 in files) {
                  if (file1.data == fileBytes) {
                    file1.progress = 1;
                    break;
                  }
                }
                setState(() {
                  files = files;
                });
              });
              break;
            }
          }
        });
      }
    }
  }

  removeDocument(UploadingFile file) {
    List<UploadingFile> updatedFiles = List.from(files);
    updatedFiles.remove(file);
    setState(() {
      files = updatedFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RegularBoltRegularText(
            firstText: Strings.doYouWantToUploadAJob,
          ),
          spacerVertical(12),
          Text(
            Strings.letSAddJobInformationHere,
            style: Types.grayRegular24TStyle,
          ),
          spacerVertical(65),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => pickDocument(),
            child: Container(
              height: 264,
              decoration: BoxDecoration(
                color: WEBColors.white.withOpacity(0.1),
                border: Border.all(
                  color: WEBColors.white.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SvgPicture.asset(
                    Vector.plus,
                    width: 24,
                    height: 24,
                  ),
                  spacerVertical(8),
                  Text(
                    Strings.chooseFileOrDragFiles,
                    style: Types.buttonH4TStyle
                        .copyWith(color: WEBColors.white.withOpacity(0.66)),
                    textAlign: TextAlign.center,
                  )
                ]),
              ),
            ),
          ),
          spacerVertical(16),
          Offstage(
            offstage: files.isEmpty,
            child: Text(
              Strings.uploading,
              style:
                  Types.textFieldTitleTStyle.copyWith(color: WEBColors.white),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              for (UploadingFile file in files)
                _ResumeFileItem(
                  file: file,
                  onDelete: () => removeDocument(file),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 65),
            child: Row(
              children: [
                GradientButton(
                    height: 75,
                    horizontalSpacer: 54,
                    gradientSource: Raster.greenGradient,
                    onClick: () => {widget.onNeedNextPage()},
                    text: Strings.next),
                spacerHorizontal(32),
                ClickableTextButton(
                    onClick: () => widget.onNeedNextPage(),
                    text: Strings.skip,
                    hoveredStyle: Types.textFieldTitleTStyle
                        .copyWith(color: WEBColors.white),
                    regularStyle: Types.textFieldTitleTStyle)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ResumeFileItem extends StatefulWidget {
  final UploadingFile file;
  final VoidCallback onDelete;
  const _ResumeFileItem({required this.file, required this.onDelete});

  @override
  State<StatefulWidget> createState() {
    return _ResumeFileItemState();
  }
}

class _ResumeFileItemState extends State<_ResumeFileItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8, top: 32),
      child: Expanded(
        child: Row(
          children: [
            if (widget.file.progress < 1)
              SvgPicture.asset(
                Vector.file,
              ),
            if (widget.file.progress == 1)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SvgPicture.asset(
                  Vector.checked,
                  width: 29,
                  height: 29,
                ),
              ),
            spacerHorizontal(
              8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            p.basenameWithoutExtension(widget.file.name),
                            style:
                                Types.buttonBoltH4TStyle.copyWith(fontSize: 15),
                          ),
                          spacerHorizontal(8),
                          Text(formatBytes(widget.file.size),
                              style: Types.textFieldTitleTStyle.copyWith(
                                fontSize: 12,
                              )),
                        ],
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: widget.onDelete,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            Vector.cross,
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: widget.file.progress < 1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: widget.file.progress,
                          backgroundColor: WEBColors.liteGray.withOpacity(0.1),
                          valueColor:
                              const AlwaysStoppedAnimation(WEBColors.cyan),
                        ),
                      ),
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

  String formatBytes(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return "0 Bytes";
    const suffixes = ["Bytes", "KB", "MB", "GB", "TB"];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return '${(bytes / math.pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
