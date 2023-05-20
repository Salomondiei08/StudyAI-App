import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/constants.dart';

class VideoContent extends StatelessWidget {
  final String videoAsset;
  final String profileImage;
  final String title;
  final String videoInfo;

  const VideoContent({
    super.key,
    required this.videoAsset,
    required this.profileImage,
    required this.title,
    required this.videoInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 30.0, bottom: 5),
      child: Container(
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
                        Text(title, style: kDisplayvideoH1),
                        // video upload date
                        Text(
                          videoInfo,
                          style: kDisplayvideoH6,
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
