import 'package:bloc_training/data/models/charactar-model.dart';
import 'package:bloc_training/presentation/widgets/character-info-list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({@required this.character});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: CustomScrollView(
        slivers: [
          BuildSliverAppbar(),
          SliverList(delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 0, 8),
              color: Colors.blueGrey,
              child:characterInfoList(character: character),
              ),

          ]
          ))

        ],
      ),
    );
  }

  Widget BuildSliverAppbar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      backgroundColor: Colors.blueGrey,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,


        title: Transform.translate(
          offset: Offset(0,13),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 40,
            color: Colors.black54,
            child: Text(

              '${character.nickname}',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
