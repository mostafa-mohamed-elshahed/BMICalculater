
import 'dart:math';

import 'package:bmicalculater/ResultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class BmiCalculator extends StatefulWidget {

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isMale = true;
  double height = 120;
  double age = 20;
  double weight = 70;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white54,
      appBar: AppBar(
        title: Text(
          "BMI Calculator"
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(child: Container(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(onTap: (){
                      setState(() {
                        isMale=true;
                      });
                    },
                      child: Container(
                        color: isMale?Colors.black87: Colors.black26,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image(image: AssetImage("images/Male.svg.png",), color:  isMale?Colors.white: Colors.black,width: 90,),
                            Text("Male",
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: isMale?Colors.white: Colors.black),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        color: isMale ?Colors.black26:Colors.black87,

                        child: Column(
                          children: [
                            Image(image: AssetImage("images/unnamed.png"),color: !isMale?Colors.white: Colors.black,width: 70,),
                            Text("Female"  ,
                              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: !isMale?Colors.white: Colors.black,),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),),)),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: Colors.black26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "${height.round()}",style:  TextStyle(fontSize: 50,fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "CM",style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                      ),

                    ],
                  ),
                  Slider(
                      value: height,
                      max: 230,
                      min: 80,
                      activeColor: Colors.deepPurple,
                      inactiveColor: Colors.purple,
                      onChanged: (value){
                        setState(() {
                          height = value;
                        });

                  }),
                ],
              ),
            ),
          )),
          Expanded(child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black26,
                      child: Column(
                        children: [
                          Text(
                            "WEIGHT",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "${weight.round()}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(heroTag: "weight--",
                                onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },backgroundColor: Colors.black,
                              child: Icon(Icons.add,size: 20,),),

                              FloatingActionButton(heroTag: "weight++",
                                onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },backgroundColor: Colors.black,
                              child: Icon(Icons.remove,size: 20,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      color: Colors.black26,
                      child: Column(
                        children: [
                          Text(
                            "Age",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300),
                          ),
                          Text(
                              "${age.round()}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(heroTag: "age++",
                                onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },backgroundColor: Colors.black,
                              child: Icon(Icons.add,size: 20,),),
                              FloatingActionButton(heroTag: "age--",

                                onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },backgroundColor: Colors.black,
                              child: Icon(Icons.remove,size: 20,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
          Container(
            height: 50,
            width: double.infinity,
            child: MaterialButton(
              onPressed: (){
                double result =weight / pow(height/100, 2);

                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(result: result,age:age ,isMale: isMale,)));
              },
              child: Text(
                "Calculate"
              ),
              color: Colors.pink[500],
            ),
          ),
        ],
      ),
    );
  }
}
