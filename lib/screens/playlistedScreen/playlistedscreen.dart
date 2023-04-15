import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_project/model/dbfunction.dart';
import 'package:my_project/model/playlist.dart';
import 'package:my_project/model/songmodel.dart';
import 'package:my_project/screens/homescreen/homescreen.dart';
import 'package:my_project/screens/nowplaying/nowplaying.dart';
import 'package:my_project/screens/playlist/playlistscreen.dart';
import 'package:on_audio_query/on_audio_query.dart';

class playlistedscreen extends StatefulWidget {
  playlistedscreen({super.key});
  static int? playlistindex = 0;
  static ValueNotifier<int> playlistNotifier =
      ValueNotifier<int>(playlistindex!);
  @override
  State<playlistedscreen> createState() => _playlistedscreenState();
}

class _playlistedscreenState extends State<playlistedscreen> {
  List<Audio> plylstsongs = [];

  @override
  // void initState() {
  //   List<PlayListSongs> dbplaylist = playlistsongbox.values.toList();
  //   for(var item in dbplaylist){
  //     plylstsongs.add(Audio.file(item.))
  //   }
  //   // TODO: implement initState
  //   super.initState();
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7d5647),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const SizedBox(
                width: 70,
              ),
              const Text(
                'YOUR PLAYLIST',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          ValueListenableBuilder(
              valueListenable: playlistedscreen.playlistNotifier,
              builder: (context, listIndex, child) {
                return ValueListenableBuilder(
                    valueListenable: playlistsongbox.listenable(),
                    builder: (context, playlistsong, child) {
                      List<PlayListSongs> playlists =
                          playlistsongbox.values.toList();
                      List<Songs> playlistsSongs =
                          playlists[listIndex].listPlaylist!;
                      if (playlistsSongs.isEmpty) {
                        return const Text(
                          "add songs",
                          style: TextStyle(color: Colors.white),
                        );
                      } else {
                        return Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromARGB(255, 22, 22, 22),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      onTap: () {
                                        NowPlaying.nowplayingindex.value =
                                            index;
                                        NowPlaying.nowplayingList.value =
                                            playlistsong;
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const NowPlaying();
                                        }));
                                      },
                                      leading: QueryArtworkWidget(
                                        id: playlistsSongs[index].id!,
                                        type: ArtworkType.AUDIO,
                                        artworkFit: BoxFit.cover,
                                        nullArtworkWidget: const CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                              'lib/assets/images/home-page-filipwolak-cirkiz-33311.webp'),
                                        ),
                                      ),
                                      title: Text(
                                        playlistsSongs[index].songname!,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        playlistsSongs[index].artist!,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            playlistsSongs.removeAt(index);
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.red,
                                          )),
                                    ),
                                  ),
                                );
                              },
                              itemCount: playlistsSongs.length),
                        );
                      }
                    });
              })
        ],
      )),
    );
  }
}
