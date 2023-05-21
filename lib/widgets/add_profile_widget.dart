import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_theme.dart';

class AddProfileWidget extends StatelessWidget {
  const AddProfileWidget({
    super.key,
    this.onTap,
    required this.text,
    required this.imageFile,
    required this.isPhotoLoaded,
  });

  final VoidCallback? onTap;
  final String text;
  final bool isPhotoLoaded;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundImage: isPhotoLoaded ? FileImage(imageFile!) : null,
              radius: 15.w,
              backgroundColor: AppTheme.darkBlue,
              child: isPhotoLoaded
                  ? null
                  : Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 22.sp,
                    ),
            ),
          ),
          Text(
            isPhotoLoaded ? 'Image added successfully' : text,
            style: GoogleFonts.roboto(
                color: AppTheme.darkBlue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
