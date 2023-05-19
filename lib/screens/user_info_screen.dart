import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:study_ai/theme/app_theme.dart';
import '../widgets/app_textfield.dart';
import '../widgets/main_button.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
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
            SizedBox(
              height: 5.h,
            ),
            const AppTextField(
              labelText: 'Name',
            ),
            SizedBox(
              height: 3.h,
            ),
            DropdownButton(
              items: [
                DropdownMenuItem(
                    child: Container(
                  child: Container(),
                ))
              ],
              onChanged: (o) {},
              icon: Icon(Icons.keyboard_arrow_down),
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
          ]),
        ),
      ),
    ));
  }
}
