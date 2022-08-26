import 'package:finalflutterapp/services/FirestoreHelper.dart';
import 'package:flutter/material.dart';

import 'DashBoard.dart';

class AddAnnonce extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddAnnonceState();
  }

}

class AddAnnonceState extends State<AddAnnonce>{
  //Variable
  late String titre;
  late String description;
  @override
  Widget build(
      BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Ajouter une annonce",
          style: TextStyle(fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.orange
          ),
        ),
      ),
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return Column(
      children: [
        const SizedBox(height: 10,),
        Title(
            color: Colors.deepOrange,
            child: const Text("Titre de l'annonce"),
        ),
        TextField(
          onChanged: (value){
            setState(() {
              titre = value;
            });

          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "tapez le titre",
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
        ),
        const SizedBox(height: 10,),
        Title(
            color: Colors.deepOrange,
            child: const Text("Description de l'annonce")),
        TextField(
          onChanged: (value){
            setState(() {
              description = value;
            });

          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "tapez la description",
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
        ),
        const SizedBox(height: 10,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
          ),
          onPressed: (){
              FirestoreHelper().EnregistrementAnnonce(titre, description).then((value){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return DashBoard();
                    }
                ));
              });

          },
          child: const Text("Enregistrer"),
        ),
        TextButton(
            style: TextButton.styleFrom(
              primary: Colors.orange,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return DashBoard();
                  }
              ));

            },
            child: const Text("retour")
        ),
      ],
    );
  }

}