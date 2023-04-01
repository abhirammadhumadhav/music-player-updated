import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_project/screens/miniplayer/miniplayer.dart';
import 'package:my_project/model/recentlyPlayed.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../model/dbfunction.dart';
import '../nowplaying/nowplaying.dart';

class Recentlyplayed extends StatefulWidget {
  const Recentlyplayed({super.key});
  static int? indexnotifier = 0;
  static ValueNotifier<int> recentScreenIndex =
      ValueNotifier<int>(indexnotifier!);

  @override
  State<Recentlyplayed> createState() => _RecentlyplayedState();
}

class _RecentlyplayedState extends State<Recentlyplayed> {
  AssetsAudioPlayer player = AssetsAudioPlayer();
  List<Audio> resongs = [];
  @override
  void initState() {
    List<RecentlyPlayed> rdbsongs =
        recentlyplayedbox.values.toList().reversed.toList();
    for (var item in rdbsongs) {
      resongs.add(Audio.file(item.songurl!,
          metas: Metas(
            artist: item.songname,
            title: item.artist,
            id: item.id.toString(),
          )));
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    int val = 0;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 50,
              ),
              Text(
                "RECENTLY PLAYED",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ValueListenableBuilder<Box<RecentlyPlayed>>(
            valueListenable: recentlyplayedbox.listenable(),
            builder: (context, recentSongs, child) {
              List<RecentlyPlayed> allReSongs =
                  recentlyplayedbox.values.toList().reversed.toList();
              if (allReSongs.isEmpty) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                        "You haven't played anything ! Try playing something."),
                  ),
                );
              } else {
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
                                    id: allReSongs[index].id!,
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
                                        allReSongs[index].songname!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        allReSongs[index].artist!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                )),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.playlist_add,
                                  size: 30,
                                  color: Colors.purple,
                                )),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox();
                    },
                    itemCount: allReSongs.length,
                  ),
                );
              }
            },
          ),
        ],
      )),
      // floatingActionButton: MiniPlayer(),
    );
  }
}