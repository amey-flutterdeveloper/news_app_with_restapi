import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'package:news_app_with_restapi/models/news_channel_headlines_model.dart';
class NewsRepository {


    Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
      String url = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=390c778c60994f28a40b2b3ce4b1e16f';
      final response =await http.get(Uri.parse(url));
      if (kDebugMode) {
        print(response.body);
      }

      if(response.statusCode == 200){
        final body = jsonDecode(response.body);
        return NewsChannelsHeadlinesModel.fromJson(body);

      }
      throw Exception('Error');
    }

}