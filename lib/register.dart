import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/select_service_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final loginKey = GlobalKey<FormState>();
  bool isHidden = true;
  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();
  final controllerNumeComplet = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeNumeComplet = FocusNode();

  void passVisibiltyToggle() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 120),
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
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 14, 190, 127),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
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
                      onFieldSubmitted: (String s) {
                        focusNodePassword.requestFocus();
                      },
                      controller: controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 14, 190, 127),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 14, 190, 127),
                            width: 1.0,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Nume Complet",
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
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 14, 190, 127),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ServiceSelectScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 14, 190, 127),
                    minimumSize: const Size.fromHeight(50), // NEW
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child: Text('ÎNAINTE',
                    style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20)),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                    text:
                        "Dacă te înscrii, îți exprimi acordul cu Condițiile de utilizare. Din Politica de confidențialitate poti afla com colectăm, folosim și distribuim datele tale, iar din Politica de utilizare a modulelor cookie poți afla cum utilizăm modulele cookie și tehnologii similare.",
                    style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontSize: 14,
                    )),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ServiceSelectScreen(),
                      ));
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50), // NEW
                    side: const BorderSide(color: Colors.black, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  "Ai un cont? Conectează-te",
                  style: GoogleFonts.rubik(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
