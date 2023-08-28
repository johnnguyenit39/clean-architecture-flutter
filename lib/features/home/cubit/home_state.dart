part of 'home_cubit.dart';

class HomeState extends Equatable {
  final LoadStatus? onSubmitJoke;
  final String? selectedLanguage;
  final String? selectedCategory;

  final List<String>? selectedBlackList;
  final String? searchKeyword;

  const HomeState({
    this.onSubmitJoke = LoadStatus.initial,
    this.selectedLanguage,
    this.selectedCategory,
    this.selectedBlackList,
    this.searchKeyword,
  });

  HomeState copyWith({
    LoadStatus? onSubmitJoke,
    String? selectedLanguage,
    String? selectedCategory,
    List<String>? selectedBlackList,
    String? searchKeyword,
  }) {
    return HomeState(
      onSubmitJoke: onSubmitJoke ?? this.onSubmitJoke,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedBlackList: selectedBlackList ?? this.selectedBlackList,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchKeyword: searchKeyword ?? this.searchKeyword,
    );
  }

  @override
  List<Object?> get props => [
        onSubmitJoke,
        selectedLanguage,
        selectedBlackList,
        selectedCategory,
        searchKeyword
      ];
}
