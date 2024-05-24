import 'package:dars3/utils/app_constants.dart';
import 'package:dars3/views/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Onboarding extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundChanged;
  final ValueChanged<String> onLanguageChanged;
  final ValueChanged<Color> onColorChanged;
  final Function(Color, double) onTextChanged;

  const Onboarding({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundChanged,
    required this.onLanguageChanged,
    required this.onColorChanged,
    required this.onTextChanged,
  });

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<TextEditingController> _textEditingControllersList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://w0.peakpx.com/wallpaper/56/429/HD-wallpaper-apple-iphone-6-lockscreen-logo.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      for (int i = 0;
                          i < _textEditingControllersList.length;
                          i++)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: _textEditingControllersList[i],
                              maxLength: 1,
                              onChanged: (value) {
                                FocusScope.of(context).nextFocus();
                              },
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(color: Colors.red),
                                counterText: '',
                                fillColor:
                                    const Color.fromARGB(255, 231, 231, 230),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      errorMessage = '';
                      List<String> password = AppConstants.password.split('');
                      for (int i = 0;
                          i < _textEditingControllersList.length;
                          i++) {
                        if (password[i] !=
                            _textEditingControllersList[i].text) {
                          errorMessage = 'Invalid password';
                          break;
                        }
                      }
                      if (errorMessage.isEmpty) {
                        Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return HomeScreen(
                                onThemeChanged: widget.onThemeChanged,
                                onBackgroundChanged: widget.onBackgroundChanged,
                                onLanguageChanged: widget.onLanguageChanged,
                                onColorChanged: widget.onColorChanged,
                                onTextChanged: widget.onTextChanged,
                              );
                            },
                          ),
                        );
                      }
                      setState(() {});
                    },
                    child: const Text(
                      'Go to next page',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
