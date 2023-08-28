class JokeResponse {
  final bool? error;
  final String? category;
  final String? type;
  final String? joke;
  final String? setup;
  final String? delivery;
  final Flags? flags;
  final int? id;
  final bool? safe;
  final String? lang;

  JokeResponse({
    this.error,
    this.category,
    this.type,
    this.joke,
    this.setup,
    this.delivery,
    this.flags,
    this.id,
    this.safe,
    this.lang,
  });

  JokeResponse.fromJson(Map<String, dynamic> json)
      : error = json['error'] as bool?,
        category = json['category'] as String?,
        type = json['type'] as String?,
        joke = json['joke'] as String?,
        setup = json['setup'] as String?,
        delivery = json['delivery'] as String?,
        flags = (json['flags'] as Map<String, dynamic>?) != null
            ? Flags.fromJson(json['flags'] as Map<String, dynamic>)
            : null,
        id = json['id'] as int?,
        safe = json['safe'] as bool?,
        lang = json['lang'] as String?;

  Map<String, dynamic> toJson() => {
        'error': error,
        'category': category,
        'type': type,
        'joke': joke,
        'setup': setup,
        'delivery': delivery,
        'flags': flags?.toJson(),
        'id': id,
        'safe': safe,
        'lang': lang
      };
}

class Flags {
  final bool? nsfw;
  final bool? religious;
  final bool? political;
  final bool? racist;
  final bool? sexist;
  final bool? explicit;

  Flags({
    this.nsfw,
    this.religious,
    this.political,
    this.racist,
    this.sexist,
    this.explicit,
  });

  Flags.fromJson(Map<String, dynamic> json)
      : nsfw = json['nsfw'] as bool?,
        religious = json['religious'] as bool?,
        political = json['political'] as bool?,
        racist = json['racist'] as bool?,
        sexist = json['sexist'] as bool?,
        explicit = json['explicit'] as bool?;

  Map<String, dynamic> toJson() => {
        'nsfw': nsfw,
        'religious': religious,
        'political': political,
        'racist': racist,
        'sexist': sexist,
        'explicit': explicit
      };
}
