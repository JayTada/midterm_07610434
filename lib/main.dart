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
                                  Text('      PIG WEIGHT',
                                      style: TextStyle(
                                          fontSize: 36.0, color: Colors.pink.withOpacity(1))),
                                  Text(
                                    '     CALCULATOR',
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
                                  width: 300,
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
                                              hintText: 'Enter girth',
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
                                  width: 300,
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