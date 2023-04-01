import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:my_project/model/playlist.dart';
import 'package:my_project/model/recentlyPlayed.dart';
import 'package:my_project/model/songmodel.dart';

import 'likedSongs.dart';
// import 'package:my_project/screens/recentlyPlayed/recentlyPlayedscreen.dart';

late Box<RecentlyPlayed> recentlyplayedbox;
recentlyplayeddb () async {
  recentlyplayedbox = await Hive.openBox('recentlyplayed');
}
updaterecentlyplayed(RecentlyPlayed value){
  List<RecentlyPlayed> list = recentlyplayedbox.values.toList();
  bool isNot = list.where((element) => element.songname == value.songname).isEmpty;
  if(isNot == true){
     recentlyplayedbox.add(value);
  }else{
    int index = list.indexWhere((element) => element.songname == value.songname);
    recentlyplayedbox.delete(index);
    recentlyplayedbox.add(value);
  }
}
late Box<LikedSongs> likedsongbox;
 likedDb() async {
  likedsongbox = await Hive.openBox('likedsongs');
 }
 updatedlikedsongs(LikedSongs value){
  List<LikedSongs> list =likedsongbox.values.toList();
  bool isNot = list.where((element) => element.songname == value.songname).isEmpty;
  if(isNot == true){
     likedsongbox.add(value);
  }else{
    int index = list.indexWhere((element) => element.songname == value.songname);
    likedsongbox.deleteAt(index); 
  }
 }
 bool likedorNot(LikedSongs value){
  List<LikedSongs> list =likedsongbox.values.toList();
  bool isNot = list.where((element) => element.songname == value.songname).isEmpty;
  if(isNot == true){
     return false;
  }else{
    return true;
  }
 }
 late Box<PlayListSongs> playlistsongbox;
 playlistDb() async{
    playlistsongbox = await Hive.openBox('playlistsongs');
 }

 createPlayList(String name)async{
  final box = Playlistbox.getInstance();
    
    List<PlayListSongs>playListDB=box.values.toList();
      List<Songs>addList=[];
      bool notAlready = playListDB.where((element) => element.playlistName == name).isEmpty;
     if(notAlready){
        log('hii');
        log(name);
        
        box.add(PlayListSongs(playlistName: name, listPlaylist: addList));
       }
  print(box.values.toString());
 }

