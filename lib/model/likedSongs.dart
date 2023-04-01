import 'package:hive/hive.dart';
import 'package:my_project/screens/splashscreen/splashscreen.dart';
part 'likedSongs.g.dart';

@HiveType(typeId:2)
class LikedSongs{
  @HiveField(0)
  final String? songname;
  @HiveField(1)
  final String? artist;
  @HiveField(2)
  int? duration;
  @HiveField(3)
  String? songurl;
  @HiveField(4)
  int? id;
 LikedSongs({
   required this.songname,
   required this.artist,
   required this.duration,
   required this.songurl,
   required this.id
  });

  // Object get value => null;

}
String likedboxname = 'likedsongs';
class Likedbox{
  static Box<LikedSongs>? _box;
  static Box getInstance (){
     return _box = Hive.box(likedboxname);
  }
}
