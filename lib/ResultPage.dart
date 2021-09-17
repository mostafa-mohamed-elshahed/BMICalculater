import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

 final bool isMale ;
 final double result ;
 final double age ;
  ResultPage({this.isMale,this.age,this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "BMI Result"
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Result :",style: TextStyle(fontSize:  30,fontWeight: FontWeight.bold),),

              Text(" ${result.round()}",style: TextStyle(fontSize:  30,fontWeight: FontWeight.bold),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Gender :",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text("  ${isMale? "male" : "female"}",style: TextStyle(fontSize:  30,fontWeight: FontWeight.bold),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("age      :",style: TextStyle(fontSize:  30,fontWeight: FontWeight.bold),),
              Text("  ${age.round()}",style: TextStyle(fontSize:  30,fontWeight: FontWeight.bold),),
            ],
          ),
        ],
      ),
    );
  }
}
