import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/general/domain/entites/news_entitey.dart';
import 'package:news_app_new_version/features/general/domain/use_case/general_use_case.dart';
import 'package:news_app_new_version/features/general/presentation/view_model/home_cubit/general_news_state.dart';

class GeneralNewsCubit extends Cubit<GeneralNewStates> {
  GeneralNewsCubit(this._generalNewsUseCase) : super(GeneralNewsInitial());
  late final GeneralNewsUseCase _generalNewsUseCase;

  Future<void> getGeneralNews() async {
    emit(GeneralNewsLoading());
    final result = await _generalNewsUseCase.call();
    if (result is ApiSuccess<NewsEntites>) {
      final generalNews = result.data.articles;
      emit(GeneralNewsSuccess(generalNews!));
    } else if (result is ApiError<NewsEntites>) {
      emit(GeneralNewsError(result.errorMessage));
    }
  }
}
