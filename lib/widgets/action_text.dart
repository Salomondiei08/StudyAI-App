import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_theme.dart';

class ActionText extends StatelessWidget {
  const ActionText({
    required this.text,
    super.key,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(text,
          style: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkBlue,
          )),
    );
  }
}

