import 'package:flutter/material.dart';

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
    return ListView (
      children : const < Widget >[
        Text ( 'Row One' ),
        Text ( 'Row Two' ),
        Text ( 'Row Three' ),
        Text ( 'Row Four' ),
      ],
    );
  }

}