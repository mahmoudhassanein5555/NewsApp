import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/general/domain/entites/news_entitey.dart';

abstract class GeneralNewsRepo {
  Future<ApiResult<NewsEntites>> getGeneralNews();
}
