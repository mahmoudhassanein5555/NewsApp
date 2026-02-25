import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_new_version/core/constans/api_constant.dart';
import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/home/data/model/business_model.dart';

class BusinessApi {
  Future<ApiResult<BusinessDto>> getBusinessNews() async {
    try {
      Uri url = Uri.https(
        NewsApiConstants.baseUrl,
        NewsApiConstants.businessEndPointPath,
        {
          "country": NewsApiConstants.country,
          "category": NewsApiConstants.category,
          "apiKey": NewsApiConstants.apiKey,
        },
      );
      var stringResponse = await http.get(url);
      if (stringResponse.statusCode >= 200 && stringResponse.statusCode < 300) {
        var json = jsonDecode(stringResponse.body);
        BusinessDto businessDto = BusinessDto.fromJson(json);
        return ApiSuccess<BusinessDto>(businessDto);
      } else {
        return ApiError<BusinessDto>(
          "Server Error: ${stringResponse.statusCode}",
        );
      }
    } catch (e) {
      return ApiError<BusinessDto>(e.toString());
    }
  }
}
