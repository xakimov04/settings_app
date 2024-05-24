import 'package:dars3/utils/app_constants.dart';
import 'package:dars3/views/widgets/custom_drawer.dart';
import 'package:dars3/views/widgets/edit_text_alert_dialog.dart';
import 'package:dars3/views/widgets/password_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundChanged;
  final ValueChanged<String> onLanguageChanged;
  final ValueChanged<Color> onColorChanged;
  final Function(Color, double) onTextChanged;

  const SettingsScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundChanged,
    required this.onLanguageChanged,
    required this.onColorChanged,
    required this.onTextChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> _items = ['uz', 'eng', 'rus'];
  String? _selectedItem;
  Color _currentColor = AppConstants.appColor;

  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey,
          titlePadding: const EdgeInsets.only(left: 70, top: 20),
          title: Text(
            'Color picker panel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppConstants.textColor,
              fontSize: AppConstants.textSize,
            ),
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _currentColor,
              onColorChanged: (Color color) {
                _currentColor = color;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.onColorChanged(_currentColor);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppConstants.textColor,
            fontSize: AppConstants.textSize,
          ),
        ),
        actions: [
          DropdownButton(
            hint: Text(AppConstants.language),
            value: _selectedItem,
            onChanged: (value) {
              widget.onLanguageChanged(value ?? '');
            },
            items: _items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      drawer: CustomDrawer(
        onThemeChanged: widget.onThemeChanged,
        onBackgroundChanged: widget.onBackgroundChanged,
        onLanguageChanged: widget.onLanguageChanged,
        onColorChanged: widget.onColorChanged,
        onTextChanged: widget.onTextChanged,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  AppConstants.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 30,
                      color: Colors.grey,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                child: SwitchListTile(
                  value: AppConstants.themeMode == ThemeMode.dark,
                  onChanged: widget.onThemeChanged,
                  title: Text(
                    "Night mode",
                    style: TextStyle(
                      color: AppConstants.textColor,
                      fontSize: AppConstants.textSize,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 30,
                      color: Colors.grey,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    _openColorPicker();
                  },
                  child: Text(
                    'Change color',
                    style: TextStyle(
                      color: AppConstants.textColor,
                      fontSize: AppConstants.textSize,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 30,
                      color: Colors.grey,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const PasswordAlertDialog();
                      },
                    );
                  },
                  child: Text(
                    'Change password',
                    style: TextStyle(
                      color: AppConstants.textColor,
                      fontSize: AppConstants.textSize,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 30,
                      color: Colors.grey,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditTextAlertDialog(
                        onTextChanged: widget.onTextChanged,
                      ),
                    );
                  },
                  child: Text(
                    'Change text style',
                    style: TextStyle(
                      color: AppConstants.textColor,
                      fontSize: AppConstants.textSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
