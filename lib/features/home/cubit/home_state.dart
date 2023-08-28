part of 'home_cubit.dart';

class HomeState extends Equatable {
  final LoadStatus? onSubmitJoke;
  final bool? selectedCustom;
  final String? selectedLanguage;
  final List<String>? selectedCategoryList;
  final List<String>? selectedBlackList;
  final String? searchKeyword;

  const HomeState({
    this.selectedCustom = false,
    this.onSubmitJoke = LoadStatus.initial,
    this.selectedLanguage,
    this.selectedCategoryList,
    this.selectedBlackList,
    this.searchKeyword,
  });

  HomeState copyWith({
    LoadStatus? onSubmitJoke,
    String? selectedLanguage,
    bool? selectedCustom,
    List<String>? selectedCategoryList,
    List<String>? selectedBlackList,
    String? searchKeyword,
  }) {
    return HomeState(
      onSubmitJoke: onSubmitJoke ?? this.onSubmitJoke,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedBlackList: selectedBlackList ?? this.selectedBlackList,
      selectedCategoryList: selectedCategoryList ?? this.selectedCategoryList,
      searchKeyword: searchKeyword ?? this.searchKeyword,
      selectedCustom: selectedCustom ?? this.selectedCustom,
    );
  }

  @override
  List<Object?> get props => [
        onSubmitJoke,
        selectedLanguage,
        selectedBlackList,
        selectedCategoryList,
        searchKeyword,
        selectedCustom,
      ];
}
