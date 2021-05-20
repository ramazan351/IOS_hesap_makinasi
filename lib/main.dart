import 'package:flutter/material.dart';
import 'package:hesap_makinesi/my_button.dart';
/*

* ramazan351.ra@gmail.com*/
void main() {
  runApp(MyApp());
}

enum DecisionProcess { addition, subtraction, division, multiplication }

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
  DecisionProcess operation;
  String value1, value2, fakeValue = "", strResult = "";
  double intValue1, intValue2, intResult;
  bool showResult = true; //burayı false yap daha sonra tüm tıklanmalara false'a eşitle sadece operationfinis metodunda true olsun
  //o zaman sonuç gösterildikten sonra AC basılmadan başka bir işleme geçilirse sonucu ekrandan silmiş olursun.

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
        color: Colors.black, //
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: widthOfScr,
                height: heightOfScr * 0.27,
                child: Text(
                  showResult ? " $fakeValue" : "",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyButton(
                    txtColor: Colors.black87,
                    btnText: "AC",
                    btnColor: Colors.white38,
                    onPressed: () {
                      setState(() {
                        value1 = "";
                        value2 = "";
                        fakeValue = "";
                        strResult = "";
                      });
                    },
                  ),
                  MyButton(
                    txtColor: Colors.black87,
                    btnText: "+/-",
                    btnColor: Colors.white38,
                    onPressed: () {},
                  ),
                  MyButton(
                      txtColor: Colors.black87,
                      textFontSize: 35,
                      btnText: "%",
                      btnColor: Colors.white38,
                      onPressed: () {}),
                  MyButton(
                    textFontSize: 40,
                    btnText: "÷",
                    btnColor: Colors.orange,
                    onPressed: () {
                      operation = DecisionProcess.division;
                      makeDecisionProcess();
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyButton(
                    btnText: "7",
                    onPressed: () {
                      setState(() {
                        fakeValue += "7";
                      });
                    },
                  ),
                  MyButton(
                    btnText: "8",
                    onPressed: () {
                      setState(() {
                        fakeValue += "8";
                      });
                    },
                  ),
                  MyButton(
                      btnText: "9",
                      onPressed: () {
                        setState(() {
                          fakeValue += "9";
                        });
                      }),
                  MyButton(
                    btnText: "X",
                    btnColor: Colors.orange,
                    onPressed: () {operation=DecisionProcess.multiplication;makeDecisionProcess();},
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyButton(
                    btnText: "4",
                    onPressed: () {
                      setState(() {
                        fakeValue += "4";
                      });
                    },
                  ),
                  MyButton(
                    btnText: "5",
                    onPressed: () {
                      setState(() {
                        fakeValue += "5";
                      });
                    },
                  ),
                  MyButton(
                      btnText: "6",
                      onPressed: () {
                        setState(() {
                          fakeValue += "6";
                        });
                      }),
                  MyButton(
                    textFontSize: 70,
                    btnText: "-",
                    btnColor: Colors.orange,
                    onPressed: () {
                      operation = DecisionProcess.subtraction;
                      makeDecisionProcess();
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyButton(
                    btnText: "1",
                    onPressed: () {
                      setState(() {
                        fakeValue += "1";
                      });
                    },
                  ),
                  MyButton(
                    btnText: "2",
                    onPressed: () {
                      setState(() {
                        fakeValue += "2";
                      });
                    },
                  ),
                  MyButton(
                      btnText: "3",
                      onPressed: () {
                        setState(() {
                          fakeValue += "3";
                        });
                      }),
                  MyButton(
                    textFontSize: 40,
                    btnText: "+",
                    btnColor: Colors.orange,
                    onPressed: () {operation=DecisionProcess.addition;
                    makeDecisionProcess();},
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26),
                            ),
                            Opacity(opacity: 0, child: Text("0")),
                            Visibility(visible: false, child: Text("0"))
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            fakeValue += "0";
                          });
                        },
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
                    onPressed: () {
                      operationFinish();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void makeDecisionProcess() {
    //hangi işlem yapılacak ise seçilir ve o esnada işlem yapılacak birinci değer value1'e aktarılır.
    if (value1 == null || value1 == "") {
      value1 = fakeValue;
      intValue1 = double.parse(value1);
      fakeValue = "";
    }
  }

  void operationFinish() {//eşittire tıklandığında fakeValue'den ikinci değer alınır ve ona göre işlemler yapılır
    if (!(fakeValue == null || fakeValue == "")) {
      value2 = fakeValue;
      intValue2 = double.parse(value2);
      fakeValue = "";
      switch (operation) {
        case DecisionProcess.division:
          try {
            intResult = intValue1 / intValue2;
            setState(() {
              fakeValue = intResult.toString();
            });
          } catch (e) {}

          break;
        case DecisionProcess.multiplication:
          setState(() {
            intResult = intValue1 * intValue2;
            fakeValue = intResult.toString();
          });
          break;
        case DecisionProcess.addition:
          setState(() {
            intResult = intValue2 + intValue1;
            fakeValue = intResult.toString();
          });
          break;
        case DecisionProcess.subtraction:
          setState(() {
            intResult = intValue1 - intValue2;
            fakeValue = intResult.toString();
          });
          break;
        default:
          print("bir işlem seçilmedi");
      }
    }
  }
}
