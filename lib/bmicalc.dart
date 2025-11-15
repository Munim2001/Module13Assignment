import 'package:flutter/material.dart';
import 'package:module13_assignment/component/inputfield.dart';
import 'package:module13_assignment/utils/conversion.dart';

class BMICalc extends StatefulWidget {
  const BMICalc({super.key});

  @override
  State<BMICalc> createState() => _BMICalcState();
}

enum WeightCategory { kilogram, pound }

enum HeightCategory { m, cm, ftIn }

class _BMICalcState extends State<BMICalc> {
  WeightCategory wCategory = WeightCategory.kilogram;
  HeightCategory hCategory = HeightCategory.m;

  double? bmi;

  TextEditingController kgController = TextEditingController();
  TextEditingController poundController = TextEditingController();
  TextEditingController meterController = TextEditingController();
  TextEditingController centimeterController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Enter Your Weight',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: SegmentedButton(
                segments: const [
                  ButtonSegment(
                      value: WeightCategory.kilogram, label: Text('Kilogram')),
                  ButtonSegment(
                      value: WeightCategory.pound, label: Text('Pound')),
                ],
                selected: {wCategory},
                onSelectionChanged: (value) {
                  setState(() {
                    wCategory = value.first;
                  });
                },
              ),
            ),
            if (wCategory == WeightCategory.kilogram) ...[
              InputField(
                  inputLabel: 'Enter Your Weight In Kilogram',
                  textController: kgController)
            ] else ...[
              InputField(
                  inputLabel: 'Enter Your Weight In Pound',
                  textController: poundController)
            ],
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Enter Your Height",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: SegmentedButton(
                segments: const [
                  ButtonSegment(value: HeightCategory.m, label: Text('Meter')),
                  ButtonSegment(
                      value: HeightCategory.cm, label: Text('Centimeter')),
                  ButtonSegment(
                      value: HeightCategory.ftIn, label: Text('Feet & Inch')),
                ],
                selected: {hCategory},
                onSelectionChanged: (value) {
                  setState(() {
                    hCategory = value.first;
                  });
                },
              ),
            ),
            if (hCategory == HeightCategory.m) ...[
              InputField(
                  inputLabel: 'Enter Your Height In Meter',
                  textController: meterController)
            ] else if (hCategory == HeightCategory.cm) ...[
              InputField(
                  inputLabel: 'Enter Your Height In Centimeter',
                  textController: centimeterController)
            ] else ...[
              InputField(
                  inputLabel: 'Enter Your Height In Feet',
                  textController: feetController),
              const SizedBox(
                height: 25,
              ),
              InputField(
                  inputLabel: 'Enter Your Height In Inch',
                  textController: inchController)
            ],
           
            TextButton(
                onPressed: () {
                  final userHeight = hCategory == HeightCategory.m
                      ? Conversion.meterValueExtraction(
                          context, meterController.text)
                      : hCategory == HeightCategory.cm
                          ? Conversion.centimeterToMeterConversion(
                              context, centimeterController.text)
                          : Conversion.feetInchToMeterConversion(context,
                              feetController.text, inchController.text);

                  final userWeight = wCategory == WeightCategory.pound
                      ? Conversion.kgToPoundConversion(
                          context, poundController.text)
                      : Conversion.kgValueExtraction(
                          context, kgController.text);

                  if (userHeight == null || userWeight == null) {
                    return;
                  }

                  final double bmiValue =
                      Conversion.bmiCalculation(userHeight, userWeight);

                  setState(() {
                    bmi = double.tryParse(bmiValue.toStringAsFixed(1));
                  });

                  kgController.clear();
                  poundController.clear();
                  meterController.clear();
                  feetController.clear();
                  centimeterController.clear();
                  inchController.clear();
                },
                child: const Text('Calculate BMI')),

            if(bmi != null)...[
              Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 25),
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                color: Conversion.boxColor(bmi!),
                borderRadius: BorderRadius.circular(10)
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Your BMI Is' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white),),
                  Text(bmi!.toStringAsFixed(1) , style: const TextStyle(fontSize: 35 , fontWeight: FontWeight.bold , color: Colors.white),),
                  const Text('Current Situation' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white),),
                  Text(Conversion.currentSituation(bmi!).toString()  , style: const TextStyle(fontSize: 35 , fontWeight: FontWeight.bold , color: Colors.white),)
                ],
              ),
            )
            ]
          ],
        ),
      ),
    );
  }
}


