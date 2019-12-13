import 'package:cursos/first_page.dart';
import 'package:cursos/model/singleton.dart';
import 'package:cursos/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum WidgetMarker {all, backend}

class CursosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>    HomePage()),
            );
          },
        ),
        title: Text('Cursos', style: TextStyle(color: Colors.black, fontSize: 33, fontWeight: FontWeight.bold )),
      ),
      body: BodyContainer(),
      bottomNavigationBar: BottomNavigationBar(
         selectedItemColor: Colors.white,
         backgroundColor: Colors.yellow[700] ,
         items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              title: Text('Cursos'),
              icon: Icon(FontAwesomeIcons.list)           
            ),
            BottomNavigationBarItem(
              title: Text('Ranking'),
              icon: Icon(FontAwesomeIcons.star)
            ),
            BottomNavigationBarItem(
              title: Text('Perfil'),
              icon: Icon(FontAwesomeIcons.user)
            )
         ],

       ),
    );
  }
}

class BodyContainer extends StatefulWidget {
  @override
  _BodyContainerState createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> with SingleTickerProviderStateMixin {

  WidgetMarker selectedWidgetMarker = WidgetMarker.all;
  AnimationController _controller;
 
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds:100));  
  }

  @override
  void dispose() {
    super.dispose(); 
    _controller.dispose();
  }

  


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0,),
        Text('Bienvenido ${appData.text}', style: TextStyle(fontSize: 30),),
        SizedBox(height: 10.0,),
        Row(
          children: <Widget>[
            
            SizedBox(width: 8.0,),
            RaisedButton(
              child: Text('All'),
              onPressed: (){
                setState(() {
                  selectedWidgetMarker = WidgetMarker.all;
                  
                });
              },
            ),
            SizedBox(width: 8.0,),
            RaisedButton(
              child: Text('Backend'),
              onPressed: (){
                setState(() {
                  selectedWidgetMarker = WidgetMarker.backend;
                  
                });
              },
            ),
          ],
        ),
        SizedBox(height: 15,),
        FutureBuilder(
          future: _animation(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return getMarker();
          },
        ),
      ],
    );
  }

  _animation(){
    _controller.reset();
    _controller.forward();
  }

  Widget getMarker(){
    switch(selectedWidgetMarker){
      case WidgetMarker.all:
      return lista1();
      case WidgetMarker.backend:
      return lista2();
    }
    return lista1();
  }

  Widget lista1(){
    return Expanded(
      child: FutureBuilder(
        future: listaCursos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if( snapshot?.data?.isNotEmpty??false){ 
            return crearData(context, snapshot);}
            else{
             return 
             Center(child: CircularProgressIndicator());
            }
            
        },
      ),
    );
  }

  Widget lista2(){
    return Expanded(
      child: FutureBuilder(
        future: listaFiltrada(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.data.isNotEmpty
            ?crearCategorias(context, snapshot)
            :CircularProgressIndicator();
        },
      ),
    );
  }

  Widget crearData (BuildContext context, AsyncSnapshot snapshot){
    var values = snapshot.data;
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index){
        return values.isNotEmpty
          ? Column(
            children: <Widget>[
              ListTile(
                leading: Icon(FontAwesomeIcons.artstation),
                title: Text(values[index].courseName),
                subtitle: Text(values[index].technology) ,
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(height: 2.0,)
            ],
          )
          : CircularProgressIndicator();
      },
    );
  }

  Widget crearCategorias(BuildContext context, AsyncSnapshot snapshot){
    var values = snapshot.data;
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index){
        return values.isNotEmpty
          ? Column(
            children: <Widget>[
              ListTile(
                leading: Icon(FontAwesomeIcons.artstation),
                title: Text(values[index].courseName),
                subtitle: Text(values[index].technology) ,
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(height: 2.0,)
            ],
          )
          : CircularProgressIndicator();
      },
    );
  }

}