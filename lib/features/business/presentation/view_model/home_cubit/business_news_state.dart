import 'package:news_app_new_version/features/business/domain/entites/news_entitey.dart';

sealed class BusinessState {}

class BusinessLoading extends BusinessState {}

class BusinessInitial extends BusinessState {}

class BusinessSuccess extends BusinessState {
  final List<Articles> listOfNews;
  BusinessSuccess(this.listOfNews);
}

class BusinessError extends BusinessState {
  final String error;
  BusinessError(this.error);
}
