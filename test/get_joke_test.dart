import 'package:flutter_test/flutter_test.dart';
import 'package:getjoke/core/di/di.dart';
import 'package:getjoke/core/env/app_env.dart';
import 'package:getjoke/core/network/http_request/api_service/api_service.dart';
import 'package:getjoke/features/home/domain/use_cases/submit_form_interactor.dart';

void main() async {
  await setupDi();
  ApiService().initialLizeNetworkSetting();
  AppConfig.setup(Environment.dev);

  //Unit testing
  test('Getting the any joke from the API', () async {
    final interactor = SubmitFormInteractor();
    final response = await interactor.execute();
    expect(response?.error, false);
  });
  final interactor = SubmitFormInteractor();

  test('Getting the joke from the API with specific category', () async {
    final selectedCategories = ['Programming', 'Christmas'];
    final response = await interactor
        .execute(queryParams: {'categories': 'Programming,Christmas'});
    expect(selectedCategories.contains(response?.category), true);
  });

  test('Getting the joke from the API with specific language', () async {
    const selectedCategories = 'es';
    final response =
        await interactor.execute(queryParams: {'lang': selectedCategories});
    expect(response?.lang, selectedCategories);
  });

  test('Getting the joke from the API with specific keyword', () async {
    const keyword = 'people';
    final response =
        await interactor.execute(queryParams: {'contains': keyword});
    if (response?.joke != null) {
      expect(response?.joke?.toLowerCase().contains(keyword), true);
    } else {
      expect(response?.setup?.toLowerCase().contains(keyword), true);
    }
  });
}
