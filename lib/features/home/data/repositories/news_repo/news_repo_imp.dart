import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/home/domain/entites/business.dart';
import 'package:news_app_new_version/features/home/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/home/domain/repositories/news_repo/news_repo.dart';

class BusinessRepoImp implements BusinessRepo {
  BusinessRepoImp(this._businessDataSource);
  final BusinessDataSource _businessDataSource;
  @override
  Future<ApiResult<BusinessEntites>> getBusinessNews() =>
      _businessDataSource.getBusinessNews();
}
