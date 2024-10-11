import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../controller/auth_service.dart';
import 

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Form(
            key: _formKey,
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Sign Up",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .9,
                  child: TextFormField(
                    validator: (value) =>
                    value!.isEmpty ? "Name cannot be empty." : null,
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .9,
                  child: TextFormField(
                    validator: (value) =>
                    value!.isEmpty ? "Email cannot be empty." : null,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .9,
                  child: TextFormField(
                    validator: (value) =>
                    value!.length < 8
                        ? "Password should have atleast 8 characters."
                        : null,
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Password"),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 65,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .9,
                  child: ElevatedButton(
                      onPressed: () async {
                        await AuthService.user(
                            _emailController.text, _passwordController.text)
                            .then((value) {
                          if (value == "Account Created") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Account Created")));
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/home", (route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                value,
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red.shade400,
                            ));
                          }
                        });
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 16),
                      ))),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have and account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Login"))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
