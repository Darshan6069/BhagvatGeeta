import 'dart:convert';

import 'package:departure/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class JsonProvider with ChangeNotifier {

  List<BhagvatGeeta> bhagvatList=[];
  List<BookMark> bookMarkList=[];
  bool? istheme = false;


  addbookmark(String slock){
    bookMarkList.add(BookMark(slock: slock));
    notifyListeners();
  }

  removebookmark(index){
    bookMarkList.removeAt(index);
    notifyListeners();
  }

  set setTheme(value) {
    istheme = value;
    notifyListeners();
  }

  get getTheme {
    return istheme;
  }


  Future loadJsonData() async {

      var data = await rootBundle.loadString('assets/jsondata.json');

      var d = jsonDecode(data);

      for(var e in d){
        bhagvatList.add(BhagvatGeeta.fromJson(e));
      }
    }



}
