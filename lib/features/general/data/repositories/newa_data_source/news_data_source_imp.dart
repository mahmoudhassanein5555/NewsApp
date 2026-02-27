import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/general/data/api/general_api.dart';
import 'package:news_app_new_version/features/general/domain/entites/news_entitey.dart';
import 'package:news_app_new_version/features/general/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/business/data/api/business_api.dart';
import 'package:news_app_new_version/features/business/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/technology/data/api/tech_api.dart';
import 'package:news_app_new_version/features/technology/domain/repositories/newa_data_source/news_data_source.dart';

class GeneralNewsDataSourceImp implements GeneralNewsDataSource {
  GeneralNewsDataSourceImp(this._businessApi);
  final GeneralNewsApi _businessApi;
  @override
  Future<ApiResult<NewsEntites>> getGeneralNews() async {
    final result = await _businessApi.getGeneralNews();
    switch (result) {
      case ApiSuccess():
        final businessDto = result.data;
        final businessEntity = businessDto.toEntity();
        return ApiSuccess<NewsEntites>(businessEntity);
      case ApiError():
        return ApiError<NewsEntites>(result.errorMessage);
    }
  }
}
