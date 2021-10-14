import 'package:bloc_training/data/models/quote-model.dart';

import '../web_services/charcters-webservices.dart';
import 'package:bloc_training/data/models/charactar-model.dart';
class CharactersRepository {
 charcterWebServices CharactersWebServices;

  CharactersRepository(this.CharactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await CharactersWebServices.getalllcharacters();
    return characters.map((character) =>Character.fromJson(character)).toList();
  }
 Future<List<Quote>> getAllQuotes(String charname) async {
   final quotes= await CharactersWebServices.getallQuotes(charname);
   print('${quotes}hayyyyyyyyyyyyyyassdddddddddd');
   return quotes.map((quote) =>Quote.fromJson(quote)).toList();
 }
}