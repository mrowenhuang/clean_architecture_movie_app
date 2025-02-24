import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/search_movie/search_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/search_field.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/small_text.dart';
import 'package:clean_architecture_movie_app/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final TextEditingController searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(gradient: AppColor.bgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const SmallText(
                    text: "Back",
                    color: AppColor.primary,
                  ),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                    color: AppColor.primary,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    backgroundColor: AppColor.secondary,
                    shape: const StadiumBorder(),
                  ),
                ),
                const Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 280,
                height: 40,
                child: SearchField(
                  textEditingController: searchCont,
                  onChange: (value) {
                    context.read<SearchMovieBloc>().add(
                          GetSearchMovie(keyword: value),
                        );
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            const SmallText(
              text: 'Total Results : 200',
              fontWeight: FontWeight.bold,
              color: AppColor.primary,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
                bloc: context.read<SearchMovieBloc>(),
                builder: (context, state) {
                  if (state.runtimeType == SearchMovieInitial) {
                    return const Center(
                      child: SmallText(
                        text: "Try Searching",
                        color: AppColor.secondary,
                        fontWeight: FontWeight.bold,
                        fontsize: 14,
                      ),
                    );
                  } else if (state.runtimeType == SearchMovieLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ),
                    );
                  } else if (state.runtimeType == SearchMovieSuccesState) {
                    state as SearchMovieSuccesState;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.films.length,
                      itemBuilder: (context, index) {
                        var data = state.films[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            height: 140,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                    height: 120,
                                    padding: const EdgeInsets.only(
                                      left: 100,
                                      top: 10,
                                      bottom: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColor.secondary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 300,
                                              child: SmallText(
                                                text: data.title.toString(),
                                                color: AppColor.primary,
                                                fontsize: 14,
                                                align: TextAlign.left,
                                              ),
                                            ),
                                            SmallText(
                                              text: data.originalLanguage
                                                  .toString(),
                                              color: AppColor.primary,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          data.overview.toString(),
                                          maxLines: 4,
                                          textAlign: TextAlign.justify,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                        const Spacer(),
                                        SmallText(
                                          text: data.releaseDate.toString(),
                                          fontsize: 11,
                                          color: AppColor.primary,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://image.tmdb.org/t/p/w780${data.posterPath}",
                                      height: 130,
                                      width: 80,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) {
                                        return const Center(
                                          child: CupertinoActivityIndicator(
                                            color: AppColor.primary,
                                          ),
                                        );
                                      },
                                      errorListener: (value) {},
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 3,
                                  right: 3,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppColor.primary,
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 10,
                                            offset: Offset(-1, 5),
                                            color: AppColor.shadow)
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.bookmark_add_outlined,
                                      color: AppColor.secondary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
