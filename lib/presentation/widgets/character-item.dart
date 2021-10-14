import 'package:bloc_training/constant/strings.dart';
import 'package:bloc_training/data/models/charactar-model.dart';
import 'package:flutter/material.dart';
class CharacterItem extends StatelessWidget {
 final Character character;
  const CharacterItem({@required this.character}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color:Colors.white ,
        borderRadius: BorderRadius.circular(8),
      ),

      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(characterDetailsScreen,arguments: character);
        },
        child: GridTile(
          footer:Container(
            width: double.infinity,
            color: Colors.black54,
            alignment: Alignment.center ,
            height: 40,
            child: Text('${character.name}',style: TextStyle(
                height: 1.3,
              fontSize: 20
                ,color: Colors.white
            ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
                textAlign: TextAlign.center
            ),
          ) ,
          child: Hero(
             tag: character.charId,
            child: Container(

              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(16)
              ),

              child: character.img.isNotEmpty?FadeInImage.assetNetwork(

                  placeholder: 'assets/images/loading9.gif', image: character.img,fit: BoxFit.cover,):Image.asset('assets/images/loading9.gif',fit: BoxFit.fitWidth),
            ),
          ),
        ),
      ),

    );
  }
}
