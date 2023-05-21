import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:typewritertext/typewritertext.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';

class SummerizePdfScreen extends StatefulWidget {
  const SummerizePdfScreen({super.key});

  @override
  State<SummerizePdfScreen> createState() => _SummerizePdfScreenState();
}

class _SummerizePdfScreenState extends State<SummerizePdfScreen> {

  String content= "La biologie est la science de la vie, qui étudie les organismes vivants et leur environnement. Elle se divise en plusieurs sous-disciplines, comme la génétique, l'écologie, la zoologie et la botanique. La biologie permet de comprendre comment les organismes fonctionnent, comment ils évoluent et comment ils interagissent avec leur environnement. Elle est essentielle pour de nombreux domaines, tels que la médecine, l'agriculture, l'environnement et la biotechnologie.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Summerize PDF',
          style: kDisplayH1.copyWith(fontSize: 20.sp),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF27354B),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.ligthGray,
      ),
      backgroundColor: AppTheme.ligthGray,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // summerise body
            Container(
              height: 70.h,
              width: 80.h,
              decoration: BoxDecoration(
                color: const Color(0xFF27354B),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TypeWriterText(
                    maintainSize: false,
                    text: Text(
                      content,
                      style: kSummerizeText,
                    ),
                    duration: const Duration(milliseconds: 50),
                  ),
                ),
              ),
            ),
            // button
            InkWell(
              onTap: (){},
              child: Container(
                height: 6.h,
                width: 80.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF27354B),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Generate Flashcard',
                      style: kDisplayArticleH1.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
