import 'package:flutter/material.dart';
import 'package:parcel_rider/homepage/home.dart';
import 'package:parcel_rider/widgets/custom.dart';

class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                "assets/images/1.png",
                height: 270,
              ),
            ),
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                CustomTextfield(
                  data: Icons.email,
                  controller: emailController,
                  hintText: "Enter Your Email",
                  isObsecre: false,
                ),
                CustomTextfield(
                  data: Icons.lock,
                  controller: passwordController,
                  hintText: "Enter Your Password",
                  isObsecre: true,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Route newRoute = MaterialPageRoute(builder: (_) =>  HomePage());
              Navigator.pushReplacement(context, newRoute);
            },
            child: const Text(
              'Login',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
