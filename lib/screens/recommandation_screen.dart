import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/articles.dart';
import '../models/video.dart';
import '../providers/articles_provider.dart';
import '../providers/video_provider.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/ressource_article_section.dart';
import '../widgets/video_content.dart';

class RecommandationScreen extends StatefulWidget {
  const RecommandationScreen({super.key});

  @override
  State<RecommandationScreen> createState() => _RecommandationScreenState();
}

class _RecommandationScreenState extends State<RecommandationScreen> {
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
      appBar: AppBar(
        title: Text(
          "Ressources",
          style: kDisplayH1,
        ),
        elevation: 0,
        backgroundColor: AppTheme.ligthGray,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            Column(
              children: [
                // section header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Videos',
                      style: kDisplayH1,
                    ),
                    Text(
                      'see more',
                      style: kDisplaySeeMore,
                    )
                  ],
                ),
                SizedBox(
                  height: 27.h,
                  width: 50.h,
                  child: // container body
                      Padding(
                    padding: const EdgeInsets.only(top: 14),
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
                              return Text("Error: ${snapshot.error}");
                            } else if (!snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  List<Video> itemList = videos.allVideos;
                                  return VideoContent(
                                      url: itemList[index].url!,
                                      videoAsset: itemList[index].thumnailUrl!,
                                      profileImage: 'images/video.jpeg',
                                      title: itemList[index].title!,
                                      videoInfo: itemList[index].publishedAt!);
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Articles and Classes',
                    style: kDisplayH1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                          return Text("Error: ${snapshot.error}");
                        } else if (!snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              List<Article> itemList = articles.allArticles;
                              return ArticleWidgetLarge(
                                url: itemList[index].link!,
                                autor: itemList[index].authorsNamesList![0],
                                title: itemList[index].title ?? '',
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text('An Error occured'));
                        }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
