import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BmiState();
  }

}

class BmiState extends State<Home> {
  final TextEditingController ac = new TextEditingController();
  final TextEditingController hc = new TextEditingController();
  final TextEditingController wc = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String resultweight ="";
  String $finalResult="";

  void calculateBmi(){
    setState(() {
      int age = int.parse(ac.text);
      double height = double.parse(hc.text);
      inches = height*12;
      double weight = double.parse(wc.text);

      if ((ac.text.isNotEmpty || age > 0)
        && ((hc.text.isNotEmpty || inches > 0)
      && (ac.text.isNotEmpty || weight > 0))){

        result = weight/(inches*inches)*703;
        
        if(double.parse(result.toStringAsFixed(1)) < 18.5){
          resultweight = "Under Weight";
          print(resultweight);
        }else if(double.parse(result.toStringAsFixed(1)) >= 18.5 && result <25){
          resultweight = "Great Shape !";
          print(resultweight);

        }
        else if(double.parse(result.toStringAsFixed(1)) >= 25 && result <30){
          resultweight = "Overweight";
          print(resultweight);

        }
        else if(double.parse(result.toStringAsFixed(1)) >= 30){
          resultweight = "Obese !";
          print(resultweight);
        }

      }else{
        result = 0.0;
      }

    });

    $finalResult = "Your BMI : ${result.toStringAsFixed(1)}";
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI CALCULATION",),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset('images/bmilogo.png',
              height: 85.0,
              width: 75.0,),


            new Container(
              margin: const EdgeInsets.all(3.0),
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: ac,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Age',
                      hintText: 'e.g. 35',
                      icon: new Icon(Icons.person_outline)

                    ),
                  ),

                  new TextField(
                    controller: hc,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Height in Feet',
                        hintText: 'e.g. 5.8',
                        icon: new Icon(Icons.insert_chart)

                    ),
                  ),

                  new TextField(
                    controller: wc,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Weight in lbs',
                        hintText: 'e.g. 100',
                        icon: new Icon(Icons.line_weight)

                    ),
                  ),

                  Padding(padding: new EdgeInsets.all(3.5)),

                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                        onPressed: calculateBmi,
                      color: Colors.pinkAccent,
                      child: new Text('Calculate'),
                      textColor: Colors.white,

                    ),


                  )


                ],
              ),

            ),

            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text($finalResult,
                style: new TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0
                ),
                ),

                new Padding(padding: const EdgeInsets.all(5.0)),

                new Text("$resultweight",
                  style: new TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0
                  ),

                )

              ],

            )

          ],
        ),

      ),
    );
  }
}

