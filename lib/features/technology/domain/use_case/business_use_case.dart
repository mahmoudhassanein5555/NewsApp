import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/business/domain/entites/news_entitey.dart';
import 'package:news_app_new_version/features/business/domain/repositories/news_repo/news_repo.dart';
import 'package:news_app_new_version/features/technology/domain/repositories/news_repo/news_repo.dart';

class TechUseCase {
  TechUseCase(this._repo);
  final TechRepo _repo;

  Future<ApiResult<NewsEntites>> call() async => await _repo.getBusinessNews();
}
