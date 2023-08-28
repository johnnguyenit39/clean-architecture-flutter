import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getjoke/core/enum/enum.dart';
import 'package:getjoke/core/routes/router_table.dart';
import 'package:getjoke/features/home/domain/use_cases/submit_form_interactor.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  static HomeCubit blocFromContext({BuildContext? context}) {
    if (context != null) {
      return BlocProvider.of<HomeCubit>(context);
    } else {
      return BlocProvider.of<HomeCubit>(rootNavigatorKey.currentContext!);
    }
  }

  final searchController = TextEditingController();

  final _submitFormInteractor = SubmitFormInteractor();

  void submitJokeForm() async {
    emit(state.copyWith(onSubmitJoke: LoadStatus.loading));
    await _submitFormInteractor.execute(generateQueryParams());
    emit(state.copyWith(onSubmitJoke: LoadStatus.success));
  }

  void updateJokeForm(
      {String? language,
      String? category,
      List<String>? blackList,
      String? searchText}) {
    emit(state.copyWith(
      selectedLanguage: language,
      selectedCategory: category,
      selectedBlackList: blackList,
      searchKeyword: searchController.text,
    ));
  }

  Map<String, dynamic>? generateQueryParams() {
    Map<String, dynamic>? queryParams = {};
    if (state.selectedLanguage != null) {
      queryParams.addAll({'lang': state.selectedLanguage});
    }
    if (state.selectedCategory != null) {
      // path = '$path${state.selectedLanguage}';
    }
    if (state.selectedBlackList != null) {}

    if (searchController.text.isNotEmpty) {}

    return queryParams;
  }
}
