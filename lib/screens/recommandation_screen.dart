import 'package:flutter/material.dart';
import '../widgets/article_section.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/video_content.dart';

class RecommandationScreen extends StatefulWidget {
  const RecommandationScreen({super.key});

  @override
  State<RecommandationScreen> createState() => _RecommandationScreenState();
}

class _RecommandationScreenState extends State<RecommandationScreen> {
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
                  Text(
                    'see more',
                    style: kDisplaySeeMore,
                  )
                ],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.only(top:20.0),
              child: BuildArticleSection(
                autor: 'Michel adjetey - 2 days ago',
                title: 'How to learn \nFlutter in 2023',
                description:
                    "Major updates to graphics performance, web integration, developer productivity and security in Flutter 3.10",
                articleImage: 'images/profile.jpg',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top:20.0),
              child: BuildArticleSection(
                autor: 'Michel adjetey - 2 days ago',
                title: 'How to learn \nFlutter in 2023',
                description:
                    "Major updates to graphics performance, web integration, developer productivity and security in Flutter 3.10",
                articleImage: 'images/profile.jpg',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top:20.0),
              child: BuildArticleSection(
                autor: 'Michel adjetey - 2 days ago',
                title: 'How to learn \nFlutter in 2023',
                description:
                    "Major updates to graphics performance, web integration, developer productivity and security in Flutter 3.10",
                articleImage: 'images/profile.jpg',
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
