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
    return Column(
      children: [
        const SizedBox(height: 10,),
        //Pseuodo
        Text(MyAccount.pseudo,style: const TextStyle(fontSize: 35,color: Colors.purple,fontWeight: FontWeight.bold),),

        //adresse mail
        Text(MyAccount.mail),

        //Nom et prénom
        Text(MyAccount.nom!), //A CHANGER
      ],
    );
  }

}