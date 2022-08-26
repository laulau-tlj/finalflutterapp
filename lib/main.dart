
import 'dart:io';
import 'package:finalflutterapp/controller/infoPerso.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'view/DashBoard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:finalflutterapp/services/FirestoreHelper.dart';
import 'package:finalflutterapp/services/constants.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variable
  late String mail;
  late String password;




  //fonction interne à la page
  popUp(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              content: const Text("Adresse mail ou de de passe invalide"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok")
                )
              ],
            );
          }
          else {
            return AlertDialog(
              content: const Text("Adresse mail ou de de passe invalide"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok")
                )
              ],
            );
          }
        }
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text("Mon Bon Coin"),
        ),
        body: bodyPage()
    );
  }


  Widget bodyPage(){
    return  Column(
      children: [

        const SizedBox(height: 10,),
        TextField(
          onChanged: (value){
            setState(() {
              mail = value;
            });

          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre adresse mail",
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
        ),
        const SizedBox(height: 10,),
        TextField(
          obscureText: true,
          onChanged: (value){
            setState(() {
              password = value;
            });

          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Entrer votre mot de passe",
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
              )
          ),
        ),
        const SizedBox(height: 10,),
        ElevatedButton(
          onPressed: (){
            FirestoreHelper().connected(mail, password).then((value){
              MyAccount = value;
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return DashBoard();//DashBoard(mail: mail,password: password,);
                  }
              ));
            }).catchError((onError){
              //Afficher popUp
              popUp();

            });




          },
          child: const Text("Connexion"),
        ),
        TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return const Text("inscription");//Inscription();
                  }
              ));

            },
            child: const Text("Inscription"),
        ),
      ],
    );
  }
}
