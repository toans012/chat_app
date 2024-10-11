import 'package:flutter/material.dart';

import '../controller/auth_service.dart';


class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final _formKey = GlobalKey<FormState>();
  final _resetKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _resetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  'assets/chat-app-logo-icon.png',
                  fit: BoxFit.cover,
                )),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Wellcome to Appchat',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        const Text('Enter your phone number to continue'),
                        const SizedBox(height: 20),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .9,
                            child: TextFormField(
                              validator: (value) => value!.isEmpty
                                  ? "Email cannot be empty."
                                  : null,
                              controller: _emailController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Email"),
                              ),
                            )),
                        const SizedBox(height: 10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .9,
                            child: TextFormField(
                              validator: (value) => value!.length < 8
                                  ? "Password should have atleast 8 characters."
                                  : null,
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Password"),
                              ),
                            )),
                        Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: const Text("Reset Password"),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                  "Please enter your email we will send a recovery link."),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Form(
                                                key: _resetKey,
                                                child: TextFormField(
                                                  controller: _resetController,
                                                  validator: (value) => value!
                                                          .isEmpty
                                                      ? "Please enter a valid email."
                                                      : null,
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    label: Text("Email"),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Cancel")),
                                            // TextButton(
                                            //     onPressed: () {
                                            //       if (_resetKey.currentState!
                                            //           .validate()) {
                                            //         sendRecoveryMail(
                                            //                 _resetController.text)
                                            //             .then((value) {
                                            //           Navigator.pop(context);
                                            //           if (value) {
                                            //             ScaffoldMessenger.of(
                                            //                     context)
                                            //                 .showSnackBar(
                                            //                     SnackBar(
                                            //               content: Text(
                                            //                 "Recovery Mail Sent",
                                            //                 style: TextStyle(
                                            //                     color:
                                            //                         Colors.white),
                                            //               ),
                                            //               backgroundColor: Colors
                                            //                   .green.shade400,
                                            //             ));
                                            //           } else {
                                            //             ScaffoldMessenger.of(
                                            //                     context)
                                            //                 .showSnackBar(
                                            //                     SnackBar(
                                            //               content: Text(
                                            //                 "Cannot Sent Recovery Mail",
                                            //                 style: TextStyle(
                                            //                     color:
                                            //                         Colors.white),
                                            //               ),
                                            //               backgroundColor:
                                            //                   Colors.red.shade400,
                                            //             ));
                                            //           }
                                            //         });
                                            //       }
                                            //     },
                                            //     child: Text("Send Link"))
                                          ],
                                        ));
                              },
                              child: Text(
                                "Forget Password",
                                style: TextStyle(color: Colors.blue.shade700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          height: 65,
                          width: MediaQuery.of(context).size.width * .9,
                          child: ElevatedButton(
                              onPressed: ()  async {
                                await AuthService.loginWithEmail(
                                    _emailController.text, _passwordController.text)
                                    .then((value) {
                                  if (value == "Login Successful") {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Login Successful")));
                                    Navigator.pushReplacementNamed(context, "/home");
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
                                "Login",
                                style: TextStyle(fontSize: 17),
                              ))),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have and account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/signup");
                              },
                              child: const Text("Sign Up"))
                        ],
                      )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
