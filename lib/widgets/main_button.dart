import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.text,
    super.key,
    this.action
  });

  final String text;
  final VoidCallback? action;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.darkBlue,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 5),
              blurRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Text(
                text,
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
