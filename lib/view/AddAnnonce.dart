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
  @override
  Widget build(
      BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter une annonce"),
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
          onPressed: (){

              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return DashBoard();
                  }
              ));
          },
          child: const Text("Enregistrer"),
        ),
        TextButton(
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