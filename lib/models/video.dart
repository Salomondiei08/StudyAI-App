class Video {

  String? thumnailUrl;
  String? title;
  String? url;
  String? channelTitle;
  String? publishedAt;

  Video(
      this.thumnailUrl,
      this.title,
      this.url,
      this.channelTitle,
      this.publishedAt);

  Video.fromJson(Map<String, dynamic> json) {
    json['channelTitle'].isEmpty
        ? channelTitle = ''
        : channelTitle = json['channelTitle'];
    json['publishedAt'].isEmpty
        ? publishedAt = ''
        : publishedAt = json['publishedAt'];
    json['thumbnails-high'].isEmpty
        ? thumnailUrl = ''
        : thumnailUrl = json['thumbnails-high'];
    json['title'].isEmpty ? title = '' : title = json['title'];
    json['videoUrl'].isEmpty ? url = '' : url = json['videoUrl'];
  }
}
