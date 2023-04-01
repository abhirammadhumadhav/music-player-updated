import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class downloadScreen extends StatelessWidget {
  const downloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 2, 31, 55),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new,color: Colors.grey,)),
              SizedBox(
                width: 50,
              ),
              Text(
                'Downloads',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(width: 100,),
              Icon(Icons.download,color: Colors.green,),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.play_circle_filled,
          //             color: Colors.blue,
          //             size: 30,
          //           )),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       Column(
          //          crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'kesariyathera brahmastra',
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //           Text('artist'),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          ListTile(
              leading: Container(
                height: 100,
                width: 60,
               child: Image.asset('lib/assets/images/3443874094_f901253b39_b.jpg',fit: BoxFit.cover,),
              ),
              title: Text('Malayalam',style: TextStyle(color: Colors.white),),
              subtitle: Text('artist',style: TextStyle(color: Colors.grey),),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline,color: Colors.red,)),
          ),
          Divider(thickness: 2,),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.play_circle_filled,
          //             color: Colors.blue,
          //             size: 30,
          //           )),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       Column(
          //          crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'kesariyathera brahmastra',
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //           Text('artist'),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
           ListTile(
              leading: Container(
                height: 100,
                width: 60,
               child: Image.asset('lib/screens/splashscreen/assets/images/maxresdefault.jpg',fit: BoxFit.cover,),
              ),
              title: Text('Tamil',style: TextStyle(color: Colors.white),),
              subtitle: Text('artist',style: TextStyle(color: Colors.grey),),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline,color: Colors.red,)),
          ),
          Divider(thickness: 2,),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.play_circle_filled,
          //             color: Colors.blue,
          //             size: 30,
          //           )),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       Column(
          //          crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'kesariyathera brahmastra',
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //           Text('artist'),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          ListTile(
              leading: Container(
                height: 100,
                width: 60,
               child: Image.asset('lib/screens/splashscreen/assets/images/maxresdefault (1).jpg',fit: BoxFit.cover,),
              ),
              title: Text('English',style: TextStyle(color: Colors.white),),
              subtitle: Text('artist',style: TextStyle(color: Colors.grey),),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline,color: Colors.red,)),
          ),
          Divider(thickness: 2,),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.play_circle_filled,
          //             color: Colors.blue,
          //             size: 30,
          //           )),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       Column(
          //          crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'kesariyathera brahmastra',
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //           Text('artist'),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          ListTile(
              leading: Container(
                height: 100,
                width: 60,
               child: Image.asset('lib/screens/splashscreen/assets/images/Kesariya-Brahmastra-Ranbir-Kapoor-Alia-Bhatt-Pritam-Arijit-Singh.jpeg',fit: BoxFit.cover,),
              ),
              title: Text('Hindi',style: TextStyle(color: Colors.white),),
              subtitle: Text('artist',style: TextStyle(color: Colors.grey),),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline,color: Colors.red,)),
          ),
          Divider(thickness: 2,),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.play_circle_filled,
          //             color: Colors.blue,
          //             size: 30,
          //           )),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             'kesariyathera brahmastra',
          //             style: TextStyle(fontWeight: FontWeight.bold),
          //           ),
          //           Text('artist'),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
           ListTile(
              leading: Container(
                height: 100,
                width: 60,
               child: Image.asset('lib/screens/splashscreen/assets/images/27-1424976662-hny.jpg',fit: BoxFit.cover,),
              ),
              title: Text('Telugu',style: TextStyle(color: Colors.white),),
              subtitle: Text('artist',style: TextStyle(color: Colors.grey),),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline,color: Colors.red,)),
          ),
          Divider(thickness: 2,),
        ],
      )),
    );
  }
}
