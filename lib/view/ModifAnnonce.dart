import 'package:flutter/material.dart';
import 'package:finalflutterapp/services/FirestoreHelper.dart';
import 'package:finalflutterapp/view/DashBoard.dart';

class ModifAnnonce extends StatefulWidget{
  String uid;
  String title;
  String description;
  ModifAnnonce({required this.uid, required this.title, required this.description});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ModifAnnonceState();
  }


}

class ModifAnnonceState extends State<ModifAnnonce> {
  String title = "";
  String description = "";
  @override
  Widget build(
      BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.orange,
        ),
        title: const Text("Modifier une annonce",
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
        TextFormField(
          initialValue: widget.title,
          onChanged: (value){
            setState(() {
              title = value;
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
        TextFormField(
          initialValue: widget.description,
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
            if(title == ""){
              title = widget.title;
            }
            if(description == ""){
              description = widget.description;
            }
            Map<String,dynamic> map = {
              "TITLE": title,
              "DESCRIPTION": description
            };
            FirestoreHelper().updateAnnonce(widget.uid, map);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return DashBoard();
                  }
              ));


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
            child: const Text("Annuler")
        ),
      ],
    );
  }

}