import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getjoke/features/home/data/models/language.dart';

const categories = [
  'Any',
  'Programming',
  'Misc',
  'Dark',
  'Pun',
  'Spooky',
  'Christmas',
];

List<Language> languages = [
  Language(languageCode: 'cs', language: 'Czech'),
  Language(languageCode: 'de', language: 'German'),
  Language(languageCode: 'en', language: 'English'),
  Language(languageCode: 'es', language: 'Spanish'),
  Language(languageCode: 'fr', language: 'French'),
  Language(languageCode: 'pt', language: 'Portuguese'),
];

List<FormBuilderFieldOption> blackList = const [
  FormBuilderFieldOption(value: 'nsfw', child: Text('NSFW')),
  FormBuilderFieldOption(value: 'religious', child: Text('Religious')),
  FormBuilderFieldOption(value: 'political', child: Text('Political')),
  FormBuilderFieldOption(value: 'racist', child: Text('Racist')),
  FormBuilderFieldOption(value: 'sexist', child: Text('Sexist')),
  FormBuilderFieldOption(value: 'explicit', child: Text('Explicit')),
];
