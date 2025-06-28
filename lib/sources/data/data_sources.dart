import 'dart:convert';

import '../../api/api_consts.dart';
import 'sources_model.dart';
import 'package:http/http.dart' as http;


class DataSources{
  Future<SourcesModel> getSources(String categoryId)async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.sourcesEndPoint,
        {'apikey': ApiConsts.apiKey, 'category': categoryId});
    var responce=await http.get(url);
    String body=responce.body;
    var json=jsonDecode(body);
    print('ok function data source');
    return SourcesModel.fromJson(json);

  }
}