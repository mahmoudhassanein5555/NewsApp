import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/business/domain/entites/news_entitey.dart';
import 'package:news_app_new_version/features/business/domain/use_case/business_use_case.dart';
import 'package:news_app_new_version/features/business/presentation/view_model/home_cubit/business_news_state.dart';

class BusinessCubit extends Cubit<BusinessState> {
  BusinessCubit(this._businessUseCase) : super(BusinessInitial());
  late final BusinessUseCase _businessUseCase;

  Future<void> getBussinessNews() async {
    emit(BusinessLoading());
    final result = await _businessUseCase.call();
    if (result is ApiSuccess<NewsEntites>) {
      final businessNews = result.data.articles;
      emit(BusinessSuccess(businessNews!));
    } else if (result is ApiError<NewsEntites>) {
      emit(BusinessError(result.errorMessage));
    }
  }
}
