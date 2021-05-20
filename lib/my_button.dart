import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Color txtColor;
  final double radius;
  final VoidCallback onPressed;
  double heightOfScr;
  double widthOfScr;

  MyButton({
       @required this.btnText, this.btnColor: Colors.white10, this.txtColor, this.radius: 30, this.onPressed}): assert(btnText!=null);

  @override
  Widget build(BuildContext context) {
    heightOfScr=MediaQuery.of(context).size.height;
    widthOfScr=MediaQuery.of(context).size.width;
    return Container(margin:EdgeInsets.fromLTRB(8, 6, 8, 6),width:widthOfScr*0.2,height: widthOfScr*0.2,child: RaisedButton(child: Text(btnText,style: TextStyle(color: Colors.white,fontSize: 24),),onPressed: onPressed,color: btnColor,shape: CircleBorder(),));
  }
}
