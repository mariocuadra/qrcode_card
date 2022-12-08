import 'package:flutter/material.dart';

class NotificationService{

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message, Color backgroundcolor, Color  styleColor ){


    final snackBar = SnackBar(
      backgroundColor: backgroundcolor,
      
      content: Text(
        message, 
        style: TextStyle(
          color: styleColor,
          fontSize: 20,
          )
          ),
      );

    messengerKey.currentState!.showSnackBar(snackBar);

  }
}