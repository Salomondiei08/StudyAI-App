import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:study_ai/screens/signup_screem.dart';
import 'package:study_ai/theme/app_theme.dart';

import '../network/supa_base_client.dart';
import '../widgets/action_text.dart';
import '../widgets/app_textfield.dart';
import '../widgets/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _supabaseClient = SupabaseManager();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    await _supabaseClient.signInUser(context,
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ligthGray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Study Genius',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 19.sp),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
                        color: AppTheme.darkBlue.withOpacity(0.8),
                        fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  AppTextField(
                    labelText: 'Email',
                    iconData: Icons.email,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Email password';
                      }
                      return null;
                    },
                    textController: _emailController,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  AppTextField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Password password';
                      }
                      return null;
                    },
                    textController: _passwordController,
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
                      ActionText(
                        text: "Forgot password ?",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  MainButton(
                    onPressed: () => loginUser(),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'LOGIN',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp),
                          ),
                  ),
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
                      const SizedBox(
                        width: 10,
                      ),
                      ActionText(
                        text: "Register",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const SignupScreen())),
                      )
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
