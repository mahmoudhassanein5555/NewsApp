import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/business/domain/entites/news_entitey.dart';

abstract class TechRepo {
  Future<ApiResult<NewsEntites>> getBusinessNews();
}
