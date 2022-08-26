

import 'package:cloud_firestore/cloud_firestore.dart';

class Utilisateur {
  //Attributs
  late String id;
  late String pseudo;
  late String mail;
  late String nom;



  Utilisateur(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    pseudo = map["PSEUDO"];
    mail = map["MAIL"];

  }


  Utilisateur.empty(){
    id = "";
    mail = "";
    pseudo = "";
    nom = "";
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map ={
      "PSEUDO" : pseudo,
      "MAIL": mail,
      "NOM":nom,
    };
    return map;
  }




}