import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sos_bebe_app/succes_pacient_screen.dart';
import 'package:sos_bebe_app/error_pacient_screen.dart';
import 'package:sos_bebe_app/utils_api/functions.dart';
import 'package:sos_bebe_app/utils_api/api_call_functions.dart';
import 'package:http/http.dart' as http;

//import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
//import 'package:pin_code_fields/pin_code_fields.dart';
//import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
//import 'package:auto_size_text/auto_size_text.dart';

ApiCallFunctions apiCallFunctions = ApiCallFunctions();

class ParolaNouaPacientScreen extends StatefulWidget {

  final String user;
  const ParolaNouaPacientScreen({super.key, required this.user});

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

  
    Future<http.Response?> reseteazaParolaClient() async {
      //SharedPreferences prefs = await SharedPreferences.getInstance();

      /*
      http.Response? res = await apiCallFunctions.getContClient(
        pUser: controllerEmail.text,
        pParola: controllerPass.text,
      );
      */

      http.Response? resReseteazaParola = await apiCallFunctions.reseteazaParolaClient(
        pUser: widget.user,
        pNouaParola: controllerParolaNoua.text,
      );

      if (int.parse(resReseteazaParola!.body) == 200)
      {

        //SharedPreferences prefs = await SharedPreferences.getInstance();
        //prefs.setString(pref_keys.userEmail, controllerEmail.text);
        //prefs.setString(pref_keys.userPassMD5, controllerEmail.text);

        //prefs.setString(pref_keys.userPassMD5, apiCallFunctions.generateMd5(controllerPass.text));

        print('Parolă resetată cu succes!');

        
        if (context.mounted)
        {

          showSnackbar(context, "Parolă resetată cu succes!",const Color.fromARGB(255, 14, 190, 127), Colors.white);

        }

        return resReseteazaParola;

      }
      else if (int.parse(resReseteazaParola.body) == 400)
      {

        print('Apel invalid');

        if (context.mounted)
        {

          showSnackbar(context, "Apel invalid!", Colors.red, Colors.black);

        }

        return resReseteazaParola;

      }
      else if (int.parse(resReseteazaParola.body) == 401)
      {

        //prefs.setString(pref_keys.userEmail, controllerEmail.text);
        //prefs.setString(pref_keys.userPassMD5, apiCallFunctions.generateMd5(controllerPass.text));
        print('Eroare la resetare parolă');

        if (context.mounted)
        {

          showSnackbar(context, "Eroare la resetare parolă!", Colors.red, Colors.black);

        }

        return resReseteazaParola;

      }
      else if (int.parse(resReseteazaParola!.body) == 405)
      {
        
        print('Informatii insuficiente');
        if (context.mounted)
        {

          showSnackbar(context, "Informatii insuficiente!", Colors.red, Colors.black);

        }
        
        return resReseteazaParola;

      }
      else if (int.parse(resReseteazaParola!.body) == 500)
      {

        print('A apărut o eroare la execuția metodei');
        if (context.mounted)
        {

          showSnackbar(context, "A apărut o eroare la execuția metodei!", Colors.red, Colors.black);

        }

        return resReseteazaParola;

      }
      
      return null;

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
                    onPressed: () async {
                      final isValidForm = parolaNouaKey.currentState!.validate();
                      if (isValidForm) {

                        http.Response? resReseteazaParola;
          
                        resReseteazaParola = await reseteazaParolaClient();

                        if(context.mounted)
                        {
                          //if (int.parse(resVerificaPin!.body) == 200)
                          //{

                            print('parola_noua_pacient resVerificaPin!.statusCode: ${resReseteazaParola!.statusCode} resVerificaPin!.body: ${resReseteazaParola!.body}');

                          if(controllerParolaNoua.value.text.length >= 7 && ((controllerParolaNoua.value.text).compareTo(controllerParolaNouaRepetata.value.text) == 0))
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
                                builder: (context) => const SuccesPacientScreen(),
                              ) 
                            );
                          }
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