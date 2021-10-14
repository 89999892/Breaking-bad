import 'package:bloc_training/constant/strings.dart';
import 'package:bloc_training/data/repository/character-repository.dart';
import 'package:bloc_training/data/web_services/charcters-webservices.dart';
import 'package:bloc_training/presentation/screens/character-details-screen.dart';
import 'package:bloc_training/presentation/screens/characters-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/character_cubit.dart';
import 'constant/strings.dart';

class Approute {
  CharactersRepository charactersRepository;
  CharacterCubit characterCubit;

  Approute() {
    charactersRepository = CharactersRepository(charcterWebServices());
    characterCubit = CharacterCubit(charactersRepository);
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => characterCubit,
                  child: CharactersScreen(),
                ));
      case characterDetailsScreen:
        final character = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      CharacterCubit(charactersRepository),
              child: CharacterDetailsScreen(character: character,),
                ));
    }
  }
}
