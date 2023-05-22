import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/video.dart';
import '../network/app_urls.dart';
import '../network/ko_exception.dart';

class VideoProvider with ChangeNotifier {
  // List of al lthe created docuuments
  List<Video> _allVideos = [];

  List<Video> get allVideos {
    return [..._allVideos];
  }

  Future<void> initVideo(String interests) async {
    if (_allVideos.isEmpty) {
      await fetchOnlineVideo(interests);
    }
  }

  Future<List<Video>> fetchOnlineVideo(String interests) async {
    try {
      final response = await get(Uri.parse("${AppUrl.getVideos}$interests"));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        debugPrint("--- Response Data for docs : $data");
        final List<Video> docList = [];
        for (dynamic videos in data) {
          final doc = Video.fromJson(videos);
          docList.add(doc);
        }
        _allVideos = docList;
        notifyListeners();

        return docList;
      } else {
        throw Exception('Could not parse response.');
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
}
