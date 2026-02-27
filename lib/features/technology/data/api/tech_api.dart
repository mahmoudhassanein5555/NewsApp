import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_new_version/core/constans/api_constant.dart';
import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/business/data/models/news_dto.dart';

class TechApi {
  Future<ApiResult<NewsDto>> getBusinessNews() async {
    try {
      Uri url = Uri.https(
        NewsApiConstants.baseUrl,
        NewsApiConstants.newsEndPointPath,
        {"sources": NewsApiConstants.sources, "apiKey": NewsApiConstants.apiKey},
      );
      var stringResponse = await http.get(url);
      if (stringResponse.statusCode >= 200 && stringResponse.statusCode < 300) {
        var json = jsonDecode(stringResponse.body);
        NewsDto businessDto = NewsDto.fromJson(json);
        return ApiSuccess<NewsDto>(businessDto);
      } else {
        return ApiError<NewsDto>("Server Error: ${stringResponse.statusCode}");
      }
    } catch (e) {
      return ApiError<NewsDto>(e.toString());
    }
  }
}

// https://newsapi.org
// /v2/top-headlines?
// sources = techcrunch &
// apiKey=7d9bd4a2102b408bbb205206a0019f9d
