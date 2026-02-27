
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_version/core/widgets/news_card.dart';
import 'package:news_app_new_version/features/business/presentation/view_model/home_cubit/business_news_state.dart';
import 'package:news_app_new_version/features/technology/data/api/tech_api.dart';
import 'package:news_app_new_version/features/technology/data/repositories/newa_data_source/news_data_source_imp.dart';
import 'package:news_app_new_version/features/technology/data/repositories/news_repo/news_repo_imp.dart';
import 'package:news_app_new_version/features/technology/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/technology/domain/repositories/news_repo/news_repo.dart';
import 'package:news_app_new_version/features/technology/domain/use_case/business_use_case.dart';
import 'package:news_app_new_version/features/technology/presentation/view_model/home_cubit/business_news_cubit.dart';

class TechScreen extends StatefulWidget {
  const TechScreen({super.key});

  @override
  State<TechScreen> createState() => _TechScreenState();
}

class _TechScreenState extends State<TechScreen> {
  late final TechCubit _techCubit;
  @override
  void initState() {
    super.initState();
    TechApi businessApi = TechApi();
    TechDataSource techDataSource = TechDataSourceImp(businessApi);
    TechRepo repo = TechRepoImp(techDataSource);
    TechUseCase techUseCase = TechUseCase(repo);
    _techCubit = TechCubit(techUseCase);
    _techCubit.getBussinessNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TechCubit, BusinessState>(
        bloc: _techCubit,
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
