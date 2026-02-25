import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/home/domain/entites/business.dart';
import 'package:news_app_new_version/features/home/domain/repositories/news_repo/news_repo.dart';

class BusinessUseCase {
  BusinessUseCase(this._repo);
  final BusinessRepo _repo;

  Future<ApiResult<BusinessEntites>> call() async =>
      await _repo.getBusinessNews();
}
