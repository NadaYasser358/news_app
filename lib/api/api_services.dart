import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_consts.dart';
import 'package:news/screens/catigories/models/news_model.dart';
import 'package:news/sources/data/sources_model.dart';

class ApiServices {


  static Future<NewsModel> getNews(String sourceId)async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.newsEndPoint,
        {'apikey': ApiConsts.apiKey, 'sources': sourceId});
    var responce=await http.get(url);
    String body=responce.body;
    var json=jsonDecode(body);
    return NewsModel.fromJson(json);
  }

  static Future<NewsModel> searchNews(String query)async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.newsEndPoint,
        {'apikey': ApiConsts.apiKey, 'q': query});
    var responce=await http.get(url);
    String body=responce.body;
    var json=jsonDecode(body);
    return NewsModel.fromJson(json);
  }


}
