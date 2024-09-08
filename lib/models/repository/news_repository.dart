import "dart:convert";

import "package:flutter/foundation.dart";
import "package:http/http.dart" as http;
import "package:news_app/models/news_channel_headlines_model.dart";

class NewsRepository {


Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi() async {

  String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=0688714009f74cacaefca3e171eeb7e8";

  final response = await http.get(Uri.parse(url));
  if (kDebugMode) {
    print(response.body);
  }

  if(response.statusCode == 200) {
    final body = jsonDecode(response.body);
return NewsChannelsHeadlinesModel.fromJson(body);
  }
  throw Exception("Error");
}





}