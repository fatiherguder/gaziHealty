import 'package:flutter/material.dart';
import 'package:gazihealty/core/components/days-step.dart';
import 'package:gazihealty/core/palette.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedometer/pedometer.dart';

class RunningScreen extends StatefulWidget {
  const RunningScreen({Key? key}) : super(key: key);

  @override
  State<RunningScreen> createState() => _RunningScreenState();
}

class _RunningScreenState extends State<RunningScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '0';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return SafeArea(
        child: Column(
      children: [
        buildWelcome(),
        buildCircularIndicator(),
        Text(_status),
        buildTitle(),
        buildDaySteps(controller)
      ],
    ));
  }

  Column buildWelcome() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
          child: Text(
            "Ho??geldin Fatih ????",
            style: GoogleFonts.montserrat(
                fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 0,
          endIndent: 200,
          color: Colors.grey,
        ),
      ],
    );
  }

  Expanded buildDaySteps(PageController controller) {
    return Expanded(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            StepDay(
              day: "Pazartesi",
              step: 5873,
            ),
            StepDay(
              day: "Sal??",
              step: 8012,
            ),
            StepDay(
              day: "??ar??amba",
              step: 13608,
            ),
            StepDay(
              day: "Per??embe",
              step: 8672,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            StepDay(
              day: "Cuma",
              step: 9172,
            ),
            StepDay(
              day: "Cumartesi",
              step: 6718,
            ),
            StepDay(
              day: "Pazar",
              step: 1109,
            ),
          ],
        ),
      ],
    ));
  }

  Column buildTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Bu Hafta",
            style: GoogleFonts.montserrat(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 0,
          endIndent: 200,
          color: Colors.grey,
        ),
      ],
    );
  }

  Padding buildCircularIndicator() {
    var step = 7583;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: CircularPercentIndicator(
        radius: 120.0,
        lineWidth: 10.0,
        percent: int.parse(_steps) > 10000 ? 1 : int.parse(_steps) / 10000,
        animation: true,
        animationDuration: 1000,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.directions_run,
              size: 32,
            ),
            Text(
              _steps,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600, fontSize: 40),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "HEDEF 10.000",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400, fontSize: 12),
              ),
            ),
          ],
        ),
        progressColor: Palette.light,
        backgroundColor: Palette.dark,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
