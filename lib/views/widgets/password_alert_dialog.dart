import 'package:dars3/utils/app_constants.dart';
import 'package:flutter/material.dart';

class PasswordAlertDialog extends StatefulWidget {
  const PasswordAlertDialog({super.key});

  @override
  State<PasswordAlertDialog> createState() => _PasswordAlertDialogState();
}

class _PasswordAlertDialogState extends State<PasswordAlertDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String newPassword = '';

  String previousPassword = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      title: const Padding(
        padding: EdgeInsets.only(left: 25),
        child: Text(
          'Change password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 137, 170, 187),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Enter password',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter something';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      previousPassword = newValue;
                    }
                  },
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter something';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 137, 170, 187),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Enter your new password',
                  ),
                  onSaved: (newValue) {
                    if (newValue != null) {
                      newPassword = newValue;
                    }
                  },
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (newPassword != previousPassword) {
                  if (previousPassword == AppConstants.password) {
                    AppConstants.password = newPassword;
                    Navigator.of(context).pop();
                  } else {}
                } else {}
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
