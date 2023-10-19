
import 'package:news_app/models/category_news_model.dart';
import 'package:news_app/models/news_channel_headline_model.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsViewModel{

  final _repo = NewsRepository();

  Future<NewsChannelsHeadlineModel> fetchNewsChannelHeadlinesApi(String channelName) async{
    final response = await _repo.fetchNewsChannelHeadlinesApi(channelName);
    return response ;
  }

  Future<CategoryNewsModel> fetchCategoryNewsApi(String category) async{
    final response = await _repo.fetchCategoryNewsApi(category);
    return response ;
  }
}