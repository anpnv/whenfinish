import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:whenfinish/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String startWorkTime = '';
  late String endWorkTime = '';
  late String startBreakTime = '';
  late String finishBreakTime = '';

  late String durationOfBreak = '';

  late DateTime startDay;
  late DateTime endDay;
  late DateTime breakStart;
  late DateTime breakEnd;

  final DateFormat _formatter = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: primary,
        width: double.infinity,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'no '.toUpperCase(),
                style: TextStyle(
                  color: lightBlue,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'overtime ',
                    style: TextStyle(
                      color: white,
                      fontSize: 50,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: 'go home ',
                    style: TextStyle(
                      color: white,
                      fontSize: 50,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: 'faster'.toUpperCase(),
                    style: TextStyle(
                      color: lightBlue,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            RichText(
              text: TextSpan(
                text: 'started at : '.toUpperCase(),
                style: TextStyle(
                  color: secondary,
                  fontSize: 35,
                ),
                children: [
                  TextSpan(
                    text: startWorkTime,
                    style: TextStyle(
                      color: white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: 'Go home at : '.toUpperCase(),
                style: TextStyle(
                  color: secondary,
                  fontSize: 35,
                ),
                children: [
                  TextSpan(
                    text: endWorkTime,
                    style: TextStyle(
                      color: white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              txtButton: 'Start',
              press: () {
                startWorkDay();
              },
            ),
            const SizedBox(height: 10),
            (startBreakTime.isEmpty && finishBreakTime.isEmpty)
                ? CustomButton(
                    txtButton: 'break',
                    press: () {
                      startBreak();
                    },
                  )
                : CustomButton(
                    txtButton: 'end break',
                    press: () {
                      finishBreak();
                    },
                  ),
            const SizedBox(height: 50),
            RichText(
              text: TextSpan(
                text: 'break start at : '.toUpperCase(),
                style: TextStyle(
                  color: secondary,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: startBreakTime,
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'break finished at : '.toUpperCase(),
                style: TextStyle(
                  color: secondary,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: finishBreakTime,
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  startWorkDay() {
    DateTime now = getCurrentMoment();
    Duration smalsDay = Duration(hours: 7, minutes: 36);
    endWorkDay(now, smalsDay);
    setState(() {
      startDay = now;
      startWorkTime = _formatter.format(now);
    });
  }

  endWorkDay(DateTime moment, Duration duration) {
    DateTime end = moment.add(duration);
    setState(() {
      endDay = end;
      endWorkTime = _formatter.format(end);
    });
  }

  startBreak() {
    DateTime now = getCurrentMoment();
    setState(() {
      breakStart = now;
      startBreakTime = _formatter.format(now);
    });
  }

  finishBreak() {
    DateTime now = getCurrentMoment();
    int difference = now.difference(breakStart).inMinutes;
    DateTime dif = now.add(Duration(minutes: difference));

    setState(() {
      durationOfBreak = '$difference minutes';
      finishBreakTime = _formatter.format(dif);
    });
    endWorkDay(endDay, Duration(minutes: difference));
  }
}

getCurrentMoment() {
  return DateTime.now();
}

class CustomButton extends StatelessWidget {
  final Function() press;
  final String txtButton;
  const CustomButton({Key? key, required this.press, required this.txtButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: lightBlue,
          splashColor: lightBlue,
          borderRadius: BorderRadius.circular(20),
          onTap: press,
          child: Center(
            child: Text(
              txtButton.toUpperCase(),
              style: TextStyle(
                  color: white, fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
