/* import 'package:flutter/material.dart';
import 'package:qrcode_card/helper/size-config.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return _buildTextField;
  }

  Widget _buildTextField(
      TextEditingController textController, String hintText) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            width: SizeConfig.screenHeight * 0.4,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  textController.text = value;
                });
              },
              textAlign: TextAlign.center,
              controller: textController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 18, color: Colors.black26)),
            )
          )
        );
  }
} */