import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/general/domain/entites/news_entitey.dart';
import 'package:news_app_new_version/features/general/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/general/domain/repositories/news_repo/news_repo.dart';
import 'package:news_app_new_version/features/business/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/business/domain/repositories/news_repo/news_repo.dart';
import 'package:news_app_new_version/features/technology/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/technology/domain/repositories/news_repo/news_repo.dart';

class GeneralNewsRepoImp implements GeneralNewsRepo {
  GeneralNewsRepoImp(this._businessDataSource);
  final GeneralNewsDataSource _businessDataSource;
  @override
  Future<ApiResult<NewsEntites>> getGeneralNews() =>
      _businessDataSource.getGeneralNews();
}
