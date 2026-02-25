import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_version/core/constans/app_colors.dart';
import 'package:news_app_new_version/core/constans/app_strings.dart';
import 'package:news_app_new_version/features/home/data/api/business_api.dart';
import 'package:news_app_new_version/features/home/data/repositories/newa_data_source/news_data_source_imp.dart';
import 'package:news_app_new_version/features/home/data/repositories/news_repo/news_repo_imp.dart';
import 'package:news_app_new_version/features/home/domain/repositories/newa_data_source/news_data_source.dart';
import 'package:news_app_new_version/features/home/domain/repositories/news_repo/news_repo.dart';
import 'package:news_app_new_version/features/home/domain/use_case/business_use_case.dart';
import 'package:news_app_new_version/features/home/presentation/view_model/home_cubit/business_news_cubit.dart';
import 'package:news_app_new_version/features/home/presentation/view_model/home_cubit/business_news_state.dart';

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
            return ListView.builder(
              itemCount: state.listOfNews.length,
              itemBuilder: (BuildContext context, int index) {
                final image = state.listOfNews[index].urlToImage;
                final news = state.listOfNews[index];
                return Card(
                  // elevation: 15,
                  color: AppColors.greyColor,
                  child: ListTile(
                    leading: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 200,
                      width: 100,
                      child: CachedNetworkImage(
                        imageUrl: image ?? AppStrings.dummyImage,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Image.asset(AppStrings.dummyImagee),
                      ),
                    ),
                    title: Text(news.description!),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
