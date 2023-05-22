import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.child,
    this.onPressed,
    super.key,
  });

final Widget child;
final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.darkBlue,
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(1, 5), blurRadius: 3),
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
            child
            ],
          ),
        ),
      ),
    );
  }
}

