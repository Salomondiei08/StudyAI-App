import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../network/app_urls.dart';
import '../network/ko_exception.dart';

class PDFProvider with ChangeNotifier {
  String? thumbnailLink;
  String? fileSummary;

  Future<void> initSummary() async {
    if (fileSummary == null) {
      await getSummary();
    }
  }

  Future<void> getSummary() async {
    try {
      final response =
          await get(Uri.parse("${AppUrl.summarize}$thumbnailLink"));
      debugPrint(thumbnailLink);
      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        debugPrint("--- Response Data for docs : $data");
        fileSummary = data;
        notifyListeners();
      } else {
        throw Exception(
            'Could not parse response. Status code ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw KoException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }

  void getFlashCard(String fileUrkLink) {}
  // void getQuizQuestions(String fileLink) async {
  //   try {
  //     final response = await get(Uri.parse("${AppUrl.getQuiz}$fileLink"));
  //     if (response.statusCode == 200) {
  //       final dynamic data = json.decode(response.body);
  //       debugPrint("--- Response Data for docs : $data");
  //   final List<Video> docList = [];
  //       for (dynamic videos in data) {
  //         final doc = Video.fromJson(videos);
  //         docList.add(doc);
  //       }
  //     }
  //       _allVideos = docList;
  //       notifyListeners();
  //   } on DioError catch (e) {
  //     if (e.response != null && e.response!.statusCode != null) {
  //       throw KoException(
  //         statusCode: e.response!.statusCode!,
  //         message: e.response!.data.toString(),
  //       );
  //     } else {
  //       throw Exception(e.message);
  //     }
  //   }
  // }
}
