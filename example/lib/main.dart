import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:desktop_dialog/desktop_dialog.dart';

void main() {
  runApp(const MaterialApp(home:  MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await DesktopDialog.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Running on: $_platformVersion\n'),
            ),
            MaterialButton(onPressed: (){
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
                     child: Text('Command Pubspec Assits: Add/Update Dependencies resulted in an error. (Running the Contributed Command \'pubspec-assit.addDependency\' failed )',
                     softWrap: true ,
                     ),
                   ),
                ],
              )
              );
            },
            onLongPress: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: const Text('BDUBDIBDIBDISDBIDBI'),
                  content: IntrinsicHeight(
                    child: Column(
                      children:const [
                        Text('ddfimffdfimdkfdfifmdkm')
                      ]
                    ),
                  ),
                );
              });
            },
            child: const Text('show Dialog'),
            )
          ],
        ),
      ),
    );
  }
}

