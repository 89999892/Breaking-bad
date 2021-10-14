import 'package:bloc_training/bloc/character_cubit.dart';
import 'package:bloc_training/data/models/charactar-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class characterInfoList extends StatelessWidget {
  final Character character;

  const characterInfoList({@required this.character});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context)
        .getAllCharacterQuotes(character.name);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buidCharacterInfo('Job : ', character.occupation.join(' / ')),
          buildDivider(340),
          buidCharacterInfo('seasons : ', character.appearance.join(' / ')),
          buildDivider(300),
          buidCharacterInfo('status : ', character.status),
          buildDivider(320),
          buidCharacterInfo('Actor/Actress : ', character.portrayed),
          buildDivider(250),
          builBlocBuilder(),
          SizedBox(
            height: 200,
          )
        ]);
  }

  Widget buildDivider(double EndIndent) {
    return Divider(
      height: 30,
      thickness: 3,
      endIndent: EndIndent,
      color: Colors.cyanAccent,
    );
  }

  Widget buidCharacterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
            text: title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ]));
  }

  Widget builBlocBuilder() {
    return BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
      if (state is quotesloaded) {
        var Quotes = (state).quotes;
        //  var randomindex=Random().nextInt(Quotes.length);

        return Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Text(' sayings',style: TextStyle(
                color: Colors.white,fontSize: 30
              ),),
            ),
            Container(
              height: 600,
              width: 600,
              child: ListView.builder(
                  itemCount: Quotes.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("-  ' "+Quotes[index].quote+" '",style: TextStyle(color: Colors.cyan,fontSize: 20),),
                    );
                  }),

            )
          ],
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.cyanAccent,
          ),
        );
      }
    });
  }
}
