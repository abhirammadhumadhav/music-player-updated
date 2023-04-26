import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_project/model/dbfunction.dart';
import 'package:my_project/model/mostlyplayed.dart';

import '../../model/songmodel.dart';
import '../recentlyPlayed/recentlyPlayedscreen.dart';

class MostlyPlayedScreen extends StatefulWidget {
  const MostlyPlayedScreen({super.key});

  @override
  State<MostlyPlayedScreen> createState() => _MostlyPlayedScreenState();
}

class _MostlyPlayedScreenState extends State<MostlyPlayedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 31, 55),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 50,
              ),
              const Text(
                'MOSTLYPLAYED SONGS',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ValueListenableBuilder(
            valueListenable: Mostlyplaybox.getInstance().listenable(),
            builder: (context, recentSongs, child) {
              List songsFromdb = displayMostlyPlayed();
              if (songsFromdb.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "You haven't played anything ! Try playing something.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              } else {
                return SongListWidget(allReSongs: songsFromdb);
              }
            },
          )
        ],
      )),
    );
  }
}
