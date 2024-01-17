import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sos_bebe_app/verifica_codul_pacient_screen.dart';
import 'package:sos_bebe_app/utils_api/api_call_functions.dart';
import 'package:http/http.dart' as http;
import 'package:sos_bebe_app/utils_api/classes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_bebe_app/utils_api/shared_pref_keys.dart' as pref_keys;

ApiCallFunctions apiCallFunctions = ApiCallFunctions();

class ResetPasswordPacientScreen extends StatefulWidget {
  const ResetPasswordPacientScreen({super.key});

  @override
  State<ResetPasswordPacientScreen> createState() => _ResetPasswordPacientScreenState();
}

class _ResetPasswordPacientScreenState extends State<ResetPasswordPacientScreen> {
  final resetPasswordKey = GlobalKey<FormState>();
  bool isHidden = true;
  final controllerPhoneEmailUser = TextEditingController();
  //final controllerPass = TextEditingController();
  //final controllerNumeComplet = TextEditingController();

  final FocusNode focusNodePhone = FocusNode();
  //final FocusNode focusNodePassword = FocusNode();
  //final FocusNode focusNodeNumeComplet = FocusNode();

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
                const SizedBox(height: 125),
                Center(
                  child: Text(
                    'Resetează parola',
                    style: GoogleFonts.rubik(
                        color: const Color.fromRGBO(14, 190, 127, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Form(
                  key: resetPasswordKey,
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
                          //focusNodePassword.requestFocus();
                        },
                        controller: controllerPhoneEmailUser,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration( 
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(103, 114, 148, 1),
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
                          fillColor: Colors.white,
                          hintText: "Telefon, e-mail sau utilizator",
                          hintStyle: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300), //added by George Valentin Iordache
                          /*
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: ImageIcon(
                              AssetImage('assets/images/icon_telefon_reseteaza_parola.png'),
                            ), // icon is 48px widget.
                          ),
                          */ //IGV
                        ),
                        validator: (value) {
                          String emailPattern = r'.+@.+\.+';
                          RegExp emailRegExp = RegExp(emailPattern);
                          String phonePattern = r'(^(?:[+0]4)?[0-9]{10}$)';
                          RegExp phoneRegExp = RegExp(phonePattern);
                          //String namePattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
                          //String namePattern = r'^[a-z A-Z,.\-]+$';
                          String userNamePattern = r'^(?=[a-zA-Z][a-zA-Z0-9._]{7,29}$)(?!.*[_.]{2})[^_.].*[^_.]$';
                          RegExp nameRegExp = RegExp(userNamePattern);
                          if (value!.isEmpty || !(emailRegExp.hasMatch(value) || phoneRegExp.hasMatch(value) || nameRegExp.hasMatch(value))) {
                            return "Introduceți un utilizator/email/numar de telefon valabil!";
                          } else {
                            return null;
                          }
                        },
                        /*
                        validator: (value) {
                          //String pattern = r'(^(?:[+0]4)?[0-9]{10,12}$)';
                          String phonePattern = r'(^(?:[+0]4)?[0-9]{10}$)';
                          RegExp phoneRegExp = RegExp(phonePattern);
                          if (value!.isEmpty || (!(value.length != 10) && !(value.length != 12))) {
                            return '"Introduceti un număr de telefon corect"';
                          }
                          else if (!phoneRegExp.hasMatch(value)) {
                            return 'Introduceți un număr de mobil corect';
                          }
                          /*
                          if (value!.isEmpty || ((value.length != 10) && !regExp1.hasMatch(value))) {
                            return '"Introduceti un număr de telefon corect"';
                          }else if (!regExp.hasMatch(value)) {
                            return 'Introduceți un număr de mobil corect';
                          }
                          */
                          return null;
                          /*
                          if (value!.isEmpty || !(value.length != 10)) {
                            return "Introduceti un numar de telefon corect";
                          } else {
                            return null;
                          }*/
                        },
                        */
                      ),
                      //const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 175),
                SizedBox(
                  width: 160,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () async {
                      final isValidForm = resetPasswordKey.currentState!.validate();
                      if (isValidForm) {
                      //Navigator.push(
                          //context,
                          //MaterialPageRoute(
                            //builder: (context) => const ServiceSelectScreen(),
                            //builder: (context) => const TestimonialScreen(),
                          //));

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        //prefs.setString(pref_keys.userPassMD5, controllerEmail.text);

                        String? userPassMD5 = prefs.getString(pref_keys.userPassMD5);

                        ContClientMobile? resGetCont = await apiCallFunctions.getContClient(
                          pUser: controllerPhoneEmailUser.text,
                          pParola: userPassMD5 ?? '',
                        );

                        if (resGetCont != null )
                        {
                          print('register_screen adaugaContClient getContClient id : ${resGetCont!.id} nume : ${resGetCont.nume} prenume : ${resGetCont.prenume} email: ${resGetCont.email} telefon: ${resGetCont.telefon}  user: ${resGetCont.user}');
                        }
                        
                        http.Response? resGetContClient = await apiCallFunctions.trimitePinPentruResetareParolaClient(
                          pUser: controllerPhoneEmailUser.text,
                        );
                        /*                              
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //builder: (context) => const ServiceSelectScreen(),
                            builder: (context) => const VerificaCodulPacientScreen(),
                          ),
                        );
                        */
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                        minimumSize: const Size.fromHeight(50), // NEW
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                    child: Text('Send code',
                        style: GoogleFonts.rubik(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300)),
                  ),
                ),  
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}