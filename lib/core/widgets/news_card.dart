import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_new_version/core/constans/app_colors.dart';
import 'package:news_app_new_version/core/constans/app_strings.dart';
import 'package:news_app_new_version/core/widgets/web_view.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, this.state});
  final state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.listOfNews.length,
      itemBuilder: (BuildContext context, int index) {
        final image = state.listOfNews[index].urlToImage;
        final news = state.listOfNews[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => NewsWebView(url: news.url!)),
            );
          },
          child: Card(
            // color: AppColors.greyColor,
            // color: Theme.of(context).cardTheme.color,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 5),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: image ?? AppStrings.dummyImage,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                                color: AppColors.circleIndicatorColor,
                              ),
                          errorWidget: (context, url, error) =>
                              Image.asset(AppStrings.dummyImagee),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(child: Text(news.title!, )),
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    news.description!.isNotEmpty
                        ? news.description!
                        : "Click Here To Show details",
                        // style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
