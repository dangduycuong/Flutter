import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';//thư viện english_words

void main() => runApp(new MyApp());//one-line func

class RandomEnglishWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomEnglishWordsState();//return a state's object. Where is the state's class.
  }
}

//State
abstract class RandomEnglishWordsState extends State<RandomEnglishWords> {
  //làm giao diện cho statefulwidget.
  //lấy thuộc tính wordpair từ random.
  final wordPair = new WordPair.random();
  return new Text(
      wordPair.asUpperCase,
      style: new TextStyle(fontSize: 20.0));
}

class MyApp extends StatelessWidget {
  //Define "root widget"

  //Every UI components are widgets
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    // TODO: implement build
    //Widget with "Material Design"
    return new MaterialApp(
      title: "Flutter App First ",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("This is header's title"),
        ),
        body: new Center(
//          child: new Text("This is at the body's center"),
        //viết hoa tất cả
          child: new Text(
            wordPair.asUpperCase,
            //style: new TextStyle(fontSize: 22.0),
            style: new RandomEnglishWords() //a state widget
          ),

        ),
      ),
    );
  }
}