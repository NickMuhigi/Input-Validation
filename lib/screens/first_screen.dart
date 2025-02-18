import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: validateName,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: validateEmail,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: validatePhone,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
