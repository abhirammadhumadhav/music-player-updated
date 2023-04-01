import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_project/model/dbfunction.dart';
import 'package:my_project/model/likedSongs.dart';
import 'package:my_project/model/songmodel.dart';
import 'package:my_project/screens/likedsongs/likedsongs.dart';
import 'package:my_project/screens/splashscreen/splashscreen.dart';
import 'package:on_audio_query/on_audio_query.dart';

class NowPlaying extends StatefulWidget {
   NowPlaying({super.key});
     static int? indexNotifier = 0;
     
     
     static ValueNotifier<int> nowplayingindex = ValueNotifier<int>(indexNotifier!);   
  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> with SingleTickerProviderStateMixin{

    late AnimationController
    iconController;
    late List<Songs> dbSongs;
    bool isRepeat = false;
    bool isplaying = false;
    bool isAnimated = false;
    bool showPlay = true;
    bool showPause = false;
    final box = SongBox.getInstance();
  
AssetsAudioPlayer player = AssetsAudioPlayer();
// double _songposition=0;
  
@override
  void initState() {
    // TODO: implement initState
     iconController =AnimationController(vsync: this, duration: Duration(milliseconds: 100));
   
    dbSongs = box.values.toList();
    
    super.initState(); 
    // setState(() {});  
  }
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width  = MediaQuery.of(context).size.width;

    return ValueListenableBuilder(
      valueListenable: NowPlaying.nowplayingindex,
      builder: (context, value, child) 
      {
        return ValueListenableBuilder<Box<Songs>>(
      valueListenable:box.listenable(),
      builder:((context,allSongs,child){
        List<Songs> allDbSongs = allSongs.values.toList();
       
        // log(allDbSongs[value].songname!);
      
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 31, 55),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
              SizedBox(
                width: 50,
              ),
              Text(
                'PLAYING SUGGESTED SONG',style: TextStyle(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: 70,
          ),
          QueryArtworkWidget(id: allDbSongs[value].id! , type: ArtworkType.AUDIO,
          artworkWidth:200 ,
          artworkHeight: 200,
          artworkFit: BoxFit.cover ,
        artworkBorder: BorderRadius.circular(15),

          nullArtworkWidget: Image.asset('lib/assets/images/home-page-filipwolak-cirkiz-33311.webp',height: 200,width: 200, fit: BoxFit.cover,),),
          
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    allDbSongs[value].songname!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20, color: Colors.red),
                    
                   
                  ),
                  Text(allDbSongs[value].artist!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              //  SizedBox(width: 20,),
              IconButton(onPressed: () {
                LikedSongs fav = LikedSongs(
                  songname: allDbSongs[value].songname!,
                 artist: allDbSongs[value].artist!,
                  duration: int.parse(allDbSongs[value].duration!),
                  songurl: allDbSongs[value].songurl,
                   id: allDbSongs[value].id!,
                   );
                   updatedlikedsongs(fav);
                   LikedScreen.likedscreenindex.value = value;
                  //  setState(() {
                  //    value;
                  //  });
                  //  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  //   return LikedScreen();
                  //  }));
                  // Color likedorNot(value);
                  // bool likedorNot == true?Colors.black:Colors.green;
                  
              }, icon: Icon(Icons.favorite_border,color: Colors.green,)),
  
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.playlist_add,
                    color: Colors.purple,
                  ))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          // LinearProgressIndicator(value: _songposition,backgroundColor: Colors.purple),
          Container(
            padding: EdgeInsets.only(left: 30,right: 30),
            width: double.infinity,
            child: PlayerBuilder.realtimePlayingInfos(player: player, builder:(context,RealtimePlayingInfos){
              final duration = RealtimePlayingInfos.current!.audio.duration;
              final position = RealtimePlayingInfos.currentPosition;
              return ProgressBar(progress: position,
              progressBarColor: Colors.purple,
              timeLabelTextStyle: TextStyle(color: Colors.white),
              onSeek: (duration) async{
                await player.seek(duration);
              },
              // onDragUpdate: ThumbDragDetails(duration),
               total:duration);
            }),
          ),

          SizedBox(
            height: 130,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                      setState(() {
                     
                      });
                  },
                  icon: Icon(
                    Icons.repeat,
                    color: Colors.grey,
                  )),
              SizedBox(
                width: 50,
              ),
             PlayerBuilder.isPlaying(
              player: player,
                builder: (contex,isplaying) {
                  return IconButton(
                      onPressed: () async{
                        
            player.open(Audio.file(allDbSongs[value-1].songurl!),showNotification: true);
            setState((){
          NowPlaying.nowplayingindex.value--;
            });
            await player.stop();
                        
                      },
                      icon: Icon(
                        Icons.fast_rewind,
                        size: 35,
                      ));
                }
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    AnimateIcon(player,value,allDbSongs);
                  },
                  icon: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: iconController,size: 35,color: Colors.purple,)),
              SizedBox(
                width: 10,
              ),
            PlayerBuilder.isPlaying(
              player: player,
                builder: (contex,isplaying) {
                  return IconButton(
                      onPressed: () async{
                      
            player.open(Audio.file(allDbSongs[value+1].songurl!),showNotification: true);
            setState((){
              AnimateIcon(player, value, allDbSongs);
          NowPlaying.nowplayingindex.value++;
            });
            await player.stop();
                       
                      },
                      icon: Icon(
                        Icons.fast_forward,
                        size: 35,
                      ));
                }
              ),
              SizedBox(
                width: 40,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.grey,
                  ))
            ],
          )
        ],
      )),
    );
     
      }
    
    ),
    );
    },
    );
}
  AnimateIcon(AssetsAudioPlayer player, int index , List<Songs>dbsongs){
   
      isAnimated=!isAnimated;
      if(isAnimated){
        iconController.forward();
   
      player.open(Audio.file(dbsongs[index].songurl!),showNotification: true   );
     
      }else{
        iconController.reverse();
        player.pause();
      }
  
  }
}

