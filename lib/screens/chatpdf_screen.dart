import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dotted_border/dotted_border.dart';
import '../widgets/main_button.dart';

class ChatPdfScreen extends StatefulWidget {
  const ChatPdfScreen({super.key});

  @override
  State<ChatPdfScreen> createState() => _ChatPdfScreenState();
}

class _ChatPdfScreenState extends State<ChatPdfScreen> {
  bool loaded = false;

  // take file fonction
  void openFiles() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      //allowedExtensions: ['jpg', 'pdf'],
      allowedExtensions: ['pdf'],
    );

    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;
      // TODO : take the file name to create the namespace in picone
      print(file.name);
      setState(() {
        loaded = !loaded;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ligthGray,
      appBar: AppBar(
        title: Text(
          "Chat PDF",
          style: kDisplayH1,
        ),
        elevation: 0,
        backgroundColor: AppTheme.ligthGray,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            children: [
              // pdf import card
              InkWell(
                onTap: openFiles,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: const [6, 8],
                  radius: const Radius.circular(20),
                  strokeWidth: 3,
                  child: Container(
                    height: 25.h,
                    width: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loaded == false
                            ?
                            // Icon pdf
                            Icon(
                                Icons.upload_file,
                                size: 40.sp,
                                color: const Color(0x801A1818),
                              )
                            : Icon(
                                Icons.check_circle_outline,
                                size: 40.sp,
                                color: Colors.green,
                              ),
                        loaded == false
                            ?
                            // drop your pdf here
                            Text(
                                'Drop your pdf here',
                                style:
                                    kAppbarDisplayH2.copyWith(fontSize: 15.sp),
                              )
                            :
                            // drop your pdf here
                            Text(
                                'GOOD JOB',
                                style: kAppbarDisplayH2.copyWith(
                                    fontSize: 15.sp, color: Colors.green),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // list button
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainButton(
                      text: 'PDF chat',
                    ),
                    MainButton(
                      text: 'Summerize PDF',
                    ),
                    MainButton(
                      text: 'Flash PDF',
                    ),
                    MainButton(
                      text: 'Quiz PDF',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
