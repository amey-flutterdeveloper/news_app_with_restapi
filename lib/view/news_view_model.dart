import 'package:news_app_with_restapi/models/news_channel_headlines_model.dart';
import 'package:news_app_with_restapi/repository/news_repository.dart';

class NewsViewModel {
    final _repo = NewsRepository();



    Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
      final response =await _repo.fetchNewsChannelHeadlinesApi();
      return response;
    }
}