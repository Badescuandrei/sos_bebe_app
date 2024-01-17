import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sos_bebe_app/succes_pacient_screen.dart';
import 'package:sos_bebe_app/error_pacient_screen.dart';
//import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
//import 'package:pin_code_fields/pin_code_fields.dart';
//import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
//import 'package:auto_size_text/auto_size_text.dart';

class ParolaNouaPacientScreen extends StatefulWidget {
  const ParolaNouaPacientScreen({super.key});

  @override
  State<ParolaNouaPacientScreen> createState() => _ParolaNouaPacientScreenState();
}

class _ParolaNouaPacientScreenState extends State<ParolaNouaPacientScreen> {
  
  final parolaNouaKey = GlobalKey<FormState>();

  bool isHiddenParolaNoua = false;

  bool isHiddenParolaNouaRepetata = false;

  final controllerParolaNoua = TextEditingController();

  final controllerParolaNouaRepetata = TextEditingController();

  final FocusNode focusNodeParolaNoua = FocusNode();
  
  final FocusNode focusNodeParolaNouaRepetata = FocusNode();
  
  void parolaNouaVisibiltyToggle() {
    setState(() {
      isHiddenParolaNoua = !isHiddenParolaNoua;
    });
  }
  
  void parolaNouaRepetataVisibiltyToggle() {

    setState(() {
      isHiddenParolaNouaRepetata = !isHiddenParolaNouaRepetata;
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
                const SizedBox(height: 125),
                Center(
                  child: Text(
                    'Parola nouă',
                    style: GoogleFonts.rubik(
                        color: const Color.fromRGBO(14, 190, 127, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Form(
                  key: parolaNouaKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width:250,
                        child:AutoSizeText.rich(// old value RichText(
                          TextSpan(
                            style: GoogleFonts.rubik(
                              color: const Color.fromRGBO(103, 114, 148, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            children: const <TextSpan>[
                              TextSpan(text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod..'),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),  
                      const SizedBox(height: 35),
                      TextFormField(
                        onFieldSubmitted: (String s) {
                          focusNodeParolaNouaRepetata.requestFocus();
                        },
                        focusNode: focusNodeParolaNoua,
                        controller: controllerParolaNoua,
                        obscureText: isHiddenParolaNoua,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            prefixIcon: const ImageIcon(
                              AssetImage('assets/images/parola_noua_prefix.png'),
                            ),    
                            suffixIcon: IconButton(
                                onPressed: parolaNouaVisibiltyToggle,
                                icon: isHiddenParolaNoua ? const ImageIcon(
                                                    AssetImage('assets/images/password_right_visibility.png'),
                                                  ) : 
                                                  const ImageIcon(
                                                    AssetImage('assets/images/password_right_visibility_off.png'),
                                                  ),
                              ),
                            //hintText: "Parola noua", old
                            hintText: "Parolă",
                            hintStyle: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300), //added by George Valentin Iordache
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 14, 190, 127),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(103, 114, 148, 1),
                                width: 1.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Vă rugăm introduceți o parolă nouă";
                          } else if (value.length < 6) {
                            return "Parola trebuie să aibă cel puțin 6 caractere";
                          } else if ((controllerParolaNoua.value.text).compareTo(controllerParolaNouaRepetata.value.text) != 0) {
                            return "Parola trebuie să fie aceeași în ambele câmpuri";      
                          }
                          else {
                            return null;
                          }
                        },
                      ),  
                      const SizedBox(height: 40), 
                      TextFormField(
                        onFieldSubmitted: (String s) {
                          focusNodeParolaNoua.requestFocus();
                        },
                        focusNode: focusNodeParolaNouaRepetata,
                        controller: controllerParolaNouaRepetata,
                        obscureText: isHiddenParolaNouaRepetata,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            prefixIcon: const ImageIcon(
                              AssetImage('assets/images/parola_noua_prefix.png'),
                            ),    
                            suffixIcon: IconButton(
                                onPressed: parolaNouaRepetataVisibiltyToggle,
                                icon: isHiddenParolaNoua ? const ImageIcon(
                                                    AssetImage('assets/images/password_right_visibility.png'),
                                                  ) : 
                                                  const ImageIcon(
                                                    AssetImage('assets/images/password_right_visibility_off.png'),
                                                  ),
                              ),
                            //hintText: "Parola noua", old
                            hintText: "Repetă noua parolă",
                            hintStyle: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300), //added by George Valentin Iordache
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 14, 190, 127),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(103, 114, 148, 1),//Color.fromARGB(255, 14, 190, 127),
                                width: 1.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Vă rugăm introduceți o parolă nouă";
                          } else if (value.length < 6) {
                            return "Parola trebuie să aibă cel puțin 6 caractere";
                          } else if ((controllerParolaNoua.value.text).compareTo(controllerParolaNouaRepetata.value.text) != 0) {
                            return "Parola trebuie să fie aceeași în ambele câmpuri";      
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                SizedBox(
                  width: 160,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      final isValidForm = parolaNouaKey.currentState!.validate();
                      if (isValidForm) {
                        if(controllerParolaNoua.value.text.length >= 8 && ((controllerParolaNoua.value.text).compareTo(controllerParolaNouaRepetata.value.text) == 0))
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => const ServiceSelectScreen(),
                              builder: (context) => const SuccesPacientScreen(),
                            ) 
                          );
                        }
                        else if (controllerParolaNoua.value.text == controllerParolaNouaRepetata.value.text)
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => const ServiceSelectScreen(),
                              builder: (context) => const ErrorPacientScreen(),
                            ) 
                          );
                        }
                        else if (controllerParolaNoua.value.text == controllerParolaNouaRepetata.value.text)
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => const ServiceSelectScreen(),
                              builder: (context) => const ParolaNouaPacientScreen(),
                            ) 
                          );
                        }
                      }
                      //Navigator.push(
                          //context,
                          //MaterialPageRoute(
                            //builder: (context) => const ServiceSelectScreen(),
                            //builder: (context) => const TestimonialScreen(),
                          //));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                        minimumSize: const Size.fromHeight(50), // NEW
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    child: Text('Confirmă',
                        style: GoogleFonts.rubik(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300)),
                  ),
                ),  
                //const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}