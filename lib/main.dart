import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pig Weight Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final _controllerLength = TextEditingController();
  final _controllerGirth = TextEditingController();
  final fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 8.0),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('        PIG WEIGHT',
                                      style: TextStyle(
                                          fontSize: 36.0, color: Colors.pink.withOpacity(1))),
                                  Text(
                                    '      CALCULATOR',
                                    style: TextStyle(
                                      fontSize: 36.0,
                                      color: Colors.pink.withOpacity(1),
                                    ),
                                  ),
                                  Image.asset('images/pig.png', width: 280,),
                                ],
                              ),
                            ])
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 8.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                elevation: 50,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child:Column(
                                      children: [
                                        const Text(
                                          'LENGTH',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        const Text(
                                          '(cm)',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: _controllerLength,
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(),
                                              hintText: 'Enter length',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 50,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child:Column(
                                      children: [
                                        const Text(
                                          'GIRTH',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        const Text(
                                          '(cm)',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: _controllerGirth,
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(),
                                              hintText: 'Enter girth',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ElevatedButton(
                        child: const Text('CALCULATE'),
                        onPressed: () {
                          var inputLength = _controllerLength.text;
                          var inputGirth = _controllerGirth.text;

                          var length =  double.tryParse(inputLength);
                          var girth =  double.tryParse(inputGirth);

                          if(length == null || girth == null){
                            print(
                                "กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น");
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title : const Text('ERROR',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                    content :const Text( 'Invalid input'),
                                    actions: [
                                      ElevatedButton
                                        (onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                          child: const Text('OK'))
                                    ],
                                  );
                                });
                          }else{
                            var weight = girth/100 * girth/100 * length/100 * 69.3;
                            var weightPlus = weight * 1.03;
                            var weightPlusInt = weightPlus.round();
                            var weightMinus = weight * 0.97;
                            var weightMinusInt = weightMinus.round();
                            var pricePlus = weightPlus * 112.5;
                            var pricePlusInt = pricePlus.round();
                            var priceMinus = weightMinus * 112.5;
                            var priceMinusInt = priceMinus.round();
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title :Row(
                                        children:const [
                                          Image(image: AssetImage('images/ic_pig.png'),width: 40,),
                                          Text('RESULT',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
                                        ]

                                    ),
                                    content :Text( 'Weight: $weightMinusInt - $weightPlusInt kg \n Price: $priceMinusInt - $pricePlusInt Baht'),

                                    actions: [
                                      ElevatedButton
                                        (onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                          child: const Text('OK'))
                                    ],
                                  );
                                });
                          }
                        },
                      ),
                    )
                  ],

                )
            )
        )
    );
  }
}