import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'StepperBloc.dart';

class StepTwoView extends StatefulWidget {
  StepTwoView({Key key}) : super(key: key);
  
  @override
  _StepTwoViewState createState() => _StepTwoViewState();
}

class _StepTwoViewState extends State<StepTwoView>{

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StepperBloc>(context); 
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, StepperState state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Column(
            children: <Widget>[
              Text("Rate from step 1 : " + bloc.currentState.rate.toString()),
              Text("Volume from step 1 : " + bloc.currentState.volume.toString()),
            ],
          ),
        )
      );
    });
  }
}
