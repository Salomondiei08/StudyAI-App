import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:typewritertext/typewritertext.dart';
import '../providers/pdf_provider.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';

class SummerizePdfScreen extends StatefulWidget {
  const SummerizePdfScreen({super.key});

  @override
  State<SummerizePdfScreen> createState() => _SummerizePdfScreenState();
}

class _SummerizePdfScreenState extends State<SummerizePdfScreen> {
  PDFProvider pdfProvider = PDFProvider();
  String content =
      "La biologie est la science de la vie, qui étudie les organismes vivants et leur environnement. Elle se divise en plusieurs sous-disciplines, comme la génétique, l'écologie, la zoologie et la botanique. La biologie permet de comprendre comment les organismes fonctionnent, comment ils évoluent et comment ils interagissent avec leur environnement. Elle est essentielle pour de nombreux domaines, tels que la médecine, l'agriculture, l'environnement et la biotechnologie.";
  @override
  void initState() {
    pdfProvider = Provider.of<PDFProvider>(context, listen: false);

    super.initState();
  }

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
            FutureBuilder(
              future: pdfProvider.initSummary(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppTheme.darkBlue,
                    ));
                  default:
                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (!snapshot.hasData) {
                      return SizedBox(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
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
                                      pdfProvider.fileSummary!,
                                      style: kSummerizeText,
                                    ),
                                    duration: const Duration(milliseconds: 50),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(child: Text('An Error occured'));
                    }
                }
              },
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
