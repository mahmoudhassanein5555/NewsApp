import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_version/core/network/api_resutl.dart';
import 'package:news_app_new_version/features/home/domain/entites/business.dart';
import 'package:news_app_new_version/features/home/domain/use_case/business_use_case.dart';
import 'package:news_app_new_version/features/home/presentation/view_model/home_cubit/business_news_state.dart';

class BusinessCubit extends Cubit<BusinessState> {
  BusinessCubit(this._businessUseCase) : super(BusinessInitial());
  late final BusinessUseCase _businessUseCase;

  Future<void> getBussinessNews() async {
    emit(BusinessLoading());
    final result = await _businessUseCase.call();
    if (result is ApiSuccess<BusinessEntites>) {
      final businessNews = result.data.articles;
      emit(BusinessSuccess(businessNews!));
    } else if (result is ApiError<BusinessEntites>) {
      emit(BusinessError(result.errorMessage));
    }
  }
}
