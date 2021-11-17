import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:desktop_dialog/desktop_dialog.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
           
            MaterialButton(
              onPressed: () {
                createDialog(context,
                    title: 'Warning!',
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.clear, color: Colors.red, size: 40),
                        ),
                        Flexible(
                          child: Text(
                            'Command Pubspec Assits: Add/Update Dependencies resulted in an error. (Running the Contributed Command \'pubspec-assit.addDependency\' failed )',
                            softWrap: true,
                          ),
                        ),
                      ],
                    ));
              },
              onLongPress: () {
                createDialog(context,
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Ink(
                        decoration:  BoxDecoration(border: Border.all(color: Colors.black)),
                        child: const LinearProgressIndicator(
                            minHeight: 20, 
                            backgroundColor: Colors.transparent,
                            value: 0.95,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                            ),
                      ),
                    ));
                //SimpleDesktopDialog(context: context, child: const Text('dfwrsf'));
                // showDialog(context: context, builder: (context){
                //   return AlertDialog(
                //     title: const Text('BDUBDIBDIBDISDBIDBI'),
                //     content: IntrinsicHeight(
                //       child: Column(
                //         children:const [
                //           Text('ddfimffdfimdkfdfifmdkm')
                //         ]
                //       ),
                //     ),
                //   );
                // });
              },
              child: const Text('show Dialog'),
            )
          ],
        ),
      ),
    );
  }
}
