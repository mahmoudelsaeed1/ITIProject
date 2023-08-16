import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_project/final_project/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_home_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisable = true;
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late SharedPreferences sharedPreferences;
  String? emailError;
  String? passwordError;

  @override
  void initState() {
    super.initState();
    initalGetSavedData();
  }

  void initalGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> checkAccountExistence(String email) async {
    try {
      final List<String> signInMethods =
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (e) {
      print("Error checking account existence: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff35B700),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff35B700),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        focusColor: Color(0xff35B700),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff35B700),), // Change border color when focused
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email address is required";
                        } else if (emailError != null) {
                          return emailError!;
                        }
                        return null;
                      },
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else if (passwordError != null) {
                        return passwordError!;
                      }
                      return null;
                    },
                    controller: passwordTextEditingController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Color(0xff35B700)),
                    obscureText: isVisable,
                    decoration: InputDecoration(

                      labelText: "Password",

                      prefixIcon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff35B700),), // Change border color when focused
                      ),
                      suffixIcon: IconButton(
                        icon: isVisable
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isVisable = !isVisable;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    color: const Color(0xff35B700),
                    child: MaterialButton(
                      onPressed: _login,
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Don't Have an account"),
                      TextButton(
                        onPressed: () {
                          print("register");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(color: Color(0xff35B700)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (formKey.currentState!.validate()) {
      final String email = emailTextEditingController.text;
      final String password = passwordTextEditingController.text;

      bool accountExists = await checkAccountExistence(email);

      if (accountExists) {
        try {
          final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          print(userCredential.user!.email);
          print(userCredential.user!.uid);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainHomePage()),
          );
        } catch (e) {
          print("Error logging in: $e");
          setState(() {
            emailError = null;
            passwordError = "Invalid credentials";
          });
        }
      } else {
        setState(() {
          emailError = "Account does not exist";
          passwordError = null;
        });
      }
    }
  }
}