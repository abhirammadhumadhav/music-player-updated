import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_project/model/songmodel.dart';
import 'package:my_project/screens/homescreen/homescreen.dart';
import 'package:my_project/screens/miniplayer/miniplayer.dart';
import 'package:my_project/screens/nowplaying/nowplaying.dart';
import 'package:on_audio_query/on_audio_query.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class searchscreen extends StatefulWidget {
  const searchscreen({super.key});

  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  final _searchController = TextEditingController();
   List<Songs> SongDisplay = SongBox.getInstance().values.toList();
  
    Widget check(){
    return Expanded(
      child:SongDisplay.isNotEmpty? 
      ListView.builder(itemBuilder: 
      (context,index){
        return 
          
           ListTile(
             leading: CircleAvatar(child: QueryArtworkWidget(id: SongDisplay[index].id!,
             artworkFit: BoxFit.cover,
              type: ArtworkType.AUDIO,
              nullArtworkWidget:Image.asset('lib/assets/images/27-1424976662-hny.jpg') ,
              ),
              ),
             title:Text(SongDisplay[index].songname!,style: TextStyle(color: Colors.white),) ,
          );
       
      },itemCount: SongDisplay.length,
      )
      : Text('No Match Found',style: TextStyle(color: Colors.white),)
    );
   }
   Widget SearchField(){
      return TextFormField(decoration: 
            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

            hintText: 'What do you want to listen to?',
            hintStyle: TextStyle(color: Colors.grey)),
            onChanged: (value){
              SearchSong(value);
            },
            );
           
   }
   void SearchSong(String value){
       setState(() {
         SongDisplay = SongBox.getInstance().values.toList().where((element) => element.songname!.toLowerCase().contains(value.toLowerCase())).toList();
         
       });
   }
   void searchclear(){
     _searchController.clear();
   }
   
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 2, 31, 55),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Search',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white ),), 
                      
                    ],
                  ),
                ),
                SearchField(),
                check(),
              
               ],
        ),
      )),
      // floatingActionButton: MiniPlayer(),
    );
   }
}