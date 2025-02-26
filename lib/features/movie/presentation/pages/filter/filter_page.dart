import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/filter_movie/bloc/filter_movie_bloc.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/custom_back_button.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/widgets/small_text.dart';
import 'package:clean_architecture_movie_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FilterMovieBloc, FilterMovieState>(
        bloc: sl<FilterMovieBloc>(),
        builder: (context, state) {
          return Container(
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
                              content: SizedBox(
                                height: 200,
                                width: 200,
                                child: YearPicker(
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime.now(),
                                  selectedDate: DateTime.now(),
                                  onChanged: (value) {
                                    // context.read<FilterMovieBloc>().add(GetFilterMovie(language: , year: year, page: page))
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          side: const BorderSide(
                              color: AppColor.primary, width: 1),
                        ),
                        backgroundColor: AppColor.secondary,
                      ),
                      label: SmallText(
                        text: "Date",
                        fontsize: 14,
                        color: AppColor.primary,
                      ),
                      icon: Icon(
                        Icons.date_range_outlined,
                        color: AppColor.primary,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: DropdownMenu(
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
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: "zh", label: "China"),
                          DropdownMenuEntry(value: "id", label: "Indonesia"),
                          DropdownMenuEntry(value: "en", label: "English"),
                          DropdownMenuEntry(value: "th", label: "Thailand"),
                          DropdownMenuEntry(value: "ja", label: "Japanese"),
                        ],
                        onSelected: (value) {
                          
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
