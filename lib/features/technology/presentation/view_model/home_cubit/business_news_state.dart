import 'package:news_app_new_version/features/business/domain/entites/news_entitey.dart';

sealed class TechCubit {}

class TechLoading extends TechCubit {}

class TechInitial extends TechCubit {}

class TechSuccess extends TechCubit {
  final List<Articles> listOfNews;
  TechSuccess(this.listOfNews);
}

class TechError extends TechCubit {
  final String error;
  TechError(this.error);
}
