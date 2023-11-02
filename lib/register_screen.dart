import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/select_service_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

//import 'package:sos_bebe_app/testimonial_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerKey = GlobalKey<FormState>();
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
                const SizedBox(height: 10),
                Center(child: Image.asset('./assets/images/Sosbebe.png', 
                  height: 102, 
                  width: 81)
                ),
                const SizedBox(height: 50),
                Form(
                  key: registerKey,
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
                              color: Color.fromRGBO(205, 211, 223, 1),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(205, 211, 223, 1),
                              width: 1.0,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Telefon, e-mail sau utilizator",
                          hintStyle: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300), //added by George Valentin Iordache
                        ),
                        validator: (value) {
                          String emailPattern = r'.+@.+\.+';
                          RegExp emailRegExp = RegExp(emailPattern);
                          String phonePattern = r'(^(?:[+0]4)?[0-9]{10}$)';
                          RegExp phoneRegExp = RegExp(phonePattern);
                          //String namePattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
                          //String namePattern = r'^[a-z A-Z,.\-]+$';
                          String userNamePattern = r'^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$';
                          RegExp nameRegExp = RegExp(userNamePattern);
                          if (value!.isEmpty || !(emailRegExp.hasMatch(value) || phoneRegExp.hasMatch(value) || nameRegExp.hasMatch(value))) {
                            return "Introduceți un utilizator/email/numar de telefon valabil!";
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
                        controller: controllerNumeComplet,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(205, 211, 223, 1),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(205, 211, 223, 1),
                              width: 1.0,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Nume Complet",
                          hintStyle: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300), //added by George Valentin Iordache
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Vă rugăm introduceți numele complet!";
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
                            //hintText: "Parola noua", old
                            hintText: "Parolă",
                            hintStyle: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300), //added by George Valentin Iordache
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(205, 211, 223, 1),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(205, 211, 223, 1),
                                width: 1.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Vă rugăm introduceți o parolă!";
                          } else if (value.length < 6) {
                            return "Parola trebuie să aibă cel puțin 6 caractere!";
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
                    final isValidForm = registerKey.currentState!.validate();
                    if (isValidForm) {  
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ServiceSelectScreen(),
                          //builder: (context) => const TestimonialScreen(),
                        ));
                    }    
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 14, 190, 127),
                      minimumSize: const Size.fromHeight(50), // NEW
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  child: Text('ÎNAINTE',
                      //style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20)), old
                      style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18)),
                ),
                //const SizedBox(height: 20), old
                const SizedBox(height: 35),

                //  child: 
                AutoSizeText.rich(// old value RichText(
                  TextSpan(
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 12,
                    ),
                    children: const <TextSpan>[
                      TextSpan(text: 'Dacă te înscrii, îți exprimi acordul cu '),
                      TextSpan(text: 'Condițiile de utilizare.', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: 'Din '),
                      TextSpan(text: 'Politica de confidențialitate', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' poți afla cum colectăm, folosim și distribuim datele tale, iar din '),
                      TextSpan(text: 'Politica de utilizare a modulelor cookie', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' poți afla cum utilizăm modulele cookie și tehnologii similare. '),
                    ],
                  ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                //George Valentin Iordache
                //const SizedBox(height: 20),
                const SizedBox(height: 60),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ServiceSelectScreen(),
                      )
                    );
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50), // NEW
                      side: const BorderSide(color: Color.fromRGBO(205, 211, 223, 1), width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  /* old
                  child: Text(
                    "Ai un cont? Conectează-te",
                    style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  */
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Ai un cont? ",
                        style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w300, fontSize: 14)
                      ),
                      Text("Conectează-te",
                        style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w500, fontSize: 14)
                      ),
                    ],
                  ),  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}