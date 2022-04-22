import 'package:flutter/material.dart';
import 'package:whenfinish/services/local_storage.dart';
import 'package:whenfinish/services/time_manager.dart';

import 'package:whenfinish/utils/constants.dart';
import 'package:whenfinish/widgets/custom_button.dart';
import 'package:whenfinish/widgets/custom_text.dart';
import 'package:whenfinish/widgets/main_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TimeManagerService _tM = TimeManagerService();

  @override
  void initState() {
    LocalStorageService.initLocal();
    super.initState();
  }

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
            const MainTitle(),
            const SizedBox(height: 50),
            CustomText(
              firstPart: 'started at : ',
              secondPart: _tM.getStartDay,
              fontSize: 35,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              firstPart: 'go home at : ',
              secondPart: _tM.getEndDay,
              fontSize: 35,
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
            if (!_tM.yetBreaked)
              (!_tM.yetSetted)
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
            if (_tM.yetBreaked)
              CustomButton(
                txtButton: 'Refresh day',
                press: () {
                  print("refresh");
                },
              ),
            const SizedBox(height: 50),
            CustomText(
              firstPart: 'break start at : ',
              secondPart: _tM.getStartBreak,
            ),
            const SizedBox(height: 10),
            CustomText(
              firstPart: 'Break finish at : ',
              secondPart: _tM.getEndBreak,
            ),
          ],
        ),
      ),
    );
  }

  startWorkDay() {
    setState(() {
      _tM.setStartWorkDay();
    });
  }

  startBreak() {
    setState(() {
      _tM.setBreakStart();
    });
  }

  finishBreak() {
    setState(() {
      _tM.setBreakFinish();
    });
  }

  refreshDay() {
    _tM.clearAll();
  }
}
