import 'package:flutter/material.dart';
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
            FormBuilderDropdown(
              name: 'Category',
              onChanged: (value) {
                _homeCubit.updateJokeForm(category: value);
              },
              items: categories
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ))
                  .toList(),
              decoration:
                  const InputDecoration(labelText: 'Joke Category (Optional)'),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: const [
                      CText(
                        text: 'Response Format:',
                      ),
                      CText(
                        text: 'Json',
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      CText(
                        text: 'Joke Type:',
                      ),
                      CText(
                        text: 'Single',
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ],
              ),
            ),
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
                if (_formKey.currentState!.validate()) {
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
}
