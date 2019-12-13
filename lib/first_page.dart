import 'package:cursos/cursos_page.dart';
import 'package:cursos/model/singleton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    textController.text = appData.text;

    return Scaffold(
      body: Column(
        children: <Widget>[_crearFondo(context), _text()],
      )
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondo = Container(
      height: size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(208, 137, 14, 1.0),
        Color.fromRGBO(240, 194, 5, 1.0)
      ])),
    );
    final circulo = Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
    return Stack(
      children: <Widget>[
        fondo,
        Positioned(
          top: 60.0,
          left: 30.0,
          child: circulo,
        ),
        Positioned(
          top: -40.0,
          left: 300.0,
          child: circulo,
        ),
        Positioned(
          top: 200.0,
          left: -20.0,
          child: circulo,
        ),
        Positioned(
          top: 100.0,
          left: 250.0,
          child: circulo,
        ),
        Positioned(
          top: 200.0,
          left: 290.0,
          child: circulo,
        ),
        Container(
          padding: EdgeInsets.only(top: 30.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 80,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text('IncubeApp',
                  style: TextStyle(color: Colors.white, fontSize: 25))
            ],
          ),
        )
      ],
    );
  }

  Widget _text() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  hintText: 'Insert your name', border: OutlineInputBorder()),
              onChanged: (text) {
                appData.text = text;
              },
            ),
            Divider(),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: RaisedButton(
                child: Text('Sign In'),
                color: Colors.yellow[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CursosPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
