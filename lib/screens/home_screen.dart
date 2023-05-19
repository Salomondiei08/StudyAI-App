import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

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
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.ligthGray,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                // header
                BuildHeader(
                  username: 'User',
                ),
                //Flashcards section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      // color: Colors.red,
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
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 14),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            //card title
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Biologie',
                                                  style: kDisplayCardH1,
                                                ),
                                                IconButton(
                                                  icon: isToggled
                                                      ? const Icon(Icons
                                                          .bookmark_outline)
                                                      : const Icon(
                                                          Icons
                                                              .bookmark_outlined,
                                                          color: Colors.red,
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
                                                  roundedEdges:
                                                      Radius.circular(10),
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
                                                  Container(
                                                    height: 3.h,
                                                    width: 15.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.orange,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                    child: const Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Center(
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.green,
                                                          ),
                                                        ),
                                                        Text('ADD'),
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
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //card title
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Biologie',
                                                  style: kDisplayCardH1,
                                                ),
                                                IconButton(
                                                  icon: isToggled
                                                      ? const Icon(Icons
                                                          .favorite_border_outlined)
                                                      : const Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Colors.redAccent,
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
                                                  size: 6,
                                                  padding: 0,
                                                  roundedEdges:
                                                      Radius.circular(10),
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
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FlutterImageStack.providers(
                                                  providers: listIimages,
                                                  showTotalCount: true,
                                                  totalCount: 6,
                                                  itemRadius:
                                                      35, // Radius of each images
                                                  itemCount:
                                                      2, // Maximum number of images to be shown in stack
                                                  itemBorderWidth:
                                                      5, // Border width around the images
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Container(
                                                  height: 25,
                                                  width: 10.w,
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //card title
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Biologie',
                                                  style: kDisplayCardH1,
                                                ),
                                                IconButton(
                                                  icon: isToggled
                                                      ? const Icon(Icons
                                                          .favorite_border_outlined)
                                                      : const Icon(
                                                          Icons.favorite,
                                                          color:
                                                              Colors.redAccent,
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
                                                  size: 6,
                                                  padding: 0,
                                                  roundedEdges:
                                                      Radius.circular(10),
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
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FlutterImageStack.providers(
                                                  providers: listIimages,
                                                  showTotalCount: true,
                                                  totalCount: 6,
                                                  itemRadius:
                                                      35, // Radius of each images
                                                  itemCount:
                                                      2, // Maximum number of images to be shown in stack
                                                  itemBorderWidth:
                                                      5, // Border width around the images
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Container(
                                                  height: 25,
                                                  width: 10.w,
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Center(
                                                    child: Icon(Icons.add),
                                                  ),
                                                ),
                                              ],
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
                ),
                //Articles section
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Articles header
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
                      SizedBox(
                        height: 20.5.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
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
                      )
                    ],
                  ),
                ),
                //Recommandation section
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
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
                              children: [
                                VideoContent(
                                  videoAsset: 'images/profile.jpg',
                                  profileImage: 'images/profile.jpg',
                                  title:
                                      'The power of AI in the\nlife of student',
                                  videoInfo: 'Salomon Diei -  1 day ago',
                                ),
                                VideoContent(
                                  videoAsset: 'images/profile.jpg',
                                  profileImage: 'images/profile.jpg',
                                  title:
                                      'The power of AI in the\nlife of student',
                                  videoInfo: 'Salomon Diei -  1 day ago',
                                ),
                                VideoContent(
                                  videoAsset: 'images/profile.jpg',
                                  profileImage: 'images/profile.jpg',
                                  title:
                                      'The power of AI in the\nlife of student',
                                  videoInfo: 'Salomon Diei -  1 day ago',
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VideoContent extends StatelessWidget {
  String videoAsset;
  String profileImage;
  String title;
  String videoInfo;

  VideoContent({
    super.key,
    required this.videoAsset,
    required this.profileImage,
    required this.title,
    required this.videoInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 55.w,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // video card
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage(videoAsset),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            // video description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // video owner pic
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage(profileImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    // Display video information
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // video title
                        Text(title, style: kDisplayvideoH1),
                        // video upload date
                        Text(
                          videoInfo,
                          style: kDisplayArticleH6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildArticleSection extends StatelessWidget {
  String autor;
  String title;
  String description;
  String articleImage;

  BuildArticleSection(
      {super.key,
      required this.autor,
      required this.title,
      required this.description,
      required this.articleImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 60.w,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.borderColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            children: [
              // article info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(autor, style: kDisplayArticleH6),
                      Text(title, style: kDisplayArticleH1),
                    ],
                  ),
                  // image
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                        image: AssetImage(articleImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              // article description
              Text(
                description,
                style: kDisplayArticleH4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildHeader extends StatelessWidget {
  String username;
  BuildHeader({
    super.key,
    required this.username,
  });

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
