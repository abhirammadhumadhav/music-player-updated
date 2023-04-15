import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_project/model/likedSongs.dart';
import 'package:my_project/model/playlist.dart';
import 'package:my_project/model/recentlyPlayed.dart';
import 'package:my_project/screens/splashscreen/splashscreen.dart';
import 'model/dbfunction.dart';
import 'model/songmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(SongsAdapter());
  await Hive.openBox<Songs>(boxname);
  Hive.registerAdapter(RecentlyPlayedAdapter());
  await Hive.openBox<RecentlyPlayed>(recentboxname);
  recentlyplayeddb();
  Hive.registerAdapter(LikedSongsAdapter());
  await Hive.openBox<LikedSongs>(likedboxname);
  likedDb();
  Hive.registerAdapter(PlayListSongsAdapter());
  await Hive.openBox<PlayListSongs>(playlistboxname);
  playlistDb();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
