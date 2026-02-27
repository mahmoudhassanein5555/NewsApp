import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/business/domain/entites/news_entitey.dart';
import 'package:news_app_new_version/features/business/domain/repositories/news_repo/news_repo.dart';

class BusinessUseCase {
  BusinessUseCase(this._repo);
  final BusinessRepo _repo;

  Future<ApiResult<NewsEntites>> call() async => await _repo.getBusinessNews();
}
