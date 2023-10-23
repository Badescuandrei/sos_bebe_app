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
      //begin added by George Valentin Iordache
      appBar: AppBar(
        title: const Text('Înapoi'),
        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
        foregroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      //end added by George Valentin Iordache
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //added by George Iordache
              /*Row(
                  children:[ 
                    IconButton(
                      onPressed: (){
                      Navigator.pop(context);
                      //sau Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                      icon: const Icon(Icons.arrow_back),
                      //replace with our own icon data.
                    ),
                    const Text("Back"),
                  ]
              ),
              */ 
              // end added by George Valentin Iordache    
              const SizedBox(height: 10),
              Center(child: Image.asset('./assets/images/Sosbebe.png', 
                height: 102, 
                width: 81)
              ),
              const SizedBox(height: 75),
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
                            color: Color.fromRGBO(205, 211, 223, 1), 
                            //color: Color.fromARGB(255, 14, 190, 127), old
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(205, 211, 223, 1),
                            //color: Color.fromARGB(255, 14, 190, 127), old
                            width: 1.0,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Telefon, e-mail sau utilizator",
                        hintStyle: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300), //added by George Valentin Iordache
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
                          //hintText: "Parola noua", old
                          hintText: "Parolă",
                          hintStyle: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300), //added by George Valentin Iordache

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              //color: Color.fromARGB(255, 14, 190, 127), old
                              color: Color.fromRGBO(205, 211, 223, 1),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              //color: Color.fromARGB(255, 14, 190, 127), old
                              color: Color.fromRGBO(205, 211, 223, 1),
                              width: 1.0,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          //return "Please Enter New Password"; old
                          return "Vă rugăm introduceți o parolă nouă";
                        } else if (value.length < 6) {
                          //return "Password must be at least 6 characters long"; old
                          return "Parola trebuie să aibă cel puțin 6 caractere";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Ai uitat parola?', style: TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w300)),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                    //const Color.fromARGB(255, 14, 190, 127), old
                    minimumSize: const Size.fromHeight(50), // NEW
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text('CONECTARE',
                    //style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20)), old
                    style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18)), //George Valentin Iordache
              ),
              const SizedBox(height: 100),
              // Text("OR", style: GoogleFonts.rubik(color: Colors.black45, fontWeight: FontWeight.w500)), old
              Text("OR", style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w400, fontSize: 14)),
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
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('./assets/images/facebook_icon.png'),
                    const SizedBox(width: 15),
                    Text(
                      "CONECTARE CU FACEBOOK",
                      style: GoogleFonts.rubik(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ],
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
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('./assets/images/google_icon.png'),
                    const SizedBox(width: 15),
                    Text(
                      "CONECTARE CU GOOGLE",
                      style: GoogleFonts.rubik(color: Colors.red, fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ],
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
                    side: const BorderSide( color: Color.fromRGBO(14, 190, 127, 1),
                      //color: Colors.green, old value
                      width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width:45,
                    ),
                    Text(
                      "NU AI CONT?",
                      style: GoogleFonts.rubik(
                        color: const Color.fromRGBO(14, 190, 127, 1),
                        //color: Colors.green, old value
                        fontWeight: FontWeight.w300, fontSize: 16),
                    ),
                    Text(
                      " INSCRIE-TE!",
                      style: GoogleFonts.rubik(
                        color: const Color.fromRGBO(14, 190, 127, 1),
                        //color: Colors.green, old value
                        fontWeight: FontWeight.w400, fontSize: 16),
                    ),                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
