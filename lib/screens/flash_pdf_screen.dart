import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'package:flip_card/flip_card.dart';

class FlashPdfScreen extends StatefulWidget {
  const FlashPdfScreen({super.key});

  @override
  State<FlashPdfScreen> createState() => _FlashPdfScreenState();
}

class _FlashPdfScreenState extends State<FlashPdfScreen> {
  String frontContent = "C'est quoi la biologie ?";
  String backContent =
      "La biologie est la science de la vie, qui étudie les organismes vivants et leur environnement. Elle se divise en plusieurs sous-disciplines, comme la génétique, l'écologie, la zoologie et la botanique. La biologie permet de comprendre comment les organismes fonctionnent, comment ils évoluent et comment ils interagissent avec leur environnement. Elle est essentielle pour de nombreux domaines, tels que la médecine, l'agriculture, l'environnement et la biotechnologie.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flash PDF',
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20.sp,
            ),
            FlipCard(
              fill: Fill
                  .fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              side: CardSide.FRONT, // The side to initially display.
              front: Container(
                height: 50.h,
                width: 80.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF27354B),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      frontContent,
                      style: kSummerizeText,
                    ),
                  ),
                ),
              ),
              back: Container(
                height: 50.h,
                width: 80.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF4960F7),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      backContent,
                      style: kSummerizeText,
                    ),
                  ),
                ),
              ),
            ),
            // summerise body
            SizedBox(
              height: 40.sp,
            ),
            // button
            InkWell(
              onTap: () {},
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
                      'Save Flashcard',
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
