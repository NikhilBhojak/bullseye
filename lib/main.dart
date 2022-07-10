import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_the_number/prompt.dart';
import 'control.dart';
import "package:guess_the_number/score.dart";
import 'gamemodel.dart';
void main() {
    runApp(BullsEyeApp());
}
class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return const MaterialApp(
      title: 'Bullseye',
      home:Gamepage(),
    );
  }
}
class Gamepage extends StatefulWidget {
  const Gamepage({Key? key}) : super(key: key);

  @override
  State<Gamepage> createState() => _GamepageState();
}
class _GamepageState extends State<Gamepage> {
  // var _alertIsVisible = false;
  late GameModel _model;
  @override
  void initState(){
    super.initState();
    _model = GameModel(50);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               const Prompt(
                 targetvalue: 100,
               ),
                  Control(
                      model: _model
                  ),
                    TextButton(
                        onPressed: (){
                       _showAlert(context);
                        },
                        child: const Text('Hit me',
                        style: TextStyle(
                            color: Colors.blue,
                        ),
                        )
                    ),
                Score(
                    totalScore: _model.totalScore,
                    round: _model.round),
                ],
            ),
        )
    );
  }
void _showAlert(BuildContext context){
    var okButton =TextButton(
      child:const Text('Awesome'),
      onPressed: (){
        Navigator.of(context).pop();
        // _alertIsVisible=false;
        print('Awesome pressed !');
      },
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Hello there !'),
            content: Text('The slider\'s value is ${_model.current}'),
            actions: [
              okButton,
            ],
            elevation: 5,
          );
        },
    );
}
}



