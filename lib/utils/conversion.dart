import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class Conversion {
  static double? kgToPoundConversion(BuildContext context, poundController) {
    final poundValue = double.tryParse(poundController);

    if (poundValue == null || poundValue == 0 || poundValue < 0) {
      const snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oh Snap!',
          message: 'Please Enter A Valid Number',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      return null;
    }
    print(poundValue * 0.45359237);
    return poundValue * 0.45359237;
  }

  static double? kgValueExtraction(BuildContext context, kgController) {
    final kgValue = double.tryParse(kgController);

    if (kgValue == null || kgValue == 0 || kgValue < 0) {
      const snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oh Snap!',
          message: 'Please Enter A Valid Number',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      return null;
    }
    print(kgValue);
    return kgValue;
  }

  static double? meterValueExtraction(BuildContext context, meterController) {
    final meterValue = double.tryParse(meterController);

    if (meterValue == null || meterValue == 0 || meterValue < 0) {
      const snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oh Snap!',
          message: 'Please Enter A Valid Number',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      return null;
    }
    print(meterValue);
    return meterValue;
  }

  static double? centimeterToMeterConversion(
      BuildContext context, centimeterController) {
    final centimeterValue = double.tryParse(centimeterController);

    if (centimeterValue == null ||
        centimeterValue == 0 ||
        centimeterValue < 0) {
      const snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oh Snap!',
          message: 'Please Enter A Valid Number',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      return null;
    }
    print(centimeterValue / 100.0);
    return centimeterValue / 100.0;
  }

  static double? feetInchToMeterConversion(
      BuildContext context, feetController, inchController) {
    var feetValue = double.tryParse(feetController);
    var inchValue = double.tryParse(inchController);

    if (feetValue == null ||
        feetValue == 0 ||
        feetValue < 0 ||
        inchValue == null ||
        inchValue == 0 ||
        inchValue < 0) {
      const snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oh Snap!',
          message: 'Please Enter A Valid Number',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      return null;
    }

    if (inchValue >= 12) {
      feetValue += (inchValue ~/ 12);
      inchValue = inchValue % 12;
    }

    final totalInches = (feetValue * 12) + inchValue;

    final meters = totalInches * 0.0254;

    print("Feet: $feetValue, Inches: $inchValue -> $meters m");

    return meters;
  }

  static double bmiCalculation(double height, double weight) {
    print(weight / (height * height));
    return weight / (height * height);
  }

  static Color? boxColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return Colors.green;
    } else if (bmi == 25.0 && bmi <= 29.9) {
      return Colors.orange;
    } else if (bmi >= 30) {
      return Colors.red;
    }

    return null;
  }

  static String? currentSituation( double bmiScore) {
    if (bmiScore < 18.5) {
      return 'Underweight';
    } else if (bmiScore >= 18.5 && bmiScore <= 24.9) {
      return 'Normal';
    } else if (bmiScore == 25.0 && bmiScore <= 29.9) {
      return 'Overweight';
    } else if (bmiScore >= 30) {
      return 'Obese';
    }

    return null;
  }
}
