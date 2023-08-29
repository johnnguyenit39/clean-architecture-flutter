import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getjoke/common/ui_components/index.dart';
import 'package:getjoke/features/home/cubit/home_cubit.dart';
import 'package:getjoke/features/home/data/mock_data/data.dart';

class JokeSubmitForm extends StatefulWidget {
  const JokeSubmitForm({super.key});

  @override
  State<JokeSubmitForm> createState() => _JokeSubmitFormState();
}

class _JokeSubmitFormState extends State<JokeSubmitForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _categoryFormKey =
      GlobalKey<FormBuilderState>();
  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = HomeCubit.blocFromContext(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderDropdown(
              initialValue: 'en',
              onChanged: (value) {
                _homeCubit.updateJokeForm(language: value);
              },
              name: 'Language',
              items: languages
                  .map((language) => DropdownMenuItem(
                        value: language.languageCode,
                        child: Text(
                          '${language.languageCode} - ${language.language}',
                        ),
                      ))
                  .toList(),
              decoration:
                  const InputDecoration(labelText: 'Language (Optional)'),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.selectedCustom != current.selectedCustom,
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      children: [
                        const CText(
                          text: 'Custom Category:',
                        ),
                        Checkbox(
                          value: state.selectedCustom,
                          onChanged: (newValue) {
                            _categoryFormKey.currentState?.reset();
                            _homeCubit.updateJokeForm(
                                selectedCustom: newValue, categories: []);
                          },
                        ),
                      ],
                    ),
                    if (state.selectedCustom == true) ...[
                      FormBuilder(
                        key: _categoryFormKey,
                        child: FormBuilderCheckboxGroup(
                          autovalidateMode: AutovalidateMode.always,
                          name: 'flags',
                          options: categories,
                          validator: (value) {
                            if (state.selectedCustom == true && value == null ||
                                value!.isEmpty) {
                              return 'You must select at least one Category';
                            }
                            return null;
                          },
                          onChanged: (list) {
                            _homeCubit.updateJokeForm(
                                categories: list?.map((e) => '$e').toList());
                          },
                          decoration: const InputDecoration(
                              labelText: 'Categories  (Optional)'),
                        ),
                      ),
                    ]
                  ],
                );
              },
            ),
            FormBuilderCheckboxGroup(
              name: 'flags',
              options: blackList,
              onChanged: (list) {
                _homeCubit.updateJokeForm(
                    blackList: list?.map((e) => '$e').toList());
              },
              decoration: const InputDecoration(
                  labelText: 'Blacklist Flags (Optional)'),
            ),
            const SizedBox(height: 12),
            rowTitle(title: 'Response Format:', content: 'Json'),
            rowTitle(title: 'Joke Type:', content: 'Single'),
            rowTitle(title: 'Amount of joke:', content: '1'),
            FormBuilderTextField(
              controller:
                  HomeCubit.blocFromContext(context: context).searchController,
              name: 'searchString',
              decoration:
                  const InputDecoration(labelText: 'Search String (Optional)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isValidated()) {
                  HomeCubit.blocFromContext(context: context).submitJokeForm();
                }
              },
              child: const Text('Submit Joke'),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowTitle({String? title, String? content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CText(
            text: '$title',
          ),
          CText(
            text: '$content',
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }

  bool isValidated() {
    if (_homeCubit.state.selectedCustom == true &&
        _categoryFormKey.currentState != null &&
        _categoryFormKey.currentState!.validate()) {
      return true;
    }
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
