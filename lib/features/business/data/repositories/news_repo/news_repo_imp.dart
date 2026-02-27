import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/business/domain/entites/news_entitey.dart';
import 'package:news_app_new_version/features/business/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/business/domain/repositories/news_repo/news_repo.dart';

class BusinessRepoImp implements BusinessRepo {
  BusinessRepoImp(this._businessDataSource);
  final BusinessDataSource _businessDataSource;
  @override
  Future<ApiResult<NewsEntites>> getBusinessNews() =>
      _businessDataSource.getBusinessNews();
}
