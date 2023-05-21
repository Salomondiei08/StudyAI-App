import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:study_ai/theme/app_theme.dart';
import '../widgets/app_textfield.dart';
import '../widgets/main_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                height: 9.h,
              ),
              Text(
                'Create an account',
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
                height: 5.h,
              ),
              const AppTextField(
                labelText: 'Name',
              ),
              SizedBox(
                height: 3.h,
              ),
              const AppTextField(
                labelText: 'Email',
                iconData: Icons.email_outlined,
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
                height: 6.h,
              ),
              MainButton(
                child: Text(
                  'SIGN UP',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or login with',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SocialLoginButton(
                backgroundColor: Colors.white,
                height: 7.h,
                text: 'Google',
                borderRadius: 20,
                fontSize: 25,
                buttonType: SocialLoginButtonType.google,
                onPressed: () {},
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
