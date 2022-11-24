class Pokemon {
  Pokemon({required this.id, required this.name, required this.img});

  final int id;
  final String name;
  final String img;

  static Pokemon fromJson(Map<String, dynamic> json) {
    return Pokemon(
        id: json['id'],
        name: json['name'],
        img: json['img'],
    );
  }
}