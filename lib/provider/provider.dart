import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cursos/model/cursos_model.dart';


String  url  = 'https://a14dn2g93i.execute-api.us-east-1.amazonaws.com/prod/course';
String  url2 = 'https://a14dn2g93i.execute-api.us-east-1.amazonaws.com/prod/course/category/backend';
String categoria = "all";
  
  Future <List<Curso>>  listaCursos(  ) async {
    final response = await http.get(url);
    final decodedData = json.decode(response.body); 
    
    List<Curso> cursos =[];

    for(var u in decodedData){
      Curso curso = Curso(u["technology"],u["durationWeeks"],u["sequence"],u["courseId"],u["targetStudyWeek"],u["category"],u["numberLessons"],u["link"],u["duration"],u["plannedWeeklyTarget"],u["courseName"]);
      cursos.add(curso);
    }
    return cursos;
  }

  Future <List<Curso>>  listaFiltrada() async {
    final response = await http.get(url2);
    final decodedData = json.decode(response.body); 
    
    List<Curso> cursos =[];

    for(var u in decodedData){
      Curso curso = Curso(u["technology"],u["durationWeeks"],u["sequence"],u["courseId"],u["targetStudyWeek"],u["category"],u["numberLessons"],u["link"],u["duration"],u["plannedWeeklyTarget"],u["courseName"]);
      cursos.add(curso);
    }
    return cursos;

  }