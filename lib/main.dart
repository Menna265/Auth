import 'package:auth/auth/register/reg_screen.dart';
import 'package:flutter/material.dart';

import 'auth/login/log-screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'register',
    routes: {

      'register':(context)=>RegisterScreen(),
    },


  ));
}




