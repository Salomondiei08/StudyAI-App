import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/constants.dart';

class BuildArticleSection extends StatelessWidget {
  final String autor;
  final String title;
  final String description;
  final String articleImage;

  const BuildArticleSection(
      {super.key,
      required this.autor,
      required this.title,
      required this.description,
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
                    child: Text(title, style: kDisplayArticleH1),
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
                description,
                style: kDisplayArticleH4,
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
