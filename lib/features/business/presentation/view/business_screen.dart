import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_version/core/constans/app_colors.dart';
import 'package:news_app_new_version/core/constans/app_strings.dart';
import 'package:news_app_new_version/core/widgets/news_card.dart';
import 'package:news_app_new_version/core/widgets/web_view.dart';
import 'package:news_app_new_version/features/business/data/api/business_api.dart';
import 'package:news_app_new_version/features/business/data/repositories/newa_data_source/news_data_source_imp.dart';
import 'package:news_app_new_version/features/business/data/repositories/news_repo/news_repo_imp.dart';
import 'package:news_app_new_version/features/business/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/business/domain/repositories/news_repo/news_repo.dart';
import 'package:news_app_new_version/features/business/domain/use_case/business_use_case.dart';
import 'package:news_app_new_version/features/business/presentation/view_model/home_cubit/business_news_cubit.dart';
import 'package:news_app_new_version/features/business/presentation/view_model/home_cubit/business_news_state.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  late final BusinessCubit _businessCubit;
  @override
  void initState() {
    super.initState();
    BusinessApi businessApi = BusinessApi();
    BusinessDataSource businessDataSource = BusinessDataSourceImp(businessApi);
    BusinessRepo repo = BusinessRepoImp(businessDataSource);
    BusinessUseCase businessUseCase = BusinessUseCase(repo);
    _businessCubit = BusinessCubit(businessUseCase);
    _businessCubit.getBussinessNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BusinessCubit, BusinessState>(
        bloc: _businessCubit,
        builder: (context, state) {
          if (state is BusinessLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.indigo),
            );
          }
          if (state is BusinessSuccess) {
            return NewsCard(state: state);
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
