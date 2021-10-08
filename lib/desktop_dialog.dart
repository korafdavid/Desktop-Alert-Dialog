import 'dart:async';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DesktopDialog {
  static const MethodChannel _channel = MethodChannel('desktop_dialog');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

///For Creating a normall Dialog
createDialog(BuildContext _)  {
  return showGeneralDialog(
      context: _,
       barrierColor: Colors.black,
      barrierLabel: 'Barrier',
      pageBuilder: (BuildContext context, Animation<double> ii, Animation<double> d) {
        return Center(
          child: ConstrainedBox(
          constraints : const BoxConstraints(minHeight: 150, minWidth: 150),
          child:  Wrap(
          children: [
            WindowTitleBarBox(
                child: DecoratedBox(
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Desktop Dialog'),
                      
                      CloseWindowButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                    ],
                  ),
                )),
               
           const  FlutterLogo(size: 100),
           Row(
             children: [
                MaterialButton(onPressed: ()=>Navigator.of(context).pop(), child: const Text('Close'))
             ]
           )
          ],
                    ),
          )
        );
      });
}


// Command 'Pubspec Assist: Add/update dependencies' resulted in an error (Running the contributed command: 'pubspec-assist.addDependency' failed.)

class DraggableCard extends StatefulWidget {
  final Widget child;
  const DraggableCard({Key? key, required this.child}) : super(key: key);

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Alignment _dragAlignment = Alignment.center;
  Animation<Alignment>? _animation;

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller!.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: _dragAlignment,
      ),
    );

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller!.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller!.addListener(() {
      setState(() {
        _dragAlignment = _animation!.value;
      });
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _controller!.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
} 

//https://app.community.engage.redhat.com/e/er?s=17900033&lid=5033&elqTrackId=c8fd4498f2f44f2eb73e7514f66fd5eb&elq=869f4bbb9c354ac0ad6de5b6c8f21b26&elqaid=810&elqat=1


//https://app.community.engage.redhat.com/e/er?s=17900033&lid=4748&elqTrackId=54223c316bb6431bb37008fba554b8b4&elq=dbb906686e9c4ac0bdc44801a5a2708a&elqaid=780&elqat=1


//  DraggableCard(
//             child: WindowBorder(
//               color: Colors.blue,
//               width: 1,
//               child: ConstrainedBox(
//                 constraints: const BoxConstraints(minWidth: 130.0, minHeight: 150),
//                 child: IntrinsicHeight(
//                   child: Column(
//                   children: [
//                     // WindowTitleBarBox(
//                     //     child: DecoratedBox(
//                     //       decoration: const BoxDecoration(),
//                     //       child: Row(
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           const Text('Desktop Dialog'),
                              
//                     //           CloseWindowButton(
//                     //                         onPressed: () => Navigator.of(context).pop(),
//                     //                       ),
//                     //         ],
//                     //       ),
//                     //     )),
//                    const  FlutterLogo(size: 100),
//                    Row(
//                      children: [
//                         MaterialButton(onPressed: ()=>Navigator.of(context).pop(), child: const Text('Close'))
//                      ]
//                    )
//                   ],
//                             ),
//                 ),
//               ),
//             ),
//           ),