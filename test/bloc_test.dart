import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getjoke/core/enum/enum.dart';
import 'package:getjoke/features/home/cubit/home_cubit.dart';

void main() async {
  group('Home Cubit', () async {
    final homeCubit = HomeCubit();
    homeCubit.init();

    test('Initial state is correct', () {
      expect(homeCubit.state.selectedCustom, true);
    });

    blocTest<HomeCubit, HomeState>(
      'Emits [JokeLoading, JokeLoaded] when fetchJoke is called successfully',
      build: () => HomeCubit(),
      act: (bloc) => bloc.submitJokeForm(),
      expect: () => const [
        HomeState(onSubmitJoke: LoadStatus.loading),
        HomeState(onSubmitJoke: LoadStatus.success),
      ],
    );
  });
}
