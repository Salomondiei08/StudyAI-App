
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_theme.dart';

class ShowDialogOptionWidget extends StatelessWidget {
  const ShowDialogOptionWidget({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.name,
  });
  final String name;
  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconData,
            color: AppTheme.darkBlue,
            size: 25.sp,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: GoogleFonts.roboto(color: AppTheme.darkBlue),
          )
        ],
      ),
    );
  }
}
