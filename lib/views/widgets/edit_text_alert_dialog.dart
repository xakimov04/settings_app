import 'package:dars3/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class EditTextAlertDialog extends StatelessWidget {
  final Function(Color, double) onTextChanged;

  EditTextAlertDialog({super.key, required this.onTextChanged});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Color _currentColor = AppConstants.textColor;
  double fontSize = AppConstants.textSize;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      titlePadding: const EdgeInsets.only(left: 90, top: 20),
      title: const Text(
        'Edit text',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter something';
                  } else {
                    try {
                      int.parse(value);
                    } catch (e) {
                      return 'enter number';
                    }
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter new font size',
                ),
                onSaved: (newValue) {
                  if (newValue != null) {
                    fontSize = double.parse(newValue);
                  }
                },
              ),
            ),
            ColorPicker(
              pickerColor: _currentColor,
              onColorChanged: (Color color) {
                _currentColor = color;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              onTextChanged(_currentColor, fontSize);
              Navigator.of(context).pop();
            }
          },
          child: Text(
            'Save',
            style: TextStyle(fontSize: AppConstants.textSize + 2),
          ),
        ),
      ],
    );
  }
}
