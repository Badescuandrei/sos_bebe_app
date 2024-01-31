import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_bebe_app/utils_api/api_call_functions.dart';
import 'package:http/http.dart' as http;
import 'package:sos_bebe_app/utils_api/classes.dart';
import 'package:sos_bebe_app/utils_api/functions.dart';
import 'package:sos_bebe_app/utils_api/shared_pref_keys.dart' as pref_keys;

//import 'package:sos_bebe_app/testimonial_screen.dart';

ApiCallFunctions apiCallFunctions = ApiCallFunctions();

class TestimonialScreen extends StatefulWidget {
  const TestimonialScreen({super.key});

  @override
  State<TestimonialScreen> createState() => _TestimonialScreenState();
}

class _TestimonialScreenState extends State<TestimonialScreen> {
  final registerKey = GlobalKey<FormState>();

  /*
  Future<http.Response?> adaugaContClient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String textMessage = '';
    Color backgroundColor = Colors.red;
    Color textColor = Colors.black;
    
    
    http.Response? res = await apiCallFunctions.getContClient(
      pUser: controllerEmail.text,
      pParola: controllerPass.text,
    );
    */

    /*
    http.Response? resAdaugaCont = await apiCallFunctions.adaugaContClient(
      pNumeComplet: controllerNumeComplet.text,
      pUser: controllerEmail.text,
      pParola: controllerPass.text,
      pDeviceToken: '',
      pTipDispozitiv: '',
    );

    print('adaugaContClient resAdaugaCont.body ${resAdaugaCont!.body}');


    if (int.parse(resAdaugaCont!.body) == 200)
    {

      setState(() {

        registerCorect = true;
        showInainteButton = false;

      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(pref_keys.userEmail, controllerEmail.text);
      //prefs.setString(pref_keys.userPassMD5, controllerEmail.text);

      prefs.setString(pref_keys.userPassMD5, apiCallFunctions.generateMd5(controllerPass.text));

      print('Înregistrare finalizată cu succes!');

      textMessage = 'Înregistrare finalizată cu succes!';
      backgroundColor = const Color.fromARGB(255, 14, 190, 127);
      textColor = Colors.white;
      /*
      if (context.mounted)
      {

        showSnackbar(context, "Înregistrare finalizată cu succes!",const Color.fromARGB(255, 14, 190, 127), Colors.white);

      }

      return resAdaugaCont;
      */

    }
    else if (int.parse(resAdaugaCont.body) == 400)
    {

      
      setState(() {

        registerCorect = false;
        showInainteButton = true;

      });

      print('Apel invalid');

      /*
      if (context.mounted)
      {

        showSnackbar(context, "Apel invalid!", Colors.red, Colors.black);

      }

      return resAdaugaCont;
      */
      textMessage = 'Apel invalid!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resAdaugaCont!.body) == 401)
    {

      prefs.setString(pref_keys.userEmail, controllerEmail.text);
      prefs.setString(pref_keys.userPassMD5, apiCallFunctions.generateMd5(controllerPass.text));
      print('Cont deja existent');

      
      setState(() {

        registerCorect = false;
        showInainteButton = true;

      });

      /*
      if (context.mounted)
      {

        showSnackbar(context, "Cont deja existent!", Colors.red, Colors.black);

      }

      return resAdaugaCont;
      */
      
      textMessage = 'Cont deja existent!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resAdaugaCont!.body) == 405)
    {

      
      setState(() {

        registerCorect = false;
        showInainteButton = true;

      });

      print('Informatii insuficiente');
      
      /*
      if (context.mounted)
      {

        showSnackbar(context, "Informatii insuficiente!", Colors.red, Colors.black);

      }
      
      return resAdaugaCont;
      */
      
      textMessage = 'Informatii insuficiente!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resAdaugaCont!.body) == 500)
    {

      
      setState(() {

        registerCorect = false;
        showInainteButton = true;

      });

      print('A apărut o eroare la execuția metodei');
      
      
      
      textMessage = 'A apărut o eroare la execuția metodei!';
      backgroundColor = Colors.red;
      textColor = Colors.black;
      /*
      if (context.mounted)
      {

        showSnackbar(context, "A apărut o eroare la execuția metodei!", Colors.red, Colors.black);

      }

      return resAdaugaCont;
      */

    }

    if (context.mounted)
    {

      showSnackbar(context, textMessage, backgroundColor, textColor);

      return resAdaugaCont;

    }
    
    return null;

  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context), 
                    icon: const Icon(Icons.arrow_back_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //children: [Text('Vă mulțumim!', style: GoogleFonts.rubik(color: Colors.black87, fontSize: 28))], old
                children: [
                  Text('Vă mulțumim!', 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 26,),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Image.asset('./assets/images/testimonial_icon.png'),
              const SizedBox(height: 110),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Te rugăm să ne lași si un testimonial!',
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 240, 240, 240),
                ),
                height: 130,
                child: const TextField(
                  style: TextStyle(color: Color.fromRGBO(103, 114, 148, 1)), //added by George Valentin Iordache
                  //decoration: InputDecoration(border: InputBorder.none, hintText: 'Doctorul a raspuns rapid...'),
                  decoration: InputDecoration(border: InputBorder.none, 
                    hintText: 'Doctorul a raspuns rapid...',
                    hintStyle: TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300), //added by George Valentin Iordache 
                  ),
                  maxLines: 2,
                )
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const TestimonialScreen();
                  },
                )),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 0, 25, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.green, old
                    color: const Color.fromRGBO(14, 190, 127, 1)
                  ),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        //' TRIMITE CHESTIONARUL', old
                        // style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18), old
                        'TRIMITE TESTIMONIALUL',
                        style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}