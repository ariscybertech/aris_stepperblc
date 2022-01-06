import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'StepperBloc.dart';

class StepOneView extends StatefulWidget {
  StepOneView({Key key}) : super(key: key);
  
  @override
  _StepOneViewState createState() => _StepOneViewState();
}

class _StepOneViewState extends State<StepOneView>{
  final textControllerRate = TextEditingController(), 
        textControllerVolume = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StepperBloc>(context); 
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, StepperState state) {
        textControllerRate.text = (state.rate != null) ? state.rate.toString() : textControllerRate.text;
        textControllerVolume.text = (state.volume != null) ? state.volume.toString() : textControllerVolume.text;
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Column(
            children: <Widget>[
              new TextFormField(
                controller: textControllerRate,
                decoration: const InputDecoration(labelText: 'Rate'),
                keyboardType: TextInputType.number,
              ),
              new TextFormField(
                controller: textControllerVolume,
                decoration: const InputDecoration(labelText: 'Volume'),
                keyboardType: TextInputType.number,
              ),

              new Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    bloc.onSaveRate(double.parse(textControllerRate.text), double.parse(textControllerVolume.text));
                    bloc.onContinue();
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Next'),
                ),
              )
            ],
          ),
          )
        );
      }
    );
  }
}
