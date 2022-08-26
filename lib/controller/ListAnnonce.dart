import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalflutterapp/view/ModifAnnonce.dart';
import 'package:flutter/material.dart';
import '../services/FirestoreHelper.dart';
import 'package:finalflutterapp/model/Annonce.dart';

class ListAnnonce extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListAnnonceState();
  }


}

class ListAnnonceState extends State<ListAnnonce> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }

  Widget bodyPage(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper().fireAnnonce.snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            //La base de donnée n'a aucun snapshot
            return const Center(
              //Widget en forme de cercle qui tourne sur lui meme en permance
                child: CircularProgressIndicator()
            );


          }
          else
          {
            //La base de donnée a un ou plusieurs snapshots
            List documents = snapshot.data!.docs;
            return ListView.builder(
              shrinkWrap: true,
                itemCount: documents.length,
                itemBuilder: (context,index){
                  AnnonceInfo Annonce = AnnonceInfo(documents[index]);
                  return Row(
                    children : [
                      new Flexible(child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child:  ListTile(
                          title: Text(Annonce.titre),
                          subtitle: Text(Annonce.description),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context){
                                  return ModifAnnonce(uid: Annonce.id,title: Annonce.titre,description: Annonce.description,);
                                }
                            ));

                          },
                        ),

                      )
                      )
                     ,
                      IconButton(onPressed: (){
                        FirestoreHelper().deleteAnnonce(Annonce.id);
                      }, icon: const Icon(Icons.dangerous,size: 35,)
                      )
                  ]
                    );

                }
            );


          }
        }
    );
  }

}