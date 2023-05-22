import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:study_ai/screens/pdfchat_screen.dart';
import 'package:study_ai/screens/quizz_pdf_screen.dart';

import '../network/app_urls.dart';
import '../network/ko_exception.dart';
import '../network/supa_base_client.dart';
import '../providers/pdf_provider.dart';
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
  PDFProvider pdfProvider = PDFProvider();
  bool loaded = false;
  String fileName = '';
  String? fileLink;
  String? fileLinkOnServer;
  SupabaseManager supabaseManager = SupabaseManager();
  // take file fonction
  @override
  void initState() {
    pdfProvider = Provider.of<PDFProvider>(context, listen: false);
    super.initState();
  }

  void openFiles() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;

      setState(() {
        loaded = !loaded;
        fileName = file.name;
      });

      fileLink = await supabaseManager.uploadFile(context,
          selectedFilePath: file.path, bucketName: 'pdf');

      try {
        final response = await get(Uri.parse("${AppUrl.loadPdf}$fileLink"));
        if (response.statusCode == 200) {
          final dynamic data = json.decode(response.body);
          debugPrint("--- Response Data for docs : $data");

          pdfProvider.thumbnailLink = data['tempfile_path'];
        } else {
          throw Exception(
              'Could not parse response. erroe code ${response.statusCode}');
        }
      } on DioError catch (e) {
        if (e.response != null && e.response!.statusCode != null) {
          throw KoException(
            statusCode: e.response!.statusCode!,
            message: e.response!.data.toString(),
          );
        } else {
          throw Exception(e.message);
        }
      }
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
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const QuizScreen())),
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
