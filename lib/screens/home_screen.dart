import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

import '../widgets/article_section.dart';
import '../widgets/video_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isToggled = false;

  List<ImageProvider> listIimages = const [
    ExactAssetImage('images/face1.jpg'),
    ExactAssetImage('images/face1.jpg'),
    ExactAssetImage('images/face1.jpg'),
    ExactAssetImage('images/face1.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ligthGray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              // header
              const BuildHeader(
                username: 'User',
              ),
              //Flashcards section
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      // section header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Flash Cards',
                            style: kDisplayH1,
                          ),
                          Text(
                            'see more',
                            style: kDisplaySeeMore,
                          )
                        ],
                      ),
                      // Flashcards set body
                      SizedBox(
                        height: 17.h,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF7497D),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        //card title
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Biologie',
                                              style: kDisplayCardH1,
                                            ),
                                            IconButton(
                                              icon: isToggled
                                                  ? const Icon(
                                                      Icons.bookmark_outline,
                                                      color: Colors.white,
                                                    )
                                                  : const Icon(
                                                      Icons.bookmark_outlined,
                                                      color: Colors.white,
                                                    ),
                                              onPressed: () {
                                                setState(() {
                                                  isToggled = !isToggled;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                        // card number items & progressbar
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '19 Items',
                                              style: kDisplayCardH3,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const StepProgressIndicator(
                                              totalSteps: 10,
                                              currentStep: 6,
                                              size: 7,
                                              padding: 0,
                                              roundedEdges: Radius.circular(10),
                                              selectedGradientColor:
                                                  LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.green,
                                                  Colors.green,
                                                ],
                                              ),
                                              unselectedGradientColor:
                                                  LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.white,
                                                  Colors.white
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        // user access flashcard
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FlutterImageStack.providers(
                                                providers: listIimages,
                                                showTotalCount: true,
                                                totalCount: 6,
                                                itemRadius:
                                                    25, // Radius of each images
                                                itemCount:
                                                    3, // Maximum number of images to be shown in stack
                                                itemBorderWidth:
                                                    1, // Border width around the images
                                                extraCountTextStyle:
                                                    const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              // add button
                                              Container(
                                                height: 3.h,
                                                width: 15.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5.0),
                                                      child: Text(
                                                        'ADD',
                                                        style:
                                                            kDisplayArticleH6,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF31B5FF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        //card title
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Biologie',
                                              style: kDisplayCardH1,
                                            ),
                                            IconButton(
                                              icon: isToggled
                                                  ? const Icon(
                                                      Icons.bookmark_outline,
                                                      color: Colors.white,
                                                    )
                                                  : const Icon(
                                                      Icons.bookmark_outlined,
                                                      color: Colors.white,
                                                    ),
                                              onPressed: () {
                                                setState(() {
                                                  isToggled = !isToggled;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                        // card number items & progressbar
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '19 Items',
                                              style: kDisplayCardH3,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const StepProgressIndicator(
                                              totalSteps: 10,
                                              currentStep: 6,
                                              size: 7,
                                              padding: 0,
                                              roundedEdges: Radius.circular(10),
                                              selectedGradientColor:
                                                  LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.green,
                                                  Colors.green,
                                                ],
                                              ),
                                              unselectedGradientColor:
                                                  LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.white,
                                                  Colors.white
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        // user access flashcard
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FlutterImageStack.providers(
                                                providers: listIimages,
                                                showTotalCount: true,
                                                totalCount: 6,
                                                itemRadius:
                                                    25, // Radius of each images
                                                itemCount:
                                                    3, // Maximum number of images to be shown in stack
                                                itemBorderWidth:
                                                    1, // Border width around the images
                                                extraCountTextStyle:
                                                    const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              // add button
                                              Container(
                                                height: 3.h,
                                                width: 15.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5.0),
                                                      child: Text(
                                                        'ADD',
                                                        style:
                                                            kDisplayArticleH6,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  width: 55.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF7497D),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        //card title
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Biologie',
                                              style: kDisplayCardH1,
                                            ),
                                            IconButton(
                                              icon: isToggled
                                                  ? const Icon(
                                                      Icons.bookmark_outline,
                                                      color: Colors.white,
                                                    )
                                                  : const Icon(
                                                      Icons.bookmark_outlined,
                                                      color: Colors.white,
                                                    ),
                                              onPressed: () {
                                                setState(() {
                                                  isToggled = !isToggled;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                        // card number items & progressbar
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '19 Items',
                                              style: kDisplayCardH3,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const StepProgressIndicator(
                                              totalSteps: 10,
                                              currentStep: 6,
                                              size: 7,
                                              padding: 0,
                                              roundedEdges: Radius.circular(10),
                                              selectedGradientColor:
                                                  LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.green,
                                                  Colors.green,
                                                ],
                                              ),
                                              unselectedGradientColor:
                                                  LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.white,
                                                  Colors.white
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        // user access flashcard
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FlutterImageStack.providers(
                                                providers: listIimages,
                                                showTotalCount: true,
                                                totalCount: 6,
                                                itemRadius:
                                                    25, // Radius of each images
                                                itemCount:
                                                    3, // Maximum number of images to be shown in stack
                                                itemBorderWidth:
                                                    1, // Border width around the images
                                                extraCountTextStyle:
                                                    const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              // add button
                                              Container(
                                                height: 3.h,
                                                width: 15.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    const Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5.0),
                                                      child: Text(
                                                        'ADD',
                                                        style:
                                                            kDisplayArticleH6,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Articles section
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Articles header
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Articles',
                        style: kDisplayH1,
                      ),
                      Text(
                        'see more',
                        style: kDisplaySeeMore,
                      )
                    ],
                  ),
                  // Articles body
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: SizedBox(
                      height: 19.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          // aricles items
                          BuildArticleSection(
                            autor: 'Michel adjetey - 2 days ago',
                            title: 'How to learn \nFlutter in 2023',
                            description:
                                "Major updates to graphics performance, web integration, developer productivity and security in Flutter 3.10",
                            articleImage: 'images/profile.jpg',
                          ),
                          BuildArticleSection(
                            autor: 'Michel adjetey - 2 days ago',
                            title: 'How to learn \nFlutter in 2023',
                            description:
                                "Major updates to graphics performance, web integration, developer productivity and security in Flutter 3.10",
                            articleImage: 'images/profile.jpg',
                          ),
                          BuildArticleSection(
                            autor: 'Michel adjetey - 2 days ago',
                            title: 'How to learn \nFlutter in 2023',
                            description:
                                "Major updates to graphics performance, web integration, developer productivity and security in Flutter 3.10",
                            articleImage: 'images/profile.jpg',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              //Recommandation section
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                  child: Column(
                    children: [
                      // container header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Video content',
                            style: kDisplayH1,
                          ),
                          Text(
                            'see more',
                            style: kDisplaySeeMore,
                          )
                        ],
                      ),
                      // container body
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            VideoContent(
                              videoAsset: 'images/profile.jpg',
                              profileImage: 'images/profile.jpg',
                              title: 'The power of AI in the\nlife of student',
                              videoInfo: 'Salomon Diei -  1 day ago',
                            ),
                            VideoContent(
                              videoAsset: 'images/profile.jpg',
                              profileImage: 'images/profile.jpg',
                              title: 'The power of AI in the\nlife of student',
                              videoInfo: 'Salomon Diei -  1 day ago',
                            ),
                            VideoContent(
                              videoAsset: 'images/profile.jpg',
                              profileImage: 'images/profile.jpg',
                              title: 'The power of AI in the\nlife of student',
                              videoInfo: 'Salomon Diei -  1 day ago',
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class BuildHeader extends StatelessWidget {

  const BuildHeader({
    super.key,
    required this.username,
  });
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, $username',
                style: kAppbarDisplayH1,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'How u ready to study ?',
                style: kAppbarDisplayH2,
              ),
            ],
          ),
          // profile image
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: const DecorationImage(
                image: AssetImage('images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
