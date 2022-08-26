
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:finalflutterapp/model/Utilisateur.dart';
import 'package:random_string/random_string.dart';

class FirestoreHelper{
   final auth = FirebaseAuth.instance;
   final storage = FirebaseStorage.instance;
   final fireUsers = FirebaseFirestore.instance.collection("USERS");
   final fireAnnonce = FirebaseFirestore.instance.collection("ANNONCE");


   //Méthodes

   //Se connecter à notre base de donnée
   Future <Utilisateur> connected(String mail , String password) async{
      UserCredential result = await auth.signInWithEmailAndPassword(email: mail, password: password);
      String uid = result.user!.uid;
      return getUsers(uid);


   }


   //S'inscrire dans notre base de donnnée
   Future<Utilisateur> inscription(String nom , String mail, String password,String pseudo) async {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: mail, password: password);
      String uid = result.user!.uid;
      Map<String,dynamic> map = {
         "PSEUDO": pseudo,
         "MAIL": mail,
         "NOM": nom,
      };
      addUser(uid, map);
      return getUsers(uid);


   }


   //ajouter un utilisateur
   addUser(String uid, Map<String,dynamic> map){
      fireUsers.doc(uid).set(map);
   }


   //Récuperer les infos des utilisateurs
   Future<Utilisateur> getUsers(String uid) async{
      DocumentSnapshot snapshot = await fireUsers.doc(uid).get();
      return Utilisateur(snapshot);
   }


   //mettre à jour les infos de l'utilisateurs
   updateUser(String uid, Map<String,dynamic> map){
      fireUsers.doc(uid).update(map);
   }

   //Supprimer des annonces
   deleteAnnonce(String uid){
      fireAnnonce.doc(uid).delete();
   }

   //mettre à jour une annonce
   updateAnnonce(String uid, Map<String,dynamic> map){
      fireAnnonce.doc(uid).update(map);
   }


   //Stocker une image
   Future <String> stockageImage(String nameImage, Uint8List data) async {
      TaskSnapshot snapshot = await storage.ref("avatars/$nameImage").putData(data);
      String url = await snapshot.ref.getDownloadURL();
      return url;



   }

   //Envoyer les messages
   Future EnregistrementAnnonce(String titre, String description) async {
      DateTime date = DateTime.now();
      String uid = randomAlphaNumeric(20);
      Map<String,dynamic> map = {
         "TITLE": titre,
         "DESCRIPTION":  description,
         "DATE" : date,
      };

      AddAnnonce(uid, map);

   }

   AddAnnonce(String uid,Map<String,dynamic> map){
      fireAnnonce.doc(uid).set(map);
   }


}