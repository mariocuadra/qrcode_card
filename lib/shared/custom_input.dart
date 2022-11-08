

import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {

   final TextEditingController nameController;


 const CustomInput(
    {
      
      Key? key,  
      required this.nameController,

    }) : super(key: key);
  

  @override
  State<CustomInput> createState() => _CustomInputState();
 
}

class _CustomInputState extends State<CustomInput> {
 

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {

        setState(() {

                widget.nameController.text = value;
                print('First text field: $widget.nameController.text');
        });
        
      },
    );
  }
}