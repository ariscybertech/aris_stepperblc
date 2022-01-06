import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepper_content_widget_bloc/StepOneView.dart';
import 'package:stepper_content_widget_bloc/StepTwoView.dart';

import 'StepperBloc.dart';


class StepperView extends StatefulWidget {
  StepperView({Key key}) : super(key: key);
  
  @override
  _StepperViewState createState() => new _StepperViewState();
}

class _StepperViewState extends State<StepperView> {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        stepperList(),
      ],
    );
  }
    
  Widget stepperList() { 
    final bloc = BlocProvider.of<StepperBloc>(context); 
    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, StepperState state) {
        return Container(
          child: Stepper(
            controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox()
              );
            },
            
            steps: <Step>[
              Step(
                title: Text("Step 1"),
                content: new Wrap(
                  children:<Widget>[
                    StepOneView()
                  ],
                ),
                isActive: (state.currentStep == 0 ? true : false),
                state: (state.currentStep >= 1) ? StepState.complete : StepState.indexed,
              ),
              Step(
                title: Text("Step 2"),
                content: new Wrap(
                  children:<Widget>[
                    StepTwoView()
                    ],
                ),
                isActive: (state.currentStep == 1 ? true : false),
                state: (state.currentStep >= 2) ? StepState.complete : StepState.indexed,
              )
            ],
            currentStep: state.currentStep,
            type: StepperType.horizontal,
            onStepTapped: (step) {
              (step <= state.currentStep) ? bloc.onBack() : bloc.onContinue();
            },
            onStepCancel: () {
              bloc.onBack();
            },
            onStepContinue: () {
              bloc.onContinue();
            },
          ),
        );
      }
    );
  }
  
  
  
}