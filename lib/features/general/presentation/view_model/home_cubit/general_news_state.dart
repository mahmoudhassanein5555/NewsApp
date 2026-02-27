
import 'package:news_app_new_version/features/general/domain/entites/news_entitey.dart';

sealed class GeneralNewStates {}

class GeneralNewsLoading extends GeneralNewStates {}

class GeneralNewsInitial extends GeneralNewStates {}

class GeneralNewsSuccess extends GeneralNewStates {
  final List<Articles> listOfNews;
  GeneralNewsSuccess(this.listOfNews);
}

class GeneralNewsError extends GeneralNewStates {
  final String error;
  GeneralNewsError(this.error);
}
