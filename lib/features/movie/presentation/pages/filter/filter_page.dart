import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/filter_movie/bloc/filter_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_back_button.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppTheme.defPadding,
        decoration: const BoxDecoration(
          gradient: AppColor.bgColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomBackButton(
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Filter Movie',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: const SmallText(
                            text: "Choose Date",
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          content:
                              BlocBuilder<FilterMovieBloc, FilterMovieState>(
                            buildWhen: (previous, current) {
                              return current is FilterMovieSuccessState;
                            },
                            builder: (context, state) {
                              if (state.runtimeType ==
                                  FilterMovieSuccessState) {
                                state as FilterMovieSuccessState;
                                return SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: YearPicker(
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                    selectedDate: DateTime(
                                      int.parse(
                                          context.read<FilterMovieBloc>().year),
                                    ),
                                    currentDate: DateTime(
                                      int.parse(
                                          context.read<FilterMovieBloc>().year),
                                    ),
                                    onChanged: (value) {
                                      context.read<FilterMovieBloc>().add(
                                            GetYearMovieEvent(
                                              year: value.year.toString(),
                                            ),
                                          );
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      side: const BorderSide(color: AppColor.primary, width: 1),
                    ),
                    backgroundColor: AppColor.secondary,
                  ),
                  label: BlocBuilder<FilterMovieBloc, FilterMovieState>(
                    builder: (context, state) {
                      return SmallText(
                        text: context.read<FilterMovieBloc>().year,
                        color: AppColor.primary,
                      );
                    },
                  ),
                  icon: Icon(
                    Icons.date_range_outlined,
                    color: AppColor.primary,
                  ),
                ),
                BlocBuilder<FilterMovieBloc, FilterMovieState>(
                  builder: (context, state) {
                    return DropdownMenu(
                      hintText: "Language",
                      inputDecorationTheme: InputDecorationTheme(
                        hintStyle: TextStyle(
                          color: AppColor.primary,
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: AppColor.secondary,
                        suffixIconColor: AppColor.primary,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: AppColor.primary, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: AppColor.primary, width: 1),
                        ),
                      ),
                      textStyle: const TextStyle(color: AppColor.primary),
                      menuStyle: const MenuStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColor.secondary,
                        ),
                      ),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: "zh", label: "China"),
                        DropdownMenuEntry(value: "id", label: "Indonesia"),
                        DropdownMenuEntry(value: "en", label: "English"),
                        DropdownMenuEntry(value: "th", label: "Thailand"),
                        DropdownMenuEntry(value: "ja", label: "Japanese"),
                      ],
                      initialSelection:
                          context.read<FilterMovieBloc>().language,
                      onSelected: (value) {
                        context.read<FilterMovieBloc>().add(
                              GetLanguageMovieEvent(
                                language: value.toString(),
                              ),
                            );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: BlocBuilder<FilterMovieBloc, FilterMovieState>(
                bloc: context.read<FilterMovieBloc>()
                  ..add(
                    GetFilterMovieEvent(
                      language: context.read<FilterMovieBloc>().language,
                      year: context.read<FilterMovieBloc>().year,
                      page: "1",
                    ),
                  ),
                builder: (context, state) {
                  if (state.runtimeType == FilterMovieLoadingState) {
                    return const Center(
                      child: CupertinoActivityIndicator(
                        color: AppColor.primary,
                      ),
                    );
                  } else if (state.runtimeType == FilterMovieSuccessState) {
                    state as FilterMovieSuccessState;
                    return Column(
                      children: [
                        SmallText(
                          text: "Results : ${state.films.totalResults}",
                          color: AppColor.primary,
                          fontsize: 14,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.films.results!.length,
                            itemBuilder: (context, index) {
                              return Text(
                                  state.films.results![index].title.toString());
                            },
                          ),
                        )
                      ],
                    );
                  } else if (state.runtimeType == FilterMovieErrorState) {
                    print("error");
                  }
                  return SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
