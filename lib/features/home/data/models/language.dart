class Language {
  final String? languageCode;
  final String? language;

  Language({
    this.languageCode,
    this.language,
  });

  Language.fromJson(Map<String, dynamic> json)
      : languageCode = json['languageCode'] as String?,
        language = json['Language'] as String?;

  Map<String, dynamic> toJson() =>
      {'languageCode': languageCode, 'Language': language};
}
