import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:study_ai/theme/app_theme.dart';

import '../widgets/action_text.dart';
import '../widgets/app_textfield.dart';
import '../widgets/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.ligthGray,
        body: Padding(
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
              height: 12.h,
            ),
            Text(
              'Welcome,',
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
            SizedBox(
              height: 8.h,
            ),
            const AppTextField(
              labelText: 'Email',
              iconData: Icons.email,
            ),
            SizedBox(
              height: 3.h,
            ),
            const AppTextField(
              labelText: 'Password',
              iconData: Icons.security_rounded,
              obscureText: true,
            ),
            SizedBox(
              height: 4.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ActionText(text: "Forgot password ?",),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            const MainButton(text: 'LOGIN',),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\' have an account yet ?',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              const  SizedBox(
                  width: 10,
                ),
                const ActionText(text: "Register")
              ],
            ),

          ]),
        ),
      ),
    );
  }
}

