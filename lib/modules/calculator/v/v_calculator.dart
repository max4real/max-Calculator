import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:max_calculator/modules/calculator/c/c_calculator.dart';
import 'package:max_calculator/modules/calculator/w/w_num_button.dart';
import 'package:max_calculator/modules/shared/constants/app_svg.dart';
import 'package:max_calculator/modules/shared/services/theme_services/m_theme_model.dart';
import 'package:max_calculator/modules/shared/services/theme_services/w_custon_theme_builder.dart';
import 'package:get/get.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    CalculatorController controller = Get.put(CalculatorController());
    return CustomThemeBuilder(
      builder: (context, theme, themeController) {
        return Scaffold(
          backgroundColor: theme.background,
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 30,
                      left: (Get.width - 70),
                      child: Obx(
                        () {
                          return Switch(
                            thumbIcon: WidgetStateProperty.all<Icon>(
                              const Icon(Icons.dark_mode_rounded),
                            ),
                            value: controller.isDarkTheme.value,
                            onChanged: (value) {
                              controller.isDarkTheme.value = value;
                              themeController.toggleTheme();
                            },
                            activeColor: theme.onBackground,
                            inactiveThumbColor: theme.sign2,
                            inactiveTrackColor: theme.onBackground,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Obx(
                          () {
                            return AutoSizeText(
                              // controller.formatNumber(
                                controller.strDisplay.value.toString() == ""
                                    ? "0"
                                    : controller.strDisplay.value,
                              // ),
                              style: TextStyle(
                                color: theme.number,
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              minFontSize: 10,
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: theme.onBackground,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      spreadRadius: 4,
                      offset: const Offset(4, 4),
                    )
                  ],
                ),
                child: buildKey(
                  theme: theme,
                  controller: controller,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildKey({
    required ThemeModel theme,
    required CalculatorController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          //row 1
          Row(
            children: [
              CustomNumberButton(
                number: "AC",
                background: theme.numBackground,
                textColor: theme.sign1,
                isSign: false,
                onPress: () {
                  controller.onTapAC();
                },
              ),
              CustomNumberButton(
                number: "+/-",
                background: theme.numBackground,
                textColor: theme.sign1,
                isSign: true,
                svg: AppSvg.plusMinus,
                onPress: () {
                  controller.onTapSign("+/-");
                },
              ),
              CustomNumberButton(
                number: "%",
                background: theme.numBackground,
                textColor: theme.sign1,
                isSign: true,
                svg: AppSvg.persentageSign,
                onPress: () {
                  controller.onTapSign("%");
                },
              ),
              CustomNumberButton(
                number: "/",
                background: theme.numBackground,
                textColor: theme.sign2,
                isSign: true,
                svg: AppSvg.divisionSign,
                onPress: () {
                  controller.onTapSign("/");
                },
              ),
            ],
          ),
          //row 2
          Row(
            children: [
              CustomNumberButton(
                number: "7",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapNumber("7");
                },
              ),
              CustomNumberButton(
                number: "8",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapNumber("8");
                },
              ),
              CustomNumberButton(
                number: "9",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapNumber("9");
                },
              ),
              CustomNumberButton(
                number: "X",
                background: theme.numBackground,
                textColor: theme.sign2,
                isSign: false,
                onPress: () {
                  controller.onTapSign("*");
                },
              ),
            ],
          ),
          //row 3
          Row(
            children: [
              CustomNumberButton(
                number: "4",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapNumber("4");
                },
              ),
              CustomNumberButton(
                number: "5",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapNumber("5");
                },
              ),
              CustomNumberButton(
                number: "6",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapNumber("6");
                },
              ),
              CustomNumberButton(
                number: "-",
                background: theme.numBackground,
                textColor: theme.sign2,
                isSign: true,
                svg: AppSvg.minusSign,
                onPress: () {
                  controller.onTapSign("-");
                },
              ),
            ],
          ),
          //row 3
          Row(
            children: [
              CustomNumberButton(
                number: "1",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapNumber("1");
                },
              ),
              CustomNumberButton(
                number: "2",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapNumber("2");
                },
              ),
              CustomNumberButton(
                number: "3",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapNumber("3");
                },
              ),
              CustomNumberButton(
                number: "+",
                background: theme.numBackground,
                textColor: theme.sign2,
                isSign: true,
                svg: AppSvg.plusSign,
                onPress: () {
                  controller.onTapSign("+");
                },
              ),
            ],
          ),
          //row 4
          Row(
            children: [
              CustomNumberButton(
                number: "<-",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: true,
                svg: AppSvg.backspace,
                onPress: () {
                  controller.onTapBackSpace();
                },
              ),
              CustomNumberButton(
                number: "0",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapNumber("0");
                },
              ),
              CustomNumberButton(
                number: ".",
                background: theme.numBackground,
                textColor: theme.number,
                isSign: false,
                onPress: () {
                  controller.onTapSign(".");
                },
              ),
              CustomNumberButton(
                number: "=",
                background: theme.numBackground,
                textColor: theme.sign2,
                isSign: true,
                svg: AppSvg.equalSign,
                onPress: () {
                  controller.onTapEqual();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// class CalculatorPage extends StatelessWidget {
//   const CalculatorPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CalculatorController controller = Get.put(CalculatorController());

//     // Define button configurations
//     final buttonConfig = [
//       // Row 1
//       [
//         {"text": "AC", "isSign": false},
//         {"text": "+/-", "isSign": true, "svg": AppSvg.plusMinus},
//         {"text": "%", "isSign": true, "svg": AppSvg.persentageSign},
//         {"text": "/", "isSign": true, "svg": AppSvg.divisionSign},
//       ],
//       // Row 2
//       [
//         {"text": "7", "isSign": false},
//         {"text": "8", "isSign": false},
//         {"text": "9", "isSign": false},
//         {"text": "X", "isSign": false},
//       ],
//       // Row 3
//       [
//         {"text": "4", "isSign": false},
//         {"text": "5", "isSign": false},
//         {"text": "6", "isSign": false},
//         {"text": "-", "isSign": true, "svg": AppSvg.minusSign},
//       ],
//       // Row 4
//       [
//         {"text": "1", "isSign": false},
//         {"text": "2", "isSign": false},
//         {"text": "3", "isSign": false},
//         {"text": "+", "isSign": true, "svg": AppSvg.plusSign},
//       ],
//       // Row 5
//       [
//         {"text": "<-", "isSign": true, "svg": AppSvg.backspace},
//         {"text": "0", "isSign": false},
//         {"text": ".", "isSign": false},
//         {"text": "=", "isSign": true, "svg": AppSvg.equalSign},
//       ],
//     ];

//     return CustomThemeBuilder(
//       builder: (context, theme, themeController) {
//         return Scaffold(
//           backgroundColor: theme.background,
//           body: Column(
//             children: [
//               // Display Area
//               Expanded(
//                 flex: 1,
//                 child: Stack(
//                   children: [
//                     // Theme Switch
//                     Positioned(
//                       top: 30,
//                       left: (Get.width - 70),
//                       child: Obx(() {
//                         return Switch(
//                           thumbIcon: WidgetStateProperty.all<Icon>(
//                             const Icon(Icons.dark_mode_rounded),
//                           ),
//                           value: controller.isDarkTheme.value,
//                           onChanged: (value) {
//                             controller.isDarkTheme.value = value;
//                             themeController.toggleTheme();
//                           },
//                           activeColor: theme.onBackground,
//                           inactiveThumbColor: theme.sign2,
//                           inactiveTrackColor: theme.onBackground,
//                         );
//                       }),
//                     ),
//                     // Calculator Output
//                     Positioned(
//                       bottom: 15,
//                       right: 15,
//                       child: Text(
//                         '8000',
//                         style: TextStyle(
//                           color: theme.number,
//                           fontSize: 40,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Button Area
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: theme.onBackground,
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(40),
//                       topRight: Radius.circular(40),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 4,
//                         spreadRadius: 4,
//                         offset: const Offset(4, 4),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       children: buttonConfig.map((row) {
//                         return buildButtonRow(row, theme);
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   /// Builds a row of buttons based on the given configuration.
//   Widget buildButtonRow(
//       List<Map<String, dynamic>> rowConfig, ThemeModel theme) {
//     return Row(
//       children: rowConfig.map((button) {
//         return CustomNumberButton(
//           number: button["text"] as String,
//           background: theme.numBackground,
//           textColor: button["isSign"] ? theme.sign1 : theme.number,
//           isSign: button["isSign"] as bool,
//           svg: button["svg"] as String?,
//           onPress: () {
//             print(button["text"]);
//           },
//         );
//       }).toList(),
//     );
//   }
// }
