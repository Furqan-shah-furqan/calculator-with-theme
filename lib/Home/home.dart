import 'package:calculator/Theme/theme_provider.dart';
import 'package:calculator/Widgets/my_buttons.dart';
import 'package:calculator/Models/calculator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.tertiary;
    return Consumer<Calculator>(
      builder: (context, cal, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            toolbarHeight: 120,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15, top: 15),
                    child: CupertinoSwitch(
                      thumbColor: Theme.of(context).colorScheme.inversePrimary,
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      value:
                          themeProvider.themedata.brightness == Brightness.dark,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:
                              cal.userQuestion.isEmpty
                                  ? Text(
                                    "0",
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: color,
                                    ),
                                  )
                                  : Text(
                                    cal.userQuestion,
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: color,
                                    ),
                                  ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child:
                              cal.userAnswer.isEmpty
                                  ? Text(
                                    "0",
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: color,
                                    ),
                                  )
                                  : Text(
                                    cal.userAnswer,
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: color,
                                    ),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cal.buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return MyButton(
                            text: cal.buttons[index],
                            color: Colors.green.shade200,
                            onTap: () => cal.cTap(),
                          );
                        } else if (index == 1) {
                          return MyButton(
                            text: cal.buttons[index],
                            color: Colors.red.shade200,
                            onTap: () => cal.delTap(),
                          );
                        } else if (cal.buttons[index] == '=') {
                          return MyButton(
                            text: cal.buttons[index],
                            color: Theme.of(context).colorScheme.primary,
                            onTap: () {
                              if (cal.userQuestion.contains('+')) {
                                cal.addition();
                              } else if (cal.userQuestion.contains('-')) {
                                cal.eMinus();
                              } else if (cal.userQuestion.contains('/')) {
                                cal.eDivide();
                              } else if (cal.userQuestion.contains('x')) {
                                cal.eMulti();
                              } else {
                                cal.ePercent();
                              }
                            },
                          );
                        } else {
                          return MyButton(
                            text: cal.buttons[index],
                            color:
                                cal.isOperator(cal.buttons[index])
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(
                                      context,
                                    ).colorScheme.inversePrimary,
                            onTap: () {
                              cal.buttonTap(index);
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
