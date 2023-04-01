import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../model/songmodel.dart';
import '../nowplaying/nowplaying.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer>  with SingleTickerProviderStateMixin{
  late AnimationController
  iconController;
  bool isAnimated = false;
  AssetsAudioPlayer player = AssetsAudioPlayer();

  final box = SongBox.getInstance();
  
 
  @override
  void initState() {
    // List<Songs> dbSongs = box.values.toList();
    iconController =AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
      // int val = 0;
    return ValueListenableBuilder(
      valueListenable: NowPlaying.nowplayingindex,
      builder: (context,value,child) {
        return ValueListenableBuilder(  
            valueListenable: box.listenable(),
            builder: (context,allDbsongs,child) {
              List<Songs> all = allDbsongs.values.toList();
              //  val = NowPlaying.nowplayingindex.value;
              return Container(
               margin: EdgeInsets.only(left: 20),
                     width:double.infinity,
                     height: 60,
                    child: FloatingActionButton(
                      child:Expanded(
                        child: Row(
                           mainAxisAlignment: MainAxisAlignment.start ,
                          children: [
                            QueryArtworkWidget(id: all[value].id!, type: ArtworkType.AUDIO,
                            artworkFit: BoxFit.cover,
                            //  nullArtworkWidget: CircleAvatar(radius: 30,
                          
                            //           child: Image.asset
                            //           ('lib/assets/images/home-page-filipwolak-cirkiz-33311.webp',height:100, ),
                            //          ),
                            nullArtworkWidget: Image(image: AssetImage('lib/assets/images/home-page-filipwolak-cirkiz-33311.webp',),width: 50,),
                            ),
                             
                            // SizedBox(width: 40,),
                            Container(
                              width: 100,
                              child: Text(all[value].songname!,overflow: TextOverflow.ellipsis,)),
                               PlayerBuilder.isPlaying(
                                player: player,
                                builder: (context,isplaying){
                                 return IconButton(onPressed: () async{
                                   player.open(Audio.file(all[value-1].songurl!));
                                   AnimateIcon(player, value, all);
                                   setState(() {
                                     NowPlaying.nowplayingindex.value--;
                                   });  
                                   await player.stop();
                                 }, icon: Icon(Icons.fast_rewind,color: Colors.white,size: 25,),
                                                            
                                 );},
                               ),
                              //  SizedBox(width: 10,),
                                IconButton(
                      onPressed: () {
                       AnimateIcon(player,value,all);
                      },
                      icon: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: iconController,size: 25,color: Colors.white)),
                     IconButton(onPressed: (){}, icon: Icon(Icons.fast_forward,color: Colors.white,size: 25,))
                     
                          ],
                        ),
                      ) ,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){return NowPlaying();}));
                      },
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(16.0),)
                      
                    ),
              );
            }
          );
      }
    );
  }
   AnimateIcon(AssetsAudioPlayer player, int index , List<Songs>dbsongs){
  //  setState(() {
      isAnimated=!isAnimated;
      if(isAnimated){
        iconController.forward();
    //  ()async { 
      player.open(Audio.file(dbsongs[index].songurl!),showNotification: true   );
      // await player.stop();};
      // player.play();
     }else{
       iconController.reverse();
       player.pause();
       }
    // });
  }
}