import 'package:finalflutterapp/services/FirestoreHelper.dart';
import 'package:finalflutterapp/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:finalflutterapp/view/DashBoard.dart';

class Inscription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InscriptionState();
  }
}

class InscriptionState extends State<Inscription> {
  //varibales
  late String nom;
  late String pseudo;
  late String mail;
  late String password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.orange,
          ),
          title: const Text("Inscription",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.orange)),
        ),
        body: Padding(child: bodyPage(), padding: const EdgeInsets.all(15)));
  }

  Widget bodyPage() {
    return Column(
      children: [
        //Nom
        TextField(
          onChanged: (value) {
            setState(() {
              nom = value;
            });
          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre Nom",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
        const SizedBox(
          height: 10,
        ),

        //Pseudo
        TextField(
          onChanged: (value) {
            setState(() {
              pseudo = value;
            });
          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre pseudo",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
        const SizedBox(
          height: 10,
        ),

        //mail

        TextField(
          onChanged: (value) {
            setState(() {
              mail = value;
            });
          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre mail",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),

        const SizedBox(
          height: 10,
        ),

        //password

        TextField(
          obscureText: true,
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),

        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
            onPressed: () {
              FirestoreHelper()
                  .inscription(nom, mail, password, pseudo)
                  .then((value) {
                MyAccount = value;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DashBoard();
                }));
              });
            },
            child: const Text("Enregistrer")),
        TextButton(
            style: TextButton.styleFrom(
              primary: Colors.orange,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Annuler"))

        //bouton de la date de naissance
      ],
    );
  }
}
