import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:study_ai/screens/main_screen.dart';
import 'package:study_ai/theme/app_theme.dart';
import '../network/supa_base_client.dart';
import '../widgets/add_profile_widget.dart';
import '../widgets/app_dialog.dart';
import '../widgets/app_drop_down.dart';
import '../widgets/main_button.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key, required this.name});

  final String name;
  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _supabaseClient = SupabaseManager();
  String dropdownvalue1 = 'Middle School';
  String studyLevelsText = '';

  List<String> studyLevels = [
    'Middle School',
    'Hight School',
    'College',
    'Doctorate'
  ];
  String dropdownvalue2 = 'Art';
  String areasOfInterestText = '';

  List<String> areasOfInterest = [
    'Art',
    'Biology',
    'Chemistry',
    'Drama',
    'Economics',
    'Foreign Languages',
    'Geography',
    'History',
    'Mathematics',
    'Physics',
    'Programming',
    'Sports',
  ];

  bool isPictureLoaded = false;
  File? photoFile;
  String? photoUrl;
  bool isLoading = false;

  Future<void> pickImage(int value) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image;
    if (value == 1) {
      // Pick an image.
      image = await picker.pickImage(source: ImageSource.gallery);
    } else {
      // Capture a photo.
      image = await picker.pickImage(source: ImageSource.camera);
    }

    if (image != null) {
      File file = File(image.path);
      isPictureLoaded = true;
      photoFile = file;

      photoUrl = await _supabaseClient.uploadImage(context, imageFile: image);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ligthGray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Study Genius',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 19.sp),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                'Add your informations',
                style: GoogleFonts.roboto(
                    color: AppTheme.darkBlue,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Study more efficiently with AI Powered tools',
                style: TextStyle(
                    color: AppTheme.darkBlue.withOpacity(0.8), fontSize: 17.sp),
              ),
              const SizedBox(
                height: 10,
              ),
              AddProfileWidget(
                text: 'Add a profile picture',
                onTap: () async {
                  await displayDialog(
                      context,
                      () => setState(() {
                            pickImage(1);
                          }),
                      () => setState(() {
                            pickImage(2);
                          }));

                  setState(() {});
                },
                imageFile: photoFile,
                isPhotoLoaded: isPictureLoaded,
              ),
              SizedBox(
                height: 5.h,
              ),
              AppDropDowwn(
                hintText: 'Study Level',
                dropdownvalue: dropdownvalue1,
                onChanged: (newValue) {
                  setState(() {
                    dropdownvalue1 = newValue!;
                  });
                },
                items: studyLevels
                    .map((items) => DropdownMenuItem(
                        value: items,
                        onTap: () => setState(() {
                              studyLevelsText = items;
                            }),
                        child: Text(items)))
                    .toList(),
              ),
              SizedBox(
                height: 3.h,
              ),
              AppDropDowwn(
                hintText: 'Areas of Interest',
                dropdownvalue: dropdownvalue2,
                onChanged: (newValue) {
                  setState(() {
                    dropdownvalue2 = newValue!;
                  });
                },
                items: areasOfInterest
                    .map((items) => DropdownMenuItem(
                        value: items,
                        onTap: () => setState(() {
                              areasOfInterestText = items;
                            }),
                        child: Text(items)))
                    .toList(),
              ),
              SizedBox(
                height: 6.h,
              ),
              MainButton(
                onPressed: () => completeAcrion(context,
                    name: widget.name,
                    interests: areasOfInterestText,
                    profilePictureUrl: photoUrl,
                    studyLevel: studyLevelsText),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        'Complete',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void completeAcrion(BuildContext context,
      {String? name,
      String? studyLevel,
      String? interests,
      String? profilePictureUrl}) async {
    await _supabaseClient.saveData(context,
        name: name,
        studyLevel: studyLevel,
        interests: interests,
        profilePictureUrl: profilePictureUrl);

    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => const MainScreen()));
  }

  Future<void> displayDialog(
      context, VoidCallback onTap1, VoidCallback onTap2) async {
    await showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        children: [
          Center(
            child: Text(
              'Select Image Provider',
              style: GoogleFonts.roboto(
                  color: AppTheme.darkBlue, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ShowDialogOptionWidget(
                name: 'Gallery',
                iconData: Icons.image,
                onTap: onTap1,
              ),
              const SizedBox(
                width: 5,
              ),
              Divider(
                thickness: 10,
                height: 20,
                color: AppTheme.darkBlue,
              ),
              const SizedBox(
                width: 5,
              ),
              ShowDialogOptionWidget(
                name: 'Camera',
                iconData: Icons.camera,
                onTap: onTap2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
