import 'package:auth/component/custom_text_form_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen  extends StatefulWidget {
  static const String routeName='register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController= TextEditingController();

  var emailController= TextEditingController();

  var passController= TextEditingController();

  var confirmPassController= TextEditingController();

  var formKy=GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.blueAccent,

     ),body:
      Form(
        key: formKy,
        child: SingleChildScrollView(
          child: Column(

            children: [
              CustomTextFormFeild(label: 'User Name', controller: nameController,validator: (text) {
    if (text == null || text
        .trim()
        .isEmpty) {
    return 'please enter your name';
    }}),
              CustomTextFormFeild(label: 'Email',keyboardType:TextInputType.emailAddress,
    controller: emailController, validator:(text) {
    if (text == null || text
        .trim()
        .isEmpty) {
    return 'please enter your email';
    }
    bool emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    if (!emailValid) {
    return 'please enter a valid email';
    }
    return null;}),
              CustomTextFormFeild(label: 'Password',keyboardType: TextInputType.number, controller: passController, validator:(pass) {
    if (pass == null || pass
        .trim()
        .isEmpty) {
    return 'please enter a password';
    }
    if (pass.length < 6) {
    return 'password should be at least 6 char';
    }
    return null;
    },),
              CustomTextFormFeild(label: 'Confirmation Password',keyboardType: TextInputType.number,
    controller: confirmPassController, validator: (pass) {
    if (pass == null || pass
        .trim()
        .isEmpty) {
    return 'please enter a password';
    }
    if (pass.length < 6) {
    return 'password should be at least 6 char';
    }
    return null;
    },),


              // TextFormField(
              //
              //  // controller: password,
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     label: Text('Password'),
              //   ),
              //
              // ),
              // SizedBox(
              //   height: 20,
              // ),

            ],
          ),
        ),
      ),

    );
  }

  void login() async {
    if (formKy.currentState!.validate() == true) {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );
        // Navigator.of(context).pushNamed(LandingPage.routeName);
        setState(() {});
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        print(e);
      }
      // () {
      //   Navigator.of(context).pushNamed(LandingPage.routeName);
      //   setState(() {});
      //   Navigator.of(context)
      //       .pushNamedAndRemoveUntil(LandingPage.routeName, (route) => false);
      // },
    }
  }
}
