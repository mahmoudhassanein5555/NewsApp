import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_version/core/widgets/news_card.dart';
import 'package:news_app_new_version/features/general/data/api/general_api.dart';
import 'package:news_app_new_version/features/general/data/repositories/newa_data_source/news_data_source_imp.dart';
import 'package:news_app_new_version/features/general/data/repositories/news_repo/news_repo_imp.dart';
import 'package:news_app_new_version/features/general/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/general/domain/repositories/news_repo/news_repo.dart';
import 'package:news_app_new_version/features/general/domain/use_case/general_use_case.dart';
import 'package:news_app_new_version/features/general/presentation/view_model/home_cubit/general_news_cubit.dart';
import 'package:news_app_new_version/features/general/presentation/view_model/home_cubit/general_news_state.dart';
class GeneralNews extends StatefulWidget {
  const GeneralNews({super.key});

  @override
  State<GeneralNews> createState() => _GeneralNewsState();
}

class _GeneralNewsState extends State<GeneralNews> {
  late final GeneralNewsCubit _generalNewsCubit;
  @override
  void initState() {
    super.initState();
    GeneralNewsApi businessApi = GeneralNewsApi();
    GeneralNewsDataSource techDataSource = GeneralNewsDataSourceImp(
      businessApi,
    );
    GeneralNewsRepo repo = GeneralNewsRepoImp(techDataSource);
    GeneralNewsUseCase techUseCase = GeneralNewsUseCase(repo);
    _generalNewsCubit = GeneralNewsCubit(techUseCase);
    _generalNewsCubit.getGeneralNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GeneralNewsCubit, GeneralNewStates>(
        bloc: _generalNewsCubit,
        builder: (context, state) {
          if (state is GeneralNewsLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.indigo),
            );
          }
          if (state is GeneralNewsSuccess) {
            return NewsCard(state: state);
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
