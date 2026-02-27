import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/general/domain/entites/news_entitey.dart';
import 'package:news_app_new_version/features/general/domain/repositories/news_repo/news_repo.dart';
import 'package:news_app_new_version/features/business/domain/repositories/news_repo/news_repo.dart';
import 'package:news_app_new_version/features/technology/domain/repositories/news_repo/news_repo.dart';

class GeneralNewsUseCase {
  GeneralNewsUseCase(this._repo);
  final GeneralNewsRepo _repo;

  Future<ApiResult<NewsEntites>> call() async => await _repo.getGeneralNews();
}
