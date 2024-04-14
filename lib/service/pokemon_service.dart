import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokidex_19660/model/Pokemon_model.dart';

class PokemonService {
  Future<List<Pokemon>> getAllPokemon() async {
    var uri =
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
    var response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final users = data['pokemon'].map<Pokemon>((e) {
        return Pokemon.FromJSON(e);
      }).toList();
      return users;
    }

    return [];
  }
}
