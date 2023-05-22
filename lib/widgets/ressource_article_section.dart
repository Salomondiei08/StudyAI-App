import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/constants.dart';

class BuildRessArticleSection extends StatelessWidget {
  final String autor;
  final String title;
  final String date;
  final String articleImage;

  const BuildRessArticleSection(
      {super.key,
      required this.autor,
      required this.date,
      required this.title,
      required this.articleImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0, left: 2, right: 15, bottom: 5),
      child: Container(
        width: 60.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/profile.jpg'),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 2.h,
                  ),
                  Text(
                    autor,
                    style: kDisplayArticleH4.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                ],
              ),
              // article info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      title,
                      style: kDisplayArticleH1.copyWith(
                        color: const Color(0xff27354B),
                      ),
                    ),
                  ),
                  // image
                  Expanded(
                    child: Container(
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
                  ),
                ],
              ),
              // article description
              Text(
                date,
                style: kDisplayArticleH4.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.5)),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
