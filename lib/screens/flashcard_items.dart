import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'package:flip_card/flip_card.dart';

class FlasCArdItemsScreen extends StatefulWidget {
  const FlasCArdItemsScreen({super.key});

  @override
  State<FlasCArdItemsScreen> createState() => _FlasCArdItemsScreenState();
}

class _FlasCArdItemsScreenState extends State<FlasCArdItemsScreen> {
  final PageController pageController = PageController(initialPage: 0);
  // the index of the current page
  int _activePage = 0;
  String frontContent = "C'est quoi la biologie ?";
  String backContent =
      "La biologie est la science de la vie, qui étudie les organismes vivants et leur environnement. Elle se divise en plusieurs sous-disciplines, comme la génétique, l'écologie, la zoologie et la botanique. La biologie permet de comprendre comment les organismes fonctionnent, comment ils évoluent et comment ils interagissent avec leur environnement. Elle est essentielle pour de nombreux domaines, tels que la médecine, l'agriculture, l'environnement et la biotechnologie.";

  final List<Widget> pages = const [
    FlashcardItems(
        frontContent: "C'est quoi la biologie 0 ?",
        backContent:
            "La biologie est la science de la vie, qui étudie les organismes vivants et leur environnement. Elle se divise en plusieurs sous-disciplines, comme la génétique, l'écologie, la zoologie et la botanique. La biologie permet de comprendre comment les organismes fonctionnent, comment ils évoluent et comment ils interagissent avec leur environnement. Elle est essentielle pour de nombreux domaines, tels que la médecine, l'agriculture, l'environnement et la biotechnologie."),
    FlashcardItems(
        frontContent: "C'est quoi la biologie 1 ?",
        backContent:
            "La biologie est la science de la vie, qui étudie les organismes vivants et leur environnement. Elle se divise en plusieurs sous-disciplines, comme la génétique, l'écologie, la zoologie et la botanique. La biologie permet de comprendre comment les organismes fonctionnent, comment ils évoluent et comment ils interagissent avec leur environnement. Elle est essentielle pour de nombreux domaines, tels que la médecine, l'agriculture, l'environnement et la biotechnologie."),
    FlashcardItems(
        frontContent: "C'est quoi la biologie 2 ?",
        backContent:
            "La biologie est la science de la vie, qui étudie les organismes vivants et leur environnement. Elle se divise en plusieurs sous-disciplines, comme la génétique, l'écologie, la zoologie et la botanique. La biologie permet de comprendre comment les organismes fonctionnent, comment ils évoluent et comment ils interagissent avec leur environnement. Elle est essentielle pour de nombreux domaines, tels que la médecine, l'agriculture, l'environnement et la biotechnologie."),
    FlashcardItems(
        frontContent: "C'est quoi la biologie 3 ?",
        backContent:
            "La biologie est la science de la vie, qui étudie les organismes vivants et leur environnement. Elle se divise en plusieurs sous-disciplines, comme la génétique, l'écologie, la zoologie et la botanique. La biologie permet de comprendre comment les organismes fonctionnent, comment ils évoluent et comment ils interagissent avec leur environnement. Elle est essentielle pour de nombreux domaines, tels que la médecine, l'agriculture, l'environnement et la biotechnologie."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flash Card',
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
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemCount: pages.length,
              itemBuilder: (BuildContext context, int index) {
                return pages[index % pages.length];
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 220.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      pages.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            pageController.animateTo(
                              index + 0.0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: _activePage == index ? const Color(0xFF27354B) : Colors.grey,
                          ),
                        ),
                      ),
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

class FlashcardItems extends StatelessWidget {
  const FlashcardItems({
    super.key,
    required this.frontContent,
    required this.backContent,
  });

  final String frontContent;
  final String backContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Flashcard
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
      ],
    );
  }
}
