import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_project/model/dbfunction.dart';
import 'package:my_project/model/playlist.dart';
import 'package:my_project/screens/miniplayer/miniplayer.dart';

// import 'package:my_project/screens/homescreen/homescreen.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //  final playlistsongbox = Playlistbox.getInstance();
    return Scaffold(
             backgroundColor: Color.fromARGB(255, 2, 31, 55),
          body: SafeArea(child: SingleChildScrollView(
            child: Column(
            
              children: [
                
                Container(
                decoration: new BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                height: 240,
                 child: Image.asset('lib/assets/images/100-best-rock-bands-of-the-2010s.jpg',fit: BoxFit.cover,),
                ),
                    Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Playlist',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
              ),
              // Icon(Icons.playlist_add,color: Colors.purple,size: 30,),
              IconButton(onPressed: (){ 
              showDialog(context:context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text('create Playlist'),
                   content: Form(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(labelText: 'playlist Nmae'),
                        
                      ),
                     
                    ],
                   )),
                   actions:<Widget> [
                    TextButton(onPressed:(){
                      Navigator.of(context).pop();
                    }, child: Text('cancel')),
                    TextButton(onPressed: (){
                      log("hiiiiijihutfbbggnf");
                      log(textEditingController.text);
                        createPlayList(textEditingController.text);
                    }, child: Text('Submit'))
                   ],
                );
              } );
              }, icon: Icon(Icons.playlist_add,size: 30,color: Colors.purple,))
            ],
                    ),
            ValueListenableBuilder(valueListenable: Playlistbox.getInstance().listenable(),
             builder: (context,playlistBox,child){
               final playlistlist =playlistBox.values.toList();
              return playlistlist.isEmpty? Text('playlist is empty,create one'):
              ListView.builder(itemBuilder: (context,index){
               
                //  return ListTile(
                //   leading: CircleAvatar(),
                //   title:Text(playlistlist[index].playlistName!),
                //   trailing: Text('abhiram'),
                  
                //  );
                return Container(child: Text(playlistBox.name),);
              },
              itemCount:playlistlist.length,);
             }) 
            // Placeholder( ),
              
             
            ],),
          )),
          // floatingActionButton: MiniPlayer(),
        );
      
  }
   
}