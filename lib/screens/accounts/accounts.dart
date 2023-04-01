import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_project/screens/likedsongs/likedsongs.dart';
import 'package:my_project/screens/miniplayer/miniplayer.dart';
import 'package:my_project/screens/playlist/playlistscreen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 31, 55),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
         
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Account',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ],
                  ),
                ),
         
            SizedBox(height: 20,),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                 child: IconButton(onPressed: (){}, icon: Icon(Icons.account_circle,color: Colors.purple,)),
                 
                ),
                SizedBox(width: 10,),

                Text('Abhiram',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.grey ),)
              ],
            ),
            SizedBox(height:50,),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlaylistScreen()));
              },
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return PlaylistScreen(); 
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20 )),
                      height: 100,
                      width: 150,
                      // color: Colors.yellow,
                    
                      // child: IconButton(onPressed: (){}, icon: Icon(Icons.playlist_add_check,size: 30,),),
                      child: Image.asset('lib/assets/images/100-best-rock-bands-of-the-2010s.jpg',fit: BoxFit.cover,),
                      
                    ),
                  ),
                  SizedBox(width: 30,),
                  Text('Playlist',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                  
                ],
                
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 150,
                  color: Color.fromARGB(255, 45, 10, 242),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.download,size: 30,color: Colors.green,)),
                ),
                SizedBox(width: 30,),
                Text('Downloads',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                
              ],
              
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return LikedScreen();
                }));
              },
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    color: Color.fromARGB(255, 13, 232, 49),
                    child: IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LikedScreen()));
                    }, icon: Icon(Icons.favorite,size: 30,color: Colors.red,)),
                  ),
                  SizedBox(width: 30,),
                  Text('Liked',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                  
                ],
                
              ),
            ),

        ],),
      )),
      // floatingActionButton: MiniPlayer(),
    );
  }
}