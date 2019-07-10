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
class RandomEnglishWordsState extends State<RandomEnglishWords> {
  //làm giao diện cho statefulwidget.
  //lấy thuộc tính wordpair từ random.
  //thuộc tính _words này thay đổi được
  final _words = <WordPair>[];//Words displayed in ListView, 1 row.

  final _checkedWords = new Set<WordPair>();//set contains "no duplicate items"

  @override
  Widget build(BuildContext context) {
    //Now we replace this with a Scaffold widget which contains a listView

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List of English words"),
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        //This is an annonymous function
        //index = 0, 1, 2, 3, 4, ...
        //This is function return each Row = "a Widget"
        if (index >= _words.length) {
          //khi vuốt đến last index
          _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index], index);//Where is _buildRow?
      }), //ListView.builder
    );
  }

  //hàm _buildRow tạo ra từng cái hàng một.
  Widget _buildRow(WordPair wordPair, int index) {
    //This widget is for each row
    final textColor = index % 2 == 0 ? Colors.red : Colors.blue;
    //kiểm tra xem có chứa cái chữ mà chúng ta vừa chọn không
    final isChecked = _checkedWords.contains(wordPair);
    return new ListTile(
      //leading = left, trailing = right. It is correct ? Not yet
      leading: new Icon(
          isChecked ? Icons.check_box : Icons.check_box_outline_blank,
          color: textColor,
      ),
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(fontSize: 18.0, color: textColor),
      ),
      onTap: () {
        setState(() {
          //This is an anonymous function
          if (isChecked) {
            _checkedWords.remove(wordPair); //Remove item in a Set
          } else {
            _checkedWords.add(wordPair); //Add item to a Set
          }
        });
      },
    );
  }


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
      home: new RandomEnglishWords()
    );
  }
}