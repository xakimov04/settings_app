import 'package:dars3/utils/app_constants.dart';
import 'package:dars3/views/screens/home_screen.dart';
import 'package:dars3/views/screens/onboarding.dart';
import 'package:dars3/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundChanged;
  final ValueChanged<String> onLanguageChanged;
  final ValueChanged<Color> onColorChanged;
  final Function(Color, double) onTextChanged;

  const CustomDrawer({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundChanged,
    required this.onLanguageChanged,
    required this.onColorChanged,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 99, 97, 97),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppConstants.appColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Menu",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppConstants.textColor,
                    fontSize: AppConstants.textSize,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return HomeScreen(
                      onThemeChanged: onThemeChanged,
                      onBackgroundChanged: onBackgroundChanged,
                      onLanguageChanged: onLanguageChanged,
                      onColorChanged: onColorChanged,
                      onTextChanged: onTextChanged,
                    );
                  },
                ),
              );
            },
            title: Text(
              "Main page",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppConstants.textColor,
                fontSize: AppConstants.textSize,
              ),
            ),
            trailing: Icon(
              color: AppConstants.textColor,
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen(
                      onThemeChanged: onThemeChanged,
                      onBackgroundChanged: onBackgroundChanged,
                      onLanguageChanged: onLanguageChanged,
                      onColorChanged: onColorChanged,
                      onTextChanged: onTextChanged,
                    );
                  },
                ),
              );
            },
            title: Text(
              "Settings",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppConstants.textColor,
                fontSize: AppConstants.textSize,
              ),
            ),
            trailing: Icon(
              color: AppConstants.textColor,
              Icons.keyboard_arrow_right,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 15, top: MediaQuery.of(context).size.height * 0.45),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.grey),
                side: WidgetStatePropertyAll(
                  BorderSide(),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Onboarding(
                        onThemeChanged: onThemeChanged,
                        onBackgroundChanged: onBackgroundChanged,
                        onLanguageChanged: onLanguageChanged,
                        onColorChanged: onColorChanged,
                        onTextChanged: onTextChanged,
                      );
                    },
                  ),
                );
              },
              child: Text(
                'Log out',
                style: TextStyle(
                  color: AppConstants.textColor,
                  fontSize: AppConstants.textSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
