class Pokemon {
  final int apiId;
  final String name;
  final List<String> types;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final String? portraitUrl;
  final bool isFavorite;

  const Pokemon({
    required this.apiId,
    required this.name,
    required this.types,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    this.portraitUrl,
    this.isFavorite = false,
  });

  Pokemon copyWith({
    String? name,
    List<String>? types,
    int? hp,
    int? attack,
    int? defense,
    int? specialAttack,
    int? specialDefense,
    int? speed,
    String? portraitUrl,
    bool? isFavorite,
  }) {
    return Pokemon(
      apiId: apiId,
      name: name ?? this.name,
      types: types ?? this.types,
      hp: hp ?? this.hp,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense,
      specialAttack: specialAttack ?? this.specialAttack,
      specialDefense: specialDefense ?? this.specialDefense,
      speed: speed ?? this.speed,
      portraitUrl: portraitUrl ?? this.portraitUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}