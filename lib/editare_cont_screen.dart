import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/login_screen.dart';
import 'package:sos_bebe_app/utils/utils_widgets.dart';
import  'package:sos_bebe_app/register_screen.dart';

import  'package:sos_bebe_app/factura_screen.dart';

import 'package:sos_bebe_app/utils_api/classes.dart';
import 'package:sos_bebe_app/utils_api/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_bebe_app/utils_api/shared_pref_keys.dart' as pref_keys;
import 'package:http/http.dart' as http;
import 'package:sos_bebe_app/utils_api/api_call_functions.dart';


import 'package:sos_bebe_app/localizations/1_localizations.dart';


ApiCallFunctions apiCallFunctions = ApiCallFunctions();

class EditareContScreen extends StatefulWidget {

//final MedicMobile medicDetalii;
/*
  final bool eInConsultatie;
  final bool eDisponibil;
  final int likes;
  final String iconPath;
  //final String statusIconPath;
  final double rating;
  final String textNume;
  final String textSpital;
  final String textTipMedic;
  final String textTitluProfesional;
  final String textTitluSpecializare;
  final String textExperienta;
  final String textLocDeMuncaNume;
  final String textLocDeMuncaAdresa;
  final String textActivitateUtilizatori;
  final String textActivitateNumarPacientiAplicatie;
  final String textActivitateNumarTestimoniale;
  final String textActivitateTimpDeRaspuns;

  const ProfilDoctorDisponibilitateServiciiScreen({super.key, required this.eInConsultatie, required this.eDisponibil, required this.likes,
    required this.iconPath, required this.rating, required this.textNume, required this.textSpital, required this.textTipMedic,
    required this.textTitluProfesional, required this.textTitluSpecializare, required this.textExperienta, required this.textLocDeMuncaNume,
    required this.textLocDeMuncaAdresa, required this.textActivitateUtilizatori, required this.textActivitateNumarPacientiAplicatie,
    required this.textActivitateNumarTestimoniale, required this.textActivitateTimpDeRaspuns});
*/

  final ContClientMobile? contInfo;

  const EditareContScreen({super.key, required this.contInfo});

  @override
  State<EditareContScreen> createState() => EditareContScreenState();

}

class EditareContScreenState extends State<EditareContScreen> {

  final registerKey = GlobalKey<FormState>();
  bool isHidden = true;
  final controllerEmail = TextEditingController();
  final controllerTelefon = TextEditingController();
  final controllerUser = TextEditingController();
  final controllerNumeComplet = TextEditingController();
  final controllerResetareParola = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeTelefon = FocusNode();
  final FocusNode focusNodeUser = FocusNode();
  final FocusNode focusNodeNumeComplet = FocusNode();
  final FocusNode focusNodeResetareParola = FocusNode();

  
  bool editareContCorecta = false;
  bool showButonSalvare = true;
  
  void passVisibiltyToggle() {
  
    setState(() {
      isHidden = !isHidden;
    });
  
  }

//ContClientMobile? contInfo;

  @override
  void initState() {

    //listaRecenzii = InitializareRecenziiWidget().initList();

    // Do some other stuff
    super.initState();

    //getInfoContProfil();

    print('editare_cont_screen contInfo: ${widget.contInfo}');

    //initializeDateFormatting("ro_RO");

  }

  /*
  getInfoContProfil() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
        
    String user = prefs.getString('user')??'';
    String userPassMD5 = prefs.getString(pref_keys.userPassMD5)??'';

    //ContClientMobile? rezGetContClient= 
    contInfo = await apiCallFunctions.getContClient(
      pUser: user,
      pParola: userPassMD5,
      pDeviceToken: '',
      pTipDispozitiv: '',
    );

    //return rezGetContClient;

  }
  */


  Future<http.Response?> updateDateClient() async {

    LocalizationsApp l = LocalizationsApp.of(context)!;
    
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String user = prefs.getString('user')??'';
    String userPassMD5 = prefs.getString(pref_keys.userPassMD5)??'';

    String textMessage = '';
    Color backgroundColor = Colors.red;
    Color textColor = Colors.black;
    
    /*
    http.Response? res = await apiCallFunctions.getContClient(
      pUser: controllerEmail.text,
      pParola: controllerPass.text,
    );
    */

    http.Response? resUpdateDateClient = await apiCallFunctions.updateDateClient(

      pUser: user,
      pParola: userPassMD5,
      pNumeleComplet: controllerNumeComplet.text,
      pTelefonNou: controllerTelefon.text,
      pAdresaEmailNoua: controllerEmail.text,
      pUserNou: controllerUser.text,

    );

    print('updateDateClient resUpdateDateClient.body ${resUpdateDateClient!.body}');

    if (int.parse(resUpdateDateClient!.body) == 200)
    {

      setState(() {

        editareContCorecta = true;
        showButonSalvare = false;

      });

      //SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(pref_keys.userNumeComplet, controllerNumeComplet.text);
      prefs.setString(pref_keys.userEmail, controllerEmail.text);
      prefs.setString(pref_keys.userTelefon, controllerTelefon.text);
      prefs.setString(pref_keys.user, controllerUser.text);
      //prefs.setString(pref_keys.userPassMD5, controllerEmail.text);

      prefs.setString(pref_keys.userPassMD5, apiCallFunctions.generateMd5(controllerResetareParola.text));

      print('Actualizare date finalizată cu succes!');

      //textMessage = 'Actualizare date finalizată cu succes!';  //old IGV
      textMessage = l.editareContActualizareFinalizataCuSucces;

      backgroundColor = const Color.fromARGB(255, 14, 190, 127);
      textColor = Colors.white;

    }
    else if (int.parse(resUpdateDateClient.body) == 400)
    {

      setState(() {

        editareContCorecta = false;
        showButonSalvare = true;

      });

      print('Apel invalid');

      //textMessage = 'Apel invalid!'; //old IGV
      textMessage = l.editareContApelInvalid;

      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resUpdateDateClient!.body) == 401)
    {

      prefs.setString(pref_keys.userEmail, controllerEmail.text);
      prefs.setString(pref_keys.userPassMD5, apiCallFunctions.generateMd5(controllerResetareParola.text));

      setState(() {

        editareContCorecta = false;
        showButonSalvare = true;

      });

            print('Datele nu au putut fi actualizate!');
      
      //textMessage = 'Datele nu au putut fi actualizate!'; //old IGV
      textMessage = l.editareContDateleNuAuPututFiActualizate;
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resUpdateDateClient!.body) == 405)
    {

      setState(() {

        editareContCorecta = false;
        showButonSalvare = true;

      });

      print('Informații insuficiente!');
      
      //textMessage = 'Informații insuficiente!'; //old IGV
      textMessage = l.editareContInformatiiInsuficiente;
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resUpdateDateClient!.body) == 500)
    {

      setState(() {

        editareContCorecta = false;
        showButonSalvare = true;

      });

      print('A apărut o eroare la execuția metodei');
      
      //textMessage = 'A apărut o eroare la execuția metodei!'; //old IGV
      textMessage = l.editareContEroareLaExecutiaMetodei;
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }

    if (context.mounted)
    {

      showSnackbar(context, textMessage, backgroundColor, textColor);

      return resUpdateDateClient;

    }
    
    return null;

  }

  @override
  Widget build(BuildContext context) {

    LocalizationsApp l = LocalizationsApp.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:const Color.fromRGBO(30, 214, 158, 1),
      appBar: AppBar( 
        toolbarHeight: 90,
        backgroundColor: const Color.fromRGBO(30, 214, 158, 1),
        foregroundColor: Colors.white,
        leading:
          const BackButton(
            color: Colors.white,
          ),
          
        title:Text(
            //'Profilul meu',
              l.editareContProfilulMeuTitlu,
              style: GoogleFonts.rubik(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: 16, fontWeight: FontWeight.w500),
            ),
        centerTitle: true,
      ),  
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            /*
            const IconDateProfil(iconPathPacient: './assets/images/user_profil_icon.png', textNume: 'Cristina Mihalache', textAdresaEmail: 'cristina.24@gmail.com',
              textNumarTelefon: '+40 0770 545 224',),
            */
            IconDateProfil(iconPathPacient: widget.contInfo!.linkPozaProfil??'', textNume: '${widget.contInfo!.prenume} ${widget.contInfo!.nume}', 
              textAdresaEmail: widget.contInfo!.email, textNumarTelefon: widget.contInfo!.telefon,),
            const SizedBox(height:35,),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child:Column(
                children: [
                  const SizedBox(height: 5),
                  Form(
                    key: registerKey,
                    child: 
                    GestureDetector(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 80, left:30, right: 30),
                        child: Column(
                          children: [
                            TextFormField(
                              onFieldSubmitted: (String s) {
                                focusNodeTelefon.requestFocus();
                              },
                              controller: controllerEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Image.asset(
                                  'assets/images/mail_icon.png',
                                  width: 15,
                                  height: 15,    //fit: BoxFit.fill,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(205, 211, 223, 1),
                                  ),
                                ),
                                border: InputBorder.none,
                                /*
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(205, 211, 223, 1),
                                    width: 1.0,
                                  ),
                                ),
                                */
                                filled: true,
                                fillColor: Colors.white,
                                //hintText: "Email", //old IGV
                                hintText: l.editareContEmailHint,
                                hintStyle: const TextStyle(color: Color.fromRGBO(59, 86, 110, 1), fontSize: 14, fontWeight: FontWeight.w400), //added by George Valentin Iordache
                              ),
                              validator: (value) {
                                String emailPattern = r'.+@.+\.+';
                                RegExp emailRegExp = RegExp(emailPattern);
                                //String phonePattern = r'(^(?:[+0]4)?[0-9]{10}$)';
                                //RegExp phoneRegExp = RegExp(phonePattern);
                                //String namePattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
                                //String namePattern = r'^[a-z A-Z,.\-]+$';
                                //String userNamePattern = r'^(?=[a-zA-Z][a-zA-Z0-9._]{7,29}$)(?!.*[_.]{2})[^_.].*[^_.]$';
                                //RegExp nameRegExp = RegExp(userNamePattern);
                                if (value!.isEmpty || !(emailRegExp.hasMatch(value)))
                                // || phoneRegExp.hasMatch(value) || nameRegExp.hasMatch(value))) 
                                {
                                  //return "Introduceți un email valid!"; //old IGV
                                  return l.editareContIntroducetiEmailValid; 
                                } 
                                else 
                                {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            customDividerProfil(),
                            const SizedBox(height: 10),
                            TextFormField(
                              onFieldSubmitted: (String s) {
                                focusNodeUser.requestFocus();
                              },
                              controller: controllerTelefon,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Color.fromRGBO(30, 214, 158, 1),
                                  size: 15,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(205, 211, 223, 1),
                                  ),
                                ),
                                border: InputBorder.none,
                                /*
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(205, 211, 223, 1),
                                    width: 1.0,
                                  ),
                                ),
                                */
                                filled: true,
                                fillColor: Colors.white,
                                //hintText: "Telefon", //old IGV
                                hintText: l.editareContTelefonHint,
                                hintStyle: const TextStyle(color: Color.fromRGBO(59, 86, 110, 1), fontSize: 14, fontWeight: FontWeight.w400), //added by George Valentin Iordache
                              ),
                              validator: (value) {
                                //String emailPattern = r'.+@.+\.+';
                                //RegExp emailRegExp = RegExp(emailPattern);
                                String phonePattern = r'(^(?:[+0]4)?[0-9]{10}$)';
                                RegExp phoneRegExp = RegExp(phonePattern);
                                //String namePattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
                                //String namePattern = r'^[a-z A-Z,.\-]+$';
                                //String userNamePattern = r'^(?=[a-zA-Z][a-zA-Z0-9._]{7,29}$)(?!.*[_.]{2})[^_.].*[^_.]$';
                                //RegExp nameRegExp = RegExp(userNamePattern);
                                //if (value!.isEmpty || !(emailRegExp.hasMatch(value)))
                                // || phoneRegExp.hasMatch(value) || nameRegExp.hasMatch(value))) 
                                if (value!.isEmpty || !(phoneRegExp.hasMatch(value)))
                                {
                                  //return "Introduceți un număr de telefon valid!";
                                  return l.editareContIntroducetiTelefonValid;
                                }
                                else 
                                {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            customDividerProfil(),
                            const SizedBox(height: 10),
                            TextFormField(
                              onFieldSubmitted: (String s) {
                                focusNodeResetareParola.requestFocus();
                              },
                              controller: controllerUser,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Image.asset(
                                  'assets/images/user_icon.png',
                                  width: 15,
                                  height: 15,    //fit: BoxFit.fill,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(205, 211, 223, 1),
                                  ),
                                ),
                                border: InputBorder.none,
                                /*
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(205, 211, 223, 1),
                                    width: 1.0,
                                  ),
                                ),
                                */
                                filled: true,
                                fillColor: Colors.white,
                                //hintText: "User", //old IGV
                                hintText: l.editareContUserHint,
                                hintStyle: const TextStyle(color: Color.fromRGBO(59, 86, 110, 1), fontSize: 14, fontWeight: FontWeight.w400), //added by George Valentin Iordache
                              ),
                              validator: (value) {
                                //String emailPattern = r'.+@.+\.+';
                                //RegExp emailRegExp = RegExp(emailPattern);
                                //String phonePattern = r'(^(?:[+0]4)?[0-9]{10}$)';
                                //RegExp phoneRegExp = RegExp(phonePattern);
                                //String namePattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
                                //String namePattern = r'^[a-z A-Z,.\-]+$';
                                //String userNamePattern = r'^(?=[a-zA-Z][a-zA-Z0-9._]{7,29}$)(?!.*[_.]{2})[^_.].*[^_.]$';
                                //RegExp nameRegExp = RegExp(userNamePattern);
                                if (value!.isEmpty)
                                // || phoneRegExp.hasMatch(value) || nameRegExp.hasMatch(value))) 
                                {
                                  //return "Introduceți un utilizator!";
                                  return l.editareContIntroducetiUtilizator;
                                } 
                                else 
                                {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            customDividerProfil(),
                            const SizedBox(height: 10),
                            TextFormField(
                              onFieldSubmitted: (String s) {
                                focusNodeResetareParola.requestFocus();
                              },
                              controller: controllerNumeComplet,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.account_circle,
                                  color: Color.fromRGBO(30, 214, 158, 1),
                                  size: 15,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(205, 211, 223, 1),
                                  ),
                                ),
                                border: InputBorder.none,
                                /*
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(205, 211, 223, 1),
                                    width: 1.0,
                                  ),
                                ),
                                */
                                filled: true,
                                fillColor: Colors.white,
                                //hintText: "Numele complet", //old IGV
                                hintText: l.editareContNumeleCompletHint,
                                hintStyle: const TextStyle(color: Color.fromRGBO(59, 86, 110, 1), fontSize: 14, fontWeight: FontWeight.w400), //added by George Valentin Iordache
                              ),
                              validator: (value) {
                                //String emailPattern = r'.+@.+\.+';
                                //RegExp emailRegExp = RegExp(emailPattern);
                                //String phonePattern = r'(^(?:[+0]4)?[0-9]{10}$)';
                                //RegExp phoneRegExp = RegExp(phonePattern);
                                //String namePattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
                                //String namePattern = r'^[a-z A-Z,.\-]+$';
                                //String userNamePattern = r'^(?=[a-zA-Z][a-zA-Z0-9._]{7,29}$)(?!.*[_.]{2})[^_.].*[^_.]$';
                                //RegExp nameRegExp = RegExp(userNamePattern);
                                if (value!.isEmpty)
                                // || phoneRegExp.hasMatch(value) || nameRegExp.hasMatch(value))) 
                                {
                                  //return "Introduceți numele complet!"; //old IGV
                                  return l.editareContIntroducetiNumeleComplet;
                                } 
                                else
                                {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            customDividerProfil(),
                            const SizedBox(height: 10),
                            TextFormField(
                              focusNode: focusNodeResetareParola,
                              controller: controllerResetareParola,
                              obscureText: isHidden,
                              decoration: InputDecoration(
                                prefixIcon: Image.asset(
                                  'assets/images/resetare_parola_icon.png',
                                  width: 15,
                                  height: 15,    //fit: BoxFit.fill,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: passVisibiltyToggle,
                                    icon: isHidden ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)),
                                //hintText: "Parola noua", old
                                //hintText: "Resetare parolă", //old IGV
                                hintText: l.editareContResetareParolaHint,
                                hintStyle: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w400), //added by George Valentin Iordache
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(205, 211, 223, 1),
                                  ),
                                ),
                                /*enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(205, 211, 223, 1),
                                    width: 1.0,
                                  ),
                                ),
                                */
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  
                                  //return "Vă rugăm introduceți o parolă!"; //old IGV
                                  return l.editareContVaRugamIntroducetiParola;

                                } else if (value.length < 6) {
                                  //return "Parola trebuie să aibă cel puțin 6 caractere!"; //old IGV
                                  return l.editareContParolaTrebuieSaContina;
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  customDividerProfil(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 284,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {

                              print('editare_cont_screen showButonSalvare = $showButonSalvare editareContCorecta = $editareContCorecta');

                              final isValidForm = registerKey.currentState!.validate();
                              if (isValidForm) {  

                                setState(() {

                                  editareContCorecta = false;
                                  showButonSalvare = false;

                                });

                                http.Response? resUpdateDateClient;

                                resUpdateDateClient = await updateDateClient();
                                
                                if(context.mounted)
                                {
                                  if (int.parse(resUpdateDateClient!.body) == 200)
                                  {
                                    
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                        //builder: (context) => const ServiceSelectScreen(),
                                        //builder: (context) => const TestimonialScreen(),
                                      ),
                                    );
                                    
                                  }
                                  else
                                  {

                                    setState(() {

                                      editareContCorecta = false;
                                      showButonSalvare = true;

                                    });

                                  }
                                }
                              }    
                            },
                            //Navigator.push(
                              //context,
                              //MaterialPageRoute(
                                //builder: (context) => const ServiceSelectScreen(),
                                //builder: (context) => const TestimonialScreen(),
                              //));
                            //Navigator.of(context).popUntil((route) => route.isFirst);

                            //print("pressed on button CONECTARE");
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QuestionaireScreen(),
                              )
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              )
                            );
                            */
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                              minimumSize: const Size.fromHeight(50), // NEW
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),
                          child: 
                          Text(
                            //'Salvare date', //old IGV
                            l.editareContSalvareDate,
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                ],
              ),  
            ),
          ],
        ),
      ),
    );
  }
}

class IconDateProfil extends StatelessWidget {
  
  final String iconPathPacient;
  final String textNume;
  final String textAdresaEmail;
  final String textNumarTelefon;

  const IconDateProfil({super.key, required this.iconPathPacient, required this.textNume, required this.textAdresaEmail,
      required this.textNumarTelefon,
    }
  );

  @override
  Widget build(BuildContext context) {
    return
    Column(
      children: [
      Row(
        children: [
          Column(
            children: [
              Row(
                children:[
                  const SizedBox(width: 30),
                  IconButton(
                    onPressed: () {},
                    icon: iconPathPacient.isNotEmpty? Image.network(iconPathPacient, width:60, height:60):
                      Image.asset('./assets/images/user_fara_poza.png', width:60, height:60 ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( textNume,
                        style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 24, fontWeight: FontWeight.w400),
                      ),
                      Text( textAdresaEmail,
                        style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Text( textNumarTelefon,
                        style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],  
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 25),
  
      ],
    );
  }
}