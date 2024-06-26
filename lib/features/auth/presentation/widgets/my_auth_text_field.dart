import 'package:flutter/material.dart';

class MyAuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool secured;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        obscureText: secured,
        controller: controller,
        autofocus: false,
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  const MyAuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.secured = false,
  });
}

class MyAuthPassField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  @override
  State<MyAuthPassField> createState() => _MyAuthPassFieldState();

  const MyAuthPassField({
    super.key,
    required this.controller,
    required this.hintText,
  });
}

class _MyAuthPassFieldState extends State<MyAuthPassField> {
  bool isSecured = true;

  toggleSecure() {
    setState(() {
      isSecured = !isSecured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        obscureText: isSecured,
        controller: widget.controller,
        autofocus: false,
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              toggleSecure();
            },
            icon: Icon(
              isSecured ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          border: InputBorder.none,
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.grey,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
