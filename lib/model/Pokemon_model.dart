class Pokemon {
  final int id;
  final String number;
  final String name;
  final List<String> type;
  final String imageURI, weaknesses;
  final String height, weight, spawntime;
  // ignore: non_constant_identifier_names
  String next_evolution = "Maxed Out", prev_evolution = "Just Hatched";

  void setNextEvolution(String k) {
    next_evolution = k;
  }

  void setPrevEvolution(String k) {
    prev_evolution = k;
  }

  Pokemon({
    required this.id,
    required this.number,
    required this.name,
    required this.type,
    required this.imageURI,
    required this.height,
    required this.weight,
    required this.spawntime,
    required this.weaknesses,
  });

  // ignore: non_constant_identifier_names
  factory Pokemon.FromJSON(Map<String, dynamic> e) {
    var k = Pokemon(
      id: e['id'],
      number: e['num'],
      name: e['name'],
      type: List<String>.from(e['type']),
      imageURI: e['img'],
      height: e['height'],
      weight: e['weight'],
      spawntime: e['spawn_time'],
      weaknesses: List<String>.from(e['weaknesses']).join(", "),
    );

    if (e.containsKey("next_evolution")) {
      List<String> p = List<String>.from(e["next_evolution"].map((obj) => obj['name'].toString()));
      k.setNextEvolution(p.join(", "));
    }

        if (e.containsKey("prev_evolution")) {
      List<String> p = List<String>.from(e["prev_evolution"].map((obj) => obj['name'].toString()));
      k.setPrevEvolution(p.join(", "));
    }

    return k;
  }
}
