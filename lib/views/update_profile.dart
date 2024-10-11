import 'package:chatapp/constants/colors.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  CircleAvatar(
                      radius: 120,
                      backgroundImage:
                          const Image(image: AssetImage('assets/user.png')).image),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Icon(Icons.edit_rounded, color: Colors.white,size: 30),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Enter your name'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Expanded(
                  child: TextFormField(
                    enabled: false,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Phone number'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        foregroundColor: Colors.white),
                    child: Text('Update')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
