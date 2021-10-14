
import 'package:bloc/bloc.dart';
import 'package:bloc_training/data/models/charactar-model.dart';
import 'package:bloc_training/data/models/quote-model.dart';
import 'package:bloc_training/data/repository/character-repository.dart';
import 'package:meta/meta.dart';
part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;
 List<Character> characters=[];
  CharacterCubit(this.charactersRepository) : super(CharacterInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(characterloaded(characters));
      this.characters = characters;
    });

    return characters;
  }
  void getAllCharacterQuotes(String charname){
    charactersRepository.getAllQuotes(charname).then((quote) => emit(quotesloaded(quote)));
  }

}
