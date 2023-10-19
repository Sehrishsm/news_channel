import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/category_news_model.dart';
import 'package:news_app/models/news_channel_headline_model.dart';

class NewsRepository{

  Future<NewsChannelsHeadlineModel> fetchNewsChannelHeadlinesApi(String channelName)async{

    String url = 'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=d897e9b086274fc49b022f8bdaffa7f8';

    final response = await http.get(Uri.parse(url));
   if (kDebugMode) {
     print(response.body);
   }
    if(response.statusCode == 200){

      final body = jsonDecode(response.body);
        return NewsChannelsHeadlineModel.fromJson(body);

    }
    throw Exception('Error');
}

  Future<CategoryNewsModel> fetchCategoryNewsApi(String category)async{

    String url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=d897e9b086274fc49b022f8bdaffa7f8';

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if(response.statusCode == 200){

      final body = jsonDecode(response.body);
      return CategoryNewsModel.fromJson(body);

    }
    throw Exception('Error');
  }
}