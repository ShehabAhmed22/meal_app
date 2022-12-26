import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const routName = "auth";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormState> key = GlobalKey();



  signIn() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      Navigator.of(context).pushNamed("/");
    });
  }

  singUp() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      Navigator.of(context).pushNamed("auth");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/aa.webp'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hello",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   "Welcome back! Nice to see you again.",
                  //   style: GoogleFonts.robotoCondensed(
                  //     fontSize: 18,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 25,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your  First name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.indigo,
                          ),
                          hintText: "First Name ",
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your  phone';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.phone,
                            color: Colors.indigo,
                          ),
                          hintText: "phone",
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val!.isEmpty || !val.contains("@")) {
                            return 'Please enter your Correct Email';
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: const InputDecoration(
                          icon: Icon(
                           Icons.email,
                            color: Colors.indigo,
                          ),
                          hintText: "Email",
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty || val.length < 8) {
                            return 'Please enter your  Password';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.password_outlined,
                            color: Colors.indigo,
                          ),
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value !=_passwordController.text) {
                            return 'Password not match! ';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.password_outlined,
                            color: Colors.indigo,
                          ),
                          hintText: "Confirm Password",
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                      onPressed: signIn,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Log in',
                            style: GoogleFonts.robotoCondensed(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
