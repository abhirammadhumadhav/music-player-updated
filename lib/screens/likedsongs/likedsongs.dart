import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_project/model/dbfunction.dart';
import 'package:my_project/model/likedSongs.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../nowplaying/nowplaying.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});
  static int? indexnotifier = 0;
  static ValueNotifier<int> likedscreenindex = ValueNotifier<int>(indexnotifier!);

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  AssetsAudioPlayer player = AssetsAudioPlayer();
  List<Audio> likesogs = [];
  @override
  void initState() {
    List<LikedSongs> likeddbsong = likedsongbox.values.toList();
    for(var item in likeddbsong ){
       likesogs.add(Audio.file(item.songurl!,
        metas: Metas(
          artist:item.songname,
          title: item.artist,
          id: item.id.toString(),
        )
       ));

    }
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    int val  =0;
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
                'Liked Songs',
                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ValueListenableBuilder(
            valueListenable: likedsongbox.listenable(),
            builder: (context,songliked,child) {
              List<LikedSongs> favSong = likedsongbox.values.toList();
              if(favSong.isEmpty){
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                        "You haven't liked anything ! Try playing something.",style: TextStyle(color: Colors.white),),
                  ),
                );
              }else{
                  return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color.fromARGB(255, 22, 22, 22),
                              ),
                              child: ListTile(
                                leading: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15)),
                                      child: QueryArtworkWidget(
                                        id: favSong[index].id!,
                                        type: ArtworkType.AUDIO,
                                        nullArtworkWidget: Image.asset(
                                          'lib/assets/images/home-page-filipwolak-cirkiz-33311.webp',
                                          height: 200,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                title: InkWell(
                                    onTap: () {
                                      
                                          NowPlaying.nowplayingindex.value =
                                              index;
                                          setState(() {
                                            val = index;
                                          });

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return NowPlaying();
                                          }));
                                    },
                                    
                                    child: Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            favSong[index].songname!,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                           favSong[index].artist!,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    )),
                                trailing: IconButton(
                                    onPressed: () {
                                      likedsongbox.deleteAt(index);
                                    },
                                    icon: Icon(
                                      Icons.remove_circle,
                                      size: 30,
                                      color: Colors.red,
                                    )),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox();
                        },
                        itemCount:favSong.length,
                      ),
                    );
            }
            }
          )
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_filled,color: Colors.blue,size: 30,)),
          //       SizedBox(width: 20,),
          //       Column(
          //         children: [
          //           Text('kesariyathera brahmastra',style: TextStyle(fontWeight: FontWeight.bold),),
          //           Text('artist'),
          //         ],
          //       ),
          //       SizedBox(width:30 ,),
          //       IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.green,)),
          //       IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline,color: Colors.red,))

          //     ],
          //   ),
          // ),


         
          
           
           
        ],
      )),
    );
  }
}
