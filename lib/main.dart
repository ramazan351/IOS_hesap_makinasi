import 'package:flutter/material.dart';
import 'package:hesap_makinesi/my_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Hesap Makinesi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double heightOfScr;
  double widthOfScr;

  @override
  Widget build(BuildContext context) {
    heightOfScr = MediaQuery.of(context)
        .size
        .height; //cihazın yüksekliğini ve genişliğini aldık
    widthOfScr = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: heightOfScr,
        width: widthOfScr,
        color: Colors.black,//
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: widthOfScr,
              height: heightOfScr * 0.28,
              child: Text(" "),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyButton(
                  btnText: "AC",
                  btnColor: Colors.white38,
                  onPressed: () {},
                ),
                MyButton(
                  btnText: "+/-",
                  btnColor: Colors.white38,
                  onPressed: () {},
                ),
                MyButton(
                    btnText: "%", btnColor: Colors.white38, onPressed: () {}),
                MyButton(textFontSize: 40,
                  btnText: "÷",
                  btnColor: Colors.orange,
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyButton(
                  btnText: "7",
                  onPressed: () {},
                ),
                MyButton(
                  btnText: "8",
                  onPressed: () {},
                ),
                MyButton(btnText: "9", onPressed: () {}),
                MyButton(
                  btnText: "X",
                  btnColor: Colors.orange,
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyButton(
                  btnText: "4",
                  onPressed: () {},
                ),
                MyButton(
                  btnText: "5",
                  onPressed: () {},
                ),
                MyButton(btnText: "6", onPressed: () {}),
                MyButton(textFontSize: 70,
                  btnText: "-",
                  btnColor: Colors.orange,
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyButton(
                  btnText: "1",
                  onPressed: () {},
                ),
                MyButton(
                  btnText: "2",
                  onPressed: () {},
                ),
                MyButton(btnText: "3", onPressed: () {}),

                MyButton(textFontSize: 40,
                  btnText: "+",
                  btnColor: Colors.orange,
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(8, 6, 8, 6),
                    width: widthOfScr * 0.44,
                    height: widthOfScr * 0.18,
                    child: RaisedButton(
                      color: Colors.white10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(color: Colors.white, fontSize: 26),
                          ),
                          Opacity(opacity: 0, child: Text("0")),
                          Visibility(visible: false, child: Text("0"))
                        ],
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                    )),
                MyButton(
                  btnText: ",",
                  onPressed: () {},
                ),
                MyButton(
                  btnText: "=",
                  btnColor: Colors.orange,
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
