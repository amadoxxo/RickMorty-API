import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rick_morty/models/character_response.dart';

class CharacterServices extends ChangeNotifier {
  final String _baseUrl = 'rickandmortyapi.com';
  List<Character> onDisplayCharacter = [];

  CharacterServices() {
    getOnDisplayServices();
  }

  getOnDisplayServices() async {
    var url = Uri.https(_baseUrl, '/api/character');

    final response = await http.get(url);
    final decodeData = RickMortyResponse.fromJson(response.body);

    onDisplayCharacter = decodeData.results;

    notifyListeners();
  }
}
