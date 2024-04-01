import 'package:flutter/material.dart';
import 'dart:io';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/intro_screen.dart';
import 'package:sos_bebe_app/register_screen.dart';
import 'package:sos_bebe_app/reset_password_pacient_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_bebe_app/utils_api/classes.dart';
import 'package:sos_bebe_app/utils_api/functions.dart';
import 'package:sos_bebe_app/utils_api/api_call_functions.dart';
import 'package:sos_bebe_app/utils_api/shared_pref_keys.dart' as pref_keys;
import 'package:http/http.dart' as http;

import 'package:sos_bebe_app/localizations/1_localizations.dart';

ApiCallFunctions apiCallFunctions = ApiCallFunctions();


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginKey = GlobalKey<FormState>();
  bool isHidden = true;
  
  final controllerEmailTelefonUser = TextEditingController();
  final controllerPass = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool requireConsent = false;
  String oneSignalToken = '';
  
  Locale _locale = const Locale('ro', 'RO');
  onLocaleChange(Locale l) {
    setState(() {
      _locale = l;
    });
  }

  

  @override
  void initState() {
    super.initState();
    
    loadLocale();

  }

  Future<void> initOneSignalPlatformState() async 
  {

    if (!mounted) return;

    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.consentRequired(requireConsent);

    OneSignal.initialize("bf049046-edaf-41f1-bb07-e2ac883af161");
    
    oneSignalToken = OneSignal.User.pushSubscription.token?? '';

  }

  loadLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //String? lang = prefs.getString(prefKeys.preferredLanguage); //old Adrian Murgu

    String lang = 'ro';
    // lang = 'en';
    switch (lang) {
      case 'ro':
        _locale = const Locale('ro', 'RO');
        break;
      case 'it':
        _locale = const Locale('it', 'IT');
        break;
      case 'fr':
        _locale = const Locale('fr', 'FR');
        break;
      case 'en':
        _locale = const Locale('en', 'US');
        break;
      default:
        _locale = const Locale('ro', 'RO');
    }

    if (mounted) {
      setState(() {});
    }
  }

  void passVisibiltyToggle() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  login(BuildContext context) async 
  {

    LocalizationsApp l = LocalizationsApp.of(context)!;
    
    String textMesaj = '';
    Color backgroundColor = Colors.red;
    Color textColor = Colors.black;

    String mailTelefonUser = controllerEmailTelefonUser.text;
    String pass = controllerPass.text;

    String userPassMD5 = apiCallFunctions.generateMd5(pass);

//    OneSignal.initialize("bf049046-edaf-41f1-bb07-e2ac883af161");

    //var state = await OneSignal.shared.getDeviceState();

    //String? fcmtoken = state?.pushToken;

    ContClientMobile? resGetCont = await apiCallFunctions.getContClient(
      pUser: mailTelefonUser,
      pParola: userPassMD5,
      //pDeviceToken: '', //old IGV
      pDeviceToken: oneSignalToken,
      pTipDispozitiv: Platform.isAndroid ? '1' : '2',
      pModelDispozitiv: await apiCallFunctions.getDeviceInfo(),
      pTokenVoip: '',
    );

    if (resGetCont != null)
    {
      
      print('login_screen getContClient id : ${resGetCont!.id} nume : ${resGetCont.nume} prenume : ${resGetCont.prenume} email: ${resGetCont.email} telefon: ${resGetCont.telefon}  user: ${resGetCont.user} linkPozaProfil: ${resGetCont.linkPozaProfil}');

      //textMesaj = 'Login realizat cu succes!'; //old IGV
      textMesaj = l.loginLoginCuSucces;
      
      backgroundColor = const Color.fromARGB(255, 14, 190, 127);
      textColor = Colors.white;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(pref_keys.userId, resGetCont.id.toString());
      prefs.setString(pref_keys.userEmail, resGetCont.email);
      prefs.setString(pref_keys.userTelefon, resGetCont.telefon);
      prefs.setString(pref_keys.user, resGetCont.user);
      //prefs.setString(pref_keys.userPassMD5, controllerEmail.text);
      prefs.setString(pref_keys.userPassMD5, userPassMD5);
      prefs.setString(pref_keys.userNume, resGetCont.nume);
      prefs.setString(pref_keys.userPrenume, resGetCont.prenume);

    }
    else
    {
      
      //textMesaj = 'Eroare! Reintroduceți user-ul și parola!'; //old IGV
      textMesaj = l.loginEroareReintroducetiUserParola;
      backgroundColor = Colors.red;
      textColor = Colors.black;
      print('Eroare');

    }
    if (context.mounted)
    {

      showSnackbar(
        context,
        textMesaj,
        backgroundColor,
        textColor,
      );

    }

    return resGetCont;

  }

  @override
  Widget build(BuildContext context) {
    
    LocalizationsApp l = LocalizationsApp.of(context)!;
    
    return Scaffold(
      //begin added by George Valentin Iordache
      /*
      appBar: AppBar(
        title: Text(
          //'Înapoi'
          l.universalInapoi,
        ),
        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
        foregroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      */
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
                key: loginKey,
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (String s) {
                        focusNodePassword.requestFocus();
                      },
                      focusNode: focusNodeEmail,
                      controller: controllerEmailTelefonUser,
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
                        //hintText: "Telefon, e-mail sau utilizator", //old IGV
                        hintText: l.loginTelefonEmailUtilizatorHint,
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
                        //RegExp nameRegExp = RegExp(namePattern);
                        if (value!.isEmpty || !(emailRegExp.hasMatch(value) || phoneRegExp.hasMatch(value) || nameRegExp.hasMatch(value))) {
                          //return "Introduceți un utilizator/email/numar de telefon valabil!"; //old IGV
                          return l.loginMesajIntroducetiUtilizatorEmailTelefon;
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
                          //hintText: "Parolă", //old IGV
                          hintText: l.loginParola,
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
                          //return "Vă rugăm introduceți o parolă nouă"; //old IGV
                          return l.loginMesajIntroducetiParolaNoua;

                        } else if (value.length < 6) {
                          //return "Password must be at least 6 characters long"; old
                          //return "Parola trebuie să aibă cel puțin 6 caractere"; //old IGV
                          return l.loginMesajParolaCelPutin;
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap:()
                    {

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ResetPasswordPacientScreen();
                          //return const PlataEsuataScreen();
                        },
                      ));

                    },
                    child: 
                    Text(
                      //'Ai uitat parola?', //old IGV
                      l.loginAiUitatParola,
                      style: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w300))
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final isValidForm = loginKey.currentState!.validate();
                  if (isValidForm) {
                    print("pressed on button CONECTARE");
                    
                    ContClientMobile? resGetCont = await login(context);

                    if (resGetCont != null)
                    {
                      if (context.mounted)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IntroScreen(),
                          )
                        );
                      }
                    }
                  }
                },  
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                    //const Color.fromARGB(255, 14, 190, 127), old
                    minimumSize: const Size.fromHeight(50), // NEW
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                    //'CONECTARE', //old IGV
                    l.loginConectare,
                    //style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20)), old
                    style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18)), //George Valentin Iordache
              ),
              const SizedBox(height: 100),
              // Text("OR", style: GoogleFonts.rubik(color: Colors.black45, fontWeight: FontWeight.w500)), old
              Text(
                //"OR", //old IGV
                l.loginOr,
                style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w400, fontSize: 14)),
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
                      //"CONECTARE CU FACEBOOK", //old IGV
                      l.loginConectareCuFacebook,
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
                      //"CONECTARE CU GOOGLE", //old IGV
                      l.loginConectareCuGoogle,
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
                      //"NU AI CONT?", //old IGV
                      l.loginNuAiCont,
                      style: GoogleFonts.rubik(
                        color: const Color.fromRGBO(14, 190, 127, 1),
                        fontWeight: FontWeight.w300, fontSize: 16),
                    ),
                    Text(
                      //" INSCRIE-TE!", //old IGV
                      l.loginInscrieTe,
                      style: GoogleFonts.rubik(
                        color: const Color.fromRGBO(14, 190, 127, 1),
                        fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ],
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
