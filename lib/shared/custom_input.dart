

import 'package:flutter/material.dart';

import '../helper/size-config.dart';

class CustomInput extends StatefulWidget {

   final TextEditingController nameController;
   final String hintText;
   final String datacode;
 const CustomInput(
    {
      
      Key? key,  
      required this.nameController, 
      required this.hintText,
      required this.datacode,
      

    }) : super(key: key);
  

  @override
  State<CustomInput> createState() => _CustomInputState();
 
}

class _CustomInputState extends State<CustomInput> {
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          //width: SizeConfig.screenHeight * 0.4,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
        child: TextField(

          onChanged: (value) {

            

        setState(() {
            
              widget.nameController.text = value;
              print('First text field: $widget.nameController.text');
            
            });
            
          },
          textAlign: TextAlign.center,   
           decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(fontSize: 18, color: Colors.black26)
                      ),
                
          
        ),
      ),
    );
  }
}