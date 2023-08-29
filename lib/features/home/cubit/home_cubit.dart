import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getjoke/core/enum/enum.dart';
import 'package:getjoke/core/routes/router_table.dart';
import 'package:getjoke/features/home/domain/use_cases/submit_form_interactor.dart';
import 'package:getjoke/mixin/dialog_mixin.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with DialogsMixin {
  HomeCubit() : super(const HomeState());
  static HomeCubit blocFromContext({BuildContext? context}) {
    if (context != null) {
      return BlocProvider.of<HomeCubit>(context);
    } else if (rootNavigatorKey.currentContext != null) {
      return BlocProvider.of<HomeCubit>(rootNavigatorKey.currentContext!);
    } else {
      return HomeCubit();
    }
  }

  final searchController = TextEditingController();

  final _submitFormInteractor = SubmitFormInteractor();

  void init() {
    emit(state.copyWith(selectedCustom: true));
  }

  void submitJokeForm() async {
    EasyLoading.show(status: 'loading...');
    emit(state.copyWith(onSubmitJoke: LoadStatus.loading));
    final response =
        await _submitFormInteractor.execute(queryParams: generateQueryParams());
    showAlertDialog(
      content: response?.joke != null && response?.joke != ''
          ? response?.joke.toString()
          : 'Setup: ${response?.setup} - Delivery: ${response?.delivery}',
    );
    EasyLoading.dismiss();
    emit(state.copyWith(
        onSubmitJoke:
            response?.error == true ? LoadStatus.failure : LoadStatus.success));
  }

  void updateJokeForm(
      {String? language,
      List<String>? categories,
      List<String>? blackList,
      bool? selectedCustom,
      String? searchText}) {
    emit(state.copyWith(
      selectedLanguage: language,
      selectedCategoryList: categories,
      selectedBlackList: blackList,
      searchKeyword: searchController.text,
      selectedCustom: selectedCustom,
    ));
  }

  Map<String, dynamic>? generateQueryParams() {
    Map<String, dynamic>? queryParams = {};
    if (state.selectedLanguage != null) {
      queryParams.addAll({'lang': state.selectedLanguage});
    }
    if (state.selectedCategoryList != null && state.selectedCustom == true) {
      final categories = state.selectedCategoryList?.join(',');
      queryParams.addAll({'categories': categories});
    }
    if (state.selectedBlackList != null) {
      final blackList = state.selectedBlackList?.join(',');
      queryParams.addAll({'blacklistFlags': blackList});
    }

    if (searchController.text.isNotEmpty) {
      queryParams.addAll({'contains': searchController.text});
    }

    return queryParams;
  }
}
