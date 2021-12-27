class PokemonDetailsModel {
  String name;
  int height;
  int weight;
  String sprite;

  PokemonDetailsModel({required this.name, required this.height, required this.weight, required this.sprite});

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsModel(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      sprite: json['sprites']['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'height': height,
      'weight': weight,
      'sprite': sprite,
    };
  }
}
