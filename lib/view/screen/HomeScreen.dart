import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 211, 150, 19),
        onPressed: (){},
        child:const Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(children: [
        Row(
          children: [
          MaterialButton(onPressed: (){},
          child:const  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home) , Text("Acceuil"),
            ],
          ),),
          MaterialButton(onPressed: (){},
          child:const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person) , Text("Profile"),
            ],
          ),),
 
        ],),
      const  Spacer(),
         Row(children: [
          MaterialButton(onPressed: (){},
          child:const  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.notifications_sharp) , Text("notifications"),
            ],
          ),),
          MaterialButton(onPressed: (){},
          child:const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.home) , Text("Acceuil"),
            ],
          ),),
 
        ],),
      ],),),
      body: Container(),
    );
  }
}