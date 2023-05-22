import 'package:flutter/material.dart';

class Article {
  String? title;
  String? summary;
  List<String>? authorsNamesList;
  String? link;

  Article(this.title, this.summary, this.authorsNamesList, this.link);

  Article.fromJson(Map<String, dynamic> json) {
    json['link'].isEmpty ? link = '' : link = json['link'];
    json['summary'].isEmpty ? summary = '' : summary = json['summary'];
    json['title'].isEmpty ? title = '' : title = json['title'];
    debugPrint(json['authorsNamesList'].toString());
    json['authorsNamesList'].isEmpty
        ? authorsNamesList = []
        : authorsNamesList = json['authorsNamesList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorsNamesList'] = authorsNamesList;
    data['link'] = link;
    data['summary'] = summary;
    data['title'] = title;
    return data;
  }
}
