import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/home/domain/entites/business.dart';

abstract class BusinessRepo {
  Future<ApiResult<BusinessEntites>> getBusinessNews();
}
