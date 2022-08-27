import 'package:finalflutterapp/services/constants.dart';
import 'package:flutter/material.dart';

class InfoPerso extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InfoPersoState();
  }

}

class InfoPersoState extends State<InfoPerso>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Mon Profil", style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, color: Colors.orange),),
        centerTitle: true,

      ),
      body: Center(child: bodyPage()),
    );
  }


  Widget bodyPage(){
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        //avatar
        const CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey,
        ),
        const SizedBox(height: 10,),
        //Pseudo
        Card(
            child: Text("Pseudo : ${MyAccount.pseudo}",style: const TextStyle(
                fontSize: 25,
                color: Colors.orange,
                fontWeight: FontWeight.bold
            ))
        ),


        //adresse mail
        Card(
          child: Text("Adresse mail : ${MyAccount.mail}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal)),
        ),


        //Nom et prénom
        Card(
          child: Text("Nom : ${MyAccount.nom}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.normal)),
        )

      ],
    );
  }

}