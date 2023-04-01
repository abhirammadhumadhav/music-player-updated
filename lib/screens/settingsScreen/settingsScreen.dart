import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_project/screens/aboutUs/aboutUs.dart';
import 'package:my_project/screens/accounts/accounts.dart';
import 'package:my_project/screens/privacyPolicy/privacyPolicy.dart';
import 'package:my_project/screens/termsandcondition/terms.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 2, 31, 55),
     body: SafeArea(child: Column(
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.grey,)),
                  SizedBox(width: 20,),
                  Text('Settings',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white ),),
                 SizedBox(width: 150,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: Colors.indigo,))
                  
                ],
              ),
              SizedBox(height:25,),
            InkWell(
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){return AccountScreen();}));
              },
              child: Row(children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.manage_accounts,size:30,color: Colors.purple,)),
               SizedBox(width:20,),
               Text('Account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey),)
              ],),
            ),
            Row(children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.share,size:30,color: Colors.purple,)),
             SizedBox(width:20,),
             Text('Shareapp',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey),)
            ],),
            InkWell(
              onTap:(){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context){return PrivacyPolicy();}));
              } ,
              child: Row(children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.policy,size:30,color: Colors.purple,)),
               SizedBox(width:20,),
               Text('Privacy policy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey),)
              ],),
            ),
            InkWell(
              onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context){return TermsScreen();}));
              },
              child: Row(children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.privacy_tip,size:30,color: Colors.purple,)),
               SizedBox(width:20,),
               Text('Terms & conditions',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey),)
              ],),
            ),
            InkWell(
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){return AboutUs();}));
              } ,
              child: Row(children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.info,size:30,color: Colors.purple,)),
               SizedBox(width:20,),
               Text('About us',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey),)
              ],),
            ),
            Row(children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app,size:30,color: Colors.purple,)),
             SizedBox(width:20,),
             Text('Exit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey),)
            ],),
      ],
     )),
    );
  }
}