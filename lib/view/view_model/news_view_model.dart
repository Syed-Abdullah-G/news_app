

import 'package:news_app/models/categories_news_model.dart';
import 'package:news_app/models/news_channel_headlines_model.dart';
import 'package:news_app/models/repository/news_repository.dart';

class NewsViewModel {


final _rep = NewsRepository();

Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(String channelName) async {

final response = await _rep.fetchNewsChannelHeadlinesApi(channelName);
return response; 

}

Future<CategoryNewsModel> fetchCategoriesNewsApi(String category) async {

final response = await _rep.fetchCategoriesNewsApi(category);
return response; 

}



}