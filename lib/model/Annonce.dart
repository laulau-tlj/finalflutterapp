

import 'package:cloud_firestore/cloud_firestore.dart';

class AnnonceInfo {
  //Attributs
  late String id;
  late String titre;
  late String description;
  late DateTime date;



  AnnonceInfo(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    titre = map["TITLE"];
    description = map["DESCRIPTION"];

  }

}