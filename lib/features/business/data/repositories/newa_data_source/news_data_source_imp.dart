import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/business/data/api/business_api.dart';
import 'package:news_app_new_version/features/business/domain/entites/news_entitey.dart';
import 'package:news_app_new_version/features/business/domain/repositories/newa_data_source/news_data_source.dart';

class BusinessDataSourceImp implements BusinessDataSource {
  BusinessDataSourceImp(this._businessApi);
  final BusinessApi _businessApi;
  @override
  Future<ApiResult<NewsEntites>> getBusinessNews() async {
    final result = await _businessApi.getBusinessNews();
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
