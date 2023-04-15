import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../model/songmodel.dart';
import '../nowplaying/nowplaying.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});
  // static int? miniplayerindex = 0;
  // static ValueNotifier<int> miniNotifier = ValueNotifier<int>(miniplayerindex!);

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController iconController;
  bool isAnimated = true;
  // bool isPlaying = false;
  AssetsAudioPlayer player = AssetsAudioPlayer();

  final box = SongBox.getInstance();

  @override
  void initState() {
    // List<Songs> dbSongs = box.values.toList();
    //  if (!player.isPlaying.value) {
    // iconController.forward();
    //   } else {
    //   iconController.reverse();
    // }
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    super.initState();
  }

  Widget build(BuildContext context) {
    // int val = 0;
    return ValueListenableBuilder(
        valueListenable: NowPlaying.nowplayingindex,
        builder: (context, value, child) {
          return ValueListenableBuilder(
              valueListenable: NowPlaying.nowplayingList,
              builder: (context, allDbsongs, child) {
                List all = allDbsongs;
                //  val = NowPlaying.nowplayingindex.value;
                return Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: double.infinity,
                  height: 60,
                  child: FloatingActionButton(
                      onPressed: () {
                        // NowPlaying.nowplayingindex.value = value;
                        // NowPlaying.nowplayingList.value = value;
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const NowPlaying();
                        }));
                      },
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          QueryArtworkWidget(
                            id: all[value].id!,
                            type: ArtworkType.AUDIO,
                            artworkFit: BoxFit.cover,
                            nullArtworkWidget: ClipRRect(
                              child: Image.asset(
                                'lib/assets/images/home-page-filipwolak-cirkiz-33311.webp',
                                width: 50,
                              ),
                            ),
                          ),

                          // SizedBox(width: 40,),
                          SizedBox(
                              width: 100,
                              child: Text(
                                all[value].songname!,
                                overflow: TextOverflow.ellipsis,
                              )),
                          const SizedBox(
                            width: 30,
                          ),
                          PlayerBuilder.isPlaying(
                            player: player,
                            builder: (context, isplaying) {
                              return IconButton(
                                onPressed: () async {
                                  player.open(
                                      Audio.file(all[value - 1].songurl!));
                                  // AnimateIcon(player, value, all);
                                  setState(() {
                                    NowPlaying.nowplayingindex.value--;
                                    // MiniPlayer.miniNotifier.value--;
                                  });
                                  iconController.forward();
                                  isAnimated = true;
                                  await player.stop();
                                },
                                icon: const Icon(
                                  Icons.fast_rewind,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              );
                            },
                          ),
                          //  SizedBox(width: 10,),
                          PlayerBuilder.isPlaying(
                              player: player,
                              builder: (context, isPlaying) {
                                if (player.isPlaying.value) {
                                  iconController.forward();
                                } else {
                                  iconController.reverse();
                                }
                                return IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (isAnimated) {
                                          iconController.reverse();
                                          player.pause();
                                          isAnimated = false;
                                        } else {
                                          iconController.forward();
                                          player.play();
                                          isAnimated = true;
                                        }
                                      });
                                    },
                                    icon: AnimatedIcon(
                                        icon: AnimatedIcons.play_pause,
                                        progress: iconController,
                                        size: 25,
                                        color: Colors.white));
                              }),
                          // IconButton(
                          //     onPressed: () async {
                          //       player
                          //           .open(Audio.file(all[value + 1].songurl!));
                          //       // AnimateIcon(player, value, all);
                          //       setState(() {
                          //         NowPlaying.nowplayingindex.value++;
                          //       });
                          //       await player.stop();
                          //     },
                          //     icon: const Icon(
                          //       Icons.fast_forward,
                          //       color: Colors.white,
                          //       size: 25,
                          //     ))
                          IconButton(
                              onPressed: () async {
                                await player.stop();
                                await player
                                    .open(Audio.file(all[value + 1].songurl!));
                                await player.play();
                                setState(() {
                                  NowPlaying.nowplayingindex.value++;
                                  // MiniPlayer.miniNotifier.value++;
                                });
                                iconController.forward();
                                isAnimated = true;
                              },
                              icon: const Icon(
                                Icons.fast_forward,
                                color: Colors.white,
                                size: 25,
                              ))
                        ],
                      )),
                );
              });
        });
  }

  AnimateIcon(AssetsAudioPlayer player, int index, List<Songs> dbsongs) {
    //  setState(() {
    isAnimated = !isAnimated;
    if (!player.isPlaying.value) {
      log(player.isPlaying.value.toString());
      iconController.forward();
      //  ()async {
      // player.open(Audio.file(dbsongs[index].songurl!), showNotification: true);
      // await player.stop();};
      player.play();
    } else {
      log(player.isPlaying.value.toString());
      iconController.reverse();
      player.pause();
    }
    // });
  }
}
