import 'package:finalflutterapp/controller/ListAnnonce.dart';
import 'package:finalflutterapp/controller/InfoPerso.dart';
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
          child : InfoPerso(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey,

        title: const Text("Accueil page", style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return Column(
      children: [
        const SizedBox(height: 10,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return AddAnnonce();
                  }
              ));

            },
            child: const Text("+ Créer une annonce")
        ),
        const SizedBox(height: 10,),

        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height-167,
          child: ListAnnonce(),
        )
      ],
    );

  }

}

