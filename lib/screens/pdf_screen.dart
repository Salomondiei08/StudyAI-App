import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_ai/screens/pdfchat_screen.dart';

import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dotted_border/dotted_border.dart';
import '../widgets/main_button.dart';
import 'flash_pdf_screen.dart';
import 'summerize_pdf_screen.dart';

class ChatPdfScreen extends StatefulWidget {
  const ChatPdfScreen({super.key});

  @override
  State<ChatPdfScreen> createState() => _ChatPdfScreenState();
}

class _ChatPdfScreenState extends State<ChatPdfScreen> {
  bool loaded = false;
  String fileName = '';

  // take file fonction
  void openFiles() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      //allowedExtensions: ['jpg', 'pdf'],
      allowedExtensions: ['pdf'],
    );

    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;

      setState(() {
        loaded = !loaded;
        fileName = file.name;
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
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  '$fileName file uploaded',
                                  style: kAppbarDisplayH2.copyWith(
                                      fontSize: 15.sp, color: Colors.green),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MainButton(
                      child: Text(
                        'chat',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PdfChatScreen()));
                      },
                    ),
                    MainButton(
                      child: Text(
                        'chat',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SummerizePdfScreen()));
                      },
                    ),
                    MainButton(
                      child: Text(
                        'Flash PDF',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FlashPdfScreen()));
                      },
                    ),
                    MainButton(
                        child: Text(
                      'Flash PDF',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    )),
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
