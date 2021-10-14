part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {

}
class characterloaded extends CharacterState{
  final List<Character> characters;
  characterloaded(this.characters);
}
class quotesloaded extends CharacterState{
  final List<Quote> quotes;

  quotesloaded(this.quotes);

}
