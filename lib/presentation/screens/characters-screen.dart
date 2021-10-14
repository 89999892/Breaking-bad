import 'dart:ui';

import 'package:bloc_training/bloc/character_cubit.dart';
import 'package:bloc_training/data/models/charactar-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/character-item.dart';


class CharactersScreen extends StatefulWidget {

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  bool _isSearching=false;
  List<Character> allcharacters;
  List<Character> searchedCharacterList=[];
  TextEditingController searchedtxtcontroller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();

  }
  List<Widget> _buildAppbarAction(){
    if(_isSearching){
      return [
        IconButton(icon: Icon(Icons.clear,color: Colors.black,), onPressed:(){
          _stopSearching();
          Navigator.of(context).pop();
          })
      ];
    }else{
      return [
        IconButton(icon:Icon(Icons.search,color: Colors.black), onPressed: (){
          _startSearching();

        })
      ];
    }
  }
  Widget _buildsearchField(){
    return TextField(
      maxLines: 1,controller: searchedtxtcontroller,
      style:TextStyle(color: Colors.blueGrey[600],) ,
      decoration: InputDecoration(
          filled: true,fillColor: Colors.white,
        hintText: 'Find a character...',
        hintStyle: TextStyle(color: Colors.blueGrey[400],),

      ),
      onChanged: (searchedCharacter){
        searchedCharacterList=allcharacters.where((character) => character.name.toLowerCase().startsWith(searchedCharacter)).toList();
        setState(() {});
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        actions: _buildAppbarAction(),
        title: _isSearching?_buildsearchField():Text('All actors',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,

      ),
      body: BlocBuilder<CharacterCubit,CharacterState>(
          builder:(context,state){
            if(state is characterloaded){
              allcharacters=(state).characters;
              return buildloadedlistwidget() ;
            }else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.cyanAccent,
                ),
              );
            }
            //ToDo showingloadingwidget
          }
      ) );

  }

  Widget buildloadedlistwidget() {
    return Container(
      color: Colors.blueGrey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildCharactersGrid(),
              SizedBox(height: 30,)
            ],
          
      ),
        ),
    );
  }

 Widget buildCharactersGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2/3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,

    ), shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero, itemBuilder: (ctx,index){
      return CharacterItem(character:searchedtxtcontroller.text.isEmpty? allcharacters[index]:searchedCharacterList[index]);
    },itemCount: searchedtxtcontroller.text.isEmpty?allcharacters.length:searchedCharacterList.length,);
 }

  void _stopSearching() {
    setState(() {
      _isSearching=false;
      searchedtxtcontroller.clear();
    });
  }

  void _startSearching() {
    ModalRoute.of(context).addLocalHistoryEntry(LocalHistoryEntry(onRemove:_stopSearching ));
    setState(() {
      _isSearching=true;

    });
  }
}
