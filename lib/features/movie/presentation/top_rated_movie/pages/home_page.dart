import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/top_rated_movie/bloc/top_rated_movie_bloc.dart';
import 'package:clean_architecture_movie_app/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColor.bgColor,
        ),
        child: BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
          bloc: sl<TopRatedMovieBloc>()..add(GetTopRatedMovie()),
          builder: (context, state) {
            if (state.runtimeType == TopRatedMovieLoadingState) {
              return const Center(
                child: CupertinoActivityIndicator(
                  color: Colors.white,
                ),
              );
            } else if (state.runtimeType == TopRatedMovieSuccessState) {
              state as TopRatedMovieSuccessState;
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome\n19-03-2025',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            width: constraints.maxWidth / 2,
                            child: TextField(
                              style: const TextStyle(color: AppColor.primary),
                              cursorColor: AppColor.primary,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColor.primary,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: AppColor.primary,
                                    width: 2,
                                  ),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Search",
                                hintStyle: const TextStyle(
                                  color: AppColor.primary,
                                ),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: AppColor.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text.rich(
                          TextSpan(
                            text: "Watch List ",
                            style: TextStyle(
                              color: AppColor.secondary,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: "- 19-03-2025",
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        // SizedBox(
                        //   width: constraints.maxWidth,
                        //   height: 200,
                        //   child: ListView.builder(
                        //     itemBuilder: (context, index) {
                        //       return Container();
                        //     },
                        //   ),
                        // )
                      ],
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
