import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:study_ai/theme/app_theme.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.ligthGray,
        body: SingleChildScrollView(
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
              const MainButton(
                text: 'SIGN UP',
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
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: SupaSocialsAuth(
                  socialProviders: const [
                    SocialProviders.google,
                  ],
                  colored: true,
                  onSuccess: (Session response) {
                    // do something, for example: navigate('home');
                  },
                  onError: (error) {
                    // do something, for example: navigate("wait_for_email");
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
