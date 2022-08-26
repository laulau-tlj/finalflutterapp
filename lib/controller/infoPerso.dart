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
        title: Text("Mon Profil"),
        centerTitle: true,

      ),
      body: Center(child: bodyPage()),
    );
  }


  Widget bodyPage(){
    return ListView(
      children: [
        const SizedBox(height: 10,),
        //Pseudo
        Text("Pseudo : ${MyAccount.pseudo}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

        //adresse mail
        Text("Adresse mail : ${MyAccount.mail}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

        //Nom et prénom
        Text("Nom : ${MyAccount.nom!}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)), //A CHANGER
      ],
      padding: EdgeInsets.all(10),
    );
  }

}