import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:my_project/model/playlist.dart';
import 'package:my_project/model/recentlyPlayed.dart';
import 'package:my_project/screens/miniplayer/miniplayer.dart';
import 'package:my_project/screens/nowplaying/nowplaying.dart';
import 'package:my_project/screens/playlistedScreen/playlistedscreen.dart';
// import 'package:my_project/screens/playlist/playlistscreen.dart';
import 'package:my_project/screens/recentlyPlayed/recentlyPlayedscreen.dart';
import 'package:my_project/screens/settingsScreen/settingsScreen.dart';
import 'package:my_project/screens/splashscreen/splashscreen.dart';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../model/dbfunction.dart';
import '../../model/songmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Audio> allAudiosongs = [];

  final box = SongBox.getInstance();
  List<Audio> convertAudios = [];
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  void initState() {
    List<Songs> dbsongs = box.values.toList();
    for (var item in dbsongs) {
      convertAudios.add(Audio.file(item.songurl!,
          metas: Metas(
              title: item.songname,
              artist: item.artist,
              id: item.id.toString())));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int val = 0;
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 2, 31, 55),
        backgroundColor: const Color(0xFF7d5647),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Hello Abhiram',
                        style: TextStyle(
                            fontSize: 30,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const Recentlyplayed())));
                      },
                      icon: const Icon(
                        Icons.av_timer,
                        color: Colors.indigo,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const SettingsScreen())));
                      },
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Colors.indigo,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        height: 150,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'ALAN WALKER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://th.bing.com/th/id/OIP.TxXKiRPdfr3EdyAweeoXnQHaHa?pid=ImgDet&rs=1'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 150,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'the chain smokers',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://th.bing.com/th/id/OIP.cw6aAZl6iTeH4ngtLVyepwHaE7?pid=ImgDet&rs=1'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 150,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'A R Rahman',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://www.tellychakkar.com/sites/www.tellychakkar.com/files/images/movie_image/2020/02/10/A.R.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 150,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Shreya Goshal',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://i.pinimg.com/originals/9f/f5/ae/9ff5ae8f4ef00023143f40a626151504.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 150,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Sunburn',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://i1.wp.com/indianewengland.com/wp-content/uploads/2015/12/Sunburn-Finale-Crowd.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 150,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Psy Trance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://i.ytimg.com/vi/cuupW9hpnw4/maxresdefault.jpg'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 150,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              'Wiz Khalifa',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://fromthestage.net/wp-content/uploads/2020/02/wiz-khalifa-new-rap.jpg'),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'For you',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                    Icon(
                      Icons.play_circle_filled,
                      size: 40,
                      color: Colors.purple,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder<Box<Songs>>(
                valueListenable: box.listenable(),
                builder: (context, songbox, child) {
                  List<Songs> allSongs = songbox.values.toList();
                  for (var element in allSongs) {
                    allAudiosongs.add(Audio.file(element.songurl!,
                        metas: Metas(
                            artist: element.artist,
                            title: element.songname,
                            id: element.id.toString())));
                  }
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromARGB(255, 22, 22, 22),
                                ),
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: QueryArtworkWidget(
                                            id: allSongs[index].id!,
                                            type: ArtworkType.AUDIO,
                                            artworkFit: BoxFit.cover,
                                            nullArtworkWidget: CircleAvatar(
                                              radius: 20,
                                              child: Image.asset(
                                                'lib/assets/images/home-page-filipwolak-cirkiz-33311.webp',
                                                height: 100,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // MiniPlayer.miniNotifier.value = index;
                                          RecentlyPlayed song = RecentlyPlayed(
                                              songname:
                                                  allSongs[index].songname!,
                                              artist: allSongs[index].artist!,
                                              duration: int.parse(
                                                  allSongs[index].duration!),
                                              songurl: allSongs[index].songurl!,
                                              id: allSongs[index].id!);
                                          updaterecentlyplayed(song);
                                          NowPlaying.nowplayingindex.value =
                                              index;
                                          NowPlaying.nowplayingList.value =
                                              allSongs;
                                          setState(() {
                                            val = index;
                                          });

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return const NowPlaying();
                                          }));
                                        },
                                        child: Text(
                                          allSongs[index].songname!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        allSongs[index].artist!,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        //  playlistAlertBox(
                                        //      context, TextEditingController());
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) {
                                        //   return const PlaylistScreen();
                                        // }));
                                        showplaylist(context, allSongs[index]);
                                      },
                                      icon: const Icon(
                                        Icons.playlist_add,
                                        size: 30,
                                        color: Colors.purple,
                                      )),
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox();
                        },
                        itemCount: allSongs.length),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )),
        floatingActionButton: const MiniPlayer());
  }
}

showplaylist(
  BuildContext context,
  Songs song,
) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Playlists'),
          content: ValueListenableBuilder(
              valueListenable: Playlistbox.getInstance().listenable(),
              builder: (context, playListbox, child) {
                final listplaylist = Playlistbox.getInstance().values.toList();
                return listplaylist.isEmpty
                    ? const Text("You have no Playlist")
                    : SizedBox(
                        height: 200,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  checkLogin(context);
                                  AddToPlaylist(index, song);
                                  Navigator.of(context).pop();
                                },
                                title: Text(
                                  listplaylist[index].playlistName!,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox();
                            },
                            itemCount: listplaylist.length),
                      );
              }),
        );
      });
}

void checkLogin(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Center(child: Text('add to playlist'))));
}
