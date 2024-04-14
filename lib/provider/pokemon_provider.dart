import 'package:flutter/material.dart';
import 'package:pokidex_19660/model/Pokemon_model.dart';
import 'package:pokidex_19660/service/pokemon_service.dart';

class PokemonProvider extends ChangeNotifier {

    final _service = PokemonService();
    bool isLoading = false;
    List<Pokemon> _pokemon = [];
    List<Pokemon> get pokemon => _pokemon;

    Future<void> getAllTodos() async{

    isLoading = true;
    notifyListeners();
    final response = await _service.getAllPokemon();
    _pokemon = response;
    isLoading = false;
    notifyListeners();
  }
}