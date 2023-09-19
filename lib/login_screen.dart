import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginKey = GlobalKey<FormState>();
  bool isHidden = true;
  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  void passVisibiltyToggle() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(child: Image.asset('./assets/images/Sosbebe.png', height: 180)),
              const SizedBox(height: 30),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (String s) {
                        focusNodePassword.requestFocus();
                      },
                      controller: controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 14, 190, 127),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 14, 190, 127),
                            width: 1.0,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Telefon, e-mail sau utilizator",
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !RegExp(r'.+@.+\.+').hasMatch(value)) {
                          return "Enter a valid Email Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      focusNode: focusNodePassword,
                      controller: controllerPass,
                      obscureText: isHidden,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: passVisibiltyToggle,
                              icon: isHidden ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                          hintText: "Parola noua",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 14, 190, 127),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 14, 190, 127),
                              width: 1.0,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter New Password";
                        } else if (value.length < 6) {
                          return "Password must be atleast 6 characters long";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text('Ai uitat parola?', style: TextStyle(color: Colors.black45)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 14, 190, 127),
                    minimumSize: const Size.fromHeight(50), // NEW
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text('CONECTARE',
                    style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20)),
              ),
              const SizedBox(height: 10),
              Text("OR", style: GoogleFonts.rubik(color: Colors.black45, fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50), // NEW
                    side: const BorderSide(color: Colors.blue, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  "CONECTARE CU FACEBOOK",
                  style: GoogleFonts.rubik(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50), // NEW
                    side: const BorderSide(color: Colors.red, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  "CONECTARE CU GOOGLE",
                  style: GoogleFonts.rubik(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ));
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50), // NEW
                    side: const BorderSide(color: Colors.green, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  "NU AI CONT? INSCRIE-TE!",
                  style: GoogleFonts.rubik(color: Colors.green, fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
