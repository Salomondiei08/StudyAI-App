import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:study_ai/models/video.dart';
import 'package:study_ai/network/supa_base_client.dart';
import 'package:study_ai/providers/articles_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/articles.dart';
import '../providers/video_provider.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';

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

  late ArticleProvider articles;
  late VideoProvider videos;

  @override
  void initState() {
    articles = Provider.of<ArticleProvider>(context, listen: false);
    videos = Provider.of<VideoProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ligthGray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // header
                const BuildHeader(
                  username: client.auth.currentUser!.email!.split('@').first,
                ),
                //Flashcards section
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
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
                            ],
                          ),
                        ),
                      ),
                      //Articles section
                      SizedBox(
                        height: 60.h,
                        child: Column(
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
                                child: FutureBuilder(
                                  future: articles.initArticles('Maths'),
                                  builder: (ctx, snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                      case ConnectionState.waiting:
                                        return Center(
                                            child: CircularProgressIndicator(
                                          color: AppTheme.darkBlue,
                                        ));
                                      default:
                                        if (snapshot.hasError) {
                                          return Text(
                                              "Error: ${snapshot.error}");
                                        } else if (!snapshot.hasData) {
                                          return ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              List<Article> itemList =
                                                  articles.allArticles;
                                              return BuildArticleSection(
                                                  url: itemList[index].link!,
                                                  autor: itemList[index]
                                                      .authorsNamesList![0],
                                                  title:
                                                      itemList[index].title ??
                                                          '',
                                                  description:
                                                      itemList[index].summary ??
                                                          '');
                                            },
                                          );
                                        } else {
                                          return const Center(
                                              child: Text('An Error occured'));
                                        }
                                    }
                                  },
                                ),
                              ),
                            ),

                            //Recommandation section
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, bottom: 2),
                                child: Column(
                                  children: [
                                    // container header
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                      child: FutureBuilder(
                                        future: videos.initVideo('Maths'),
                                        builder: (ctx, snapshot) {
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.none:
                                            case ConnectionState.waiting:
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: AppTheme.darkBlue,
                                              ));
                                            default:
                                              if (snapshot.hasError) {
                                                return Text(
                                                    "Error: ${snapshot.error}");
                                              } else if (!snapshot.hasData) {
                                                return SizedBox(
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) {
                                                      List<Video> itemList =
                                                          videos.allVideos;
                                                      return VideoContent(
                                                          url: itemList[index]
                                                              .url!,
                                                          videoAsset:
                                                              itemList[index]
                                                                  .thumnailUrl!,
                                                          profileImage:
                                                              'images/video.jpeg',
                                                          title: itemList[index]
                                                              .title!,
                                                          videoInfo: itemList[
                                                                  index]
                                                              .publishedAt!);
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return const Center(
                                                    child: Text(
                                                        'An Error occured'));
                                              }
                                          }
                                        },
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
  final String videoAsset;
  final String profileImage;
  final String title;
  final String videoInfo;
  final String url;

  const VideoContent({
    super.key,
    required this.videoAsset,
    required this.profileImage,
    required this.title,
    required this.videoInfo,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0, left: 30.0, bottom: 5),
        child: Container(
          height: 25.h,
          width: 75.w,
          decoration: BoxDecoration(
            color: Colors.white,
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
                        image: NetworkImage(videoAsset),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: AssetImage(profileImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      // Display video information
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // video title
                          Text(
                            title.substring(0, 12),
                            style: kDisplayvideoH1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // video upload date
                          Text(
                            videoInfo,
                            style: kDisplayvideoH6,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}

class BuildArticleSection extends StatelessWidget {
  final String autor;
  final String title;
  final String description;
  final String url;

  const BuildArticleSection(
      {super.key,
      required this.autor,
      required this.title,
      required this.url,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0, left: 2, right: 15, bottom: 5),
      child: GestureDetector(
        onTap: () async {
          await launchUrl(Uri.parse(url));
        },
        child: Container(
          width: 60.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: Offset(0.0, 3.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(autor, style: kDisplayArticleH6),
                // article info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        title,
                        style: kDisplayArticleH1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    // image
                    Expanded(
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: const DecorationImage(
                            image: AssetImage('images/articles.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // article description
                Text(
                  description,
                  style: kDisplayArticleH4,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
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
