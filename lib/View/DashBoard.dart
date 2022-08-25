import 'package:finalflutterapp/controller/ListAnnonce.dart';
import 'package:flutter/material.dart';

import 'AddAnnonce.dart';

class DashBoard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashBoardState();
  }

}

class DashBoardState extends State<DashBoard>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width/2,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))
          ),
          child : const Text("Mon compte"),
      ),
      appBar: AppBar(
        title: const Text("Accueil page"),
      ),
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return ListView(
      children: [
        ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return AddAnnonce();
                  }
              ));

            },
            child: const Text(" + Créer une annonce")
        ),
        ListAnnonce()
      ],
    );

  }

}