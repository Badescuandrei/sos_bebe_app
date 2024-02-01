//import 'package:flutter/cupertino.dart';
//import 'package:lite_rolling_switch/lite_rolling_switch.dart';
//import 'package:sos_bebe_app/testimonial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/payment_screen.dart';
import 'package:sos_bebe_app/utils/utils_widgets.dart';
import 'package:sos_bebe_app/raspunde_intrebare_doar_chat_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_bebe_app/utils_api/shared_pref_keys.dart' as pref_keys;
import 'package:http/http.dart' as http;
import 'package:sos_bebe_app/utils_api/api_call_functions.dart';
import 'package:sos_bebe_app/utils_api/functions.dart';

ApiCallFunctions apiCallFunctions = ApiCallFunctions();

class QuestionaireScreen extends StatefulWidget {
  const QuestionaireScreen({super.key});

  @override
  State<QuestionaireScreen> createState() => _QuestionaireScreenState();
}

class _QuestionaireScreenState extends State<QuestionaireScreen> {
  
  void callbackVisible(bool newIsVisible) 
  {
    setState(() {
      isVisible = newIsVisible;
    });
  }

  void callbackVisibleAlergicLaMedicament(bool newIsVisibleAlergicLaMedicament) 
  {
    setState(() {
      isVisibleAlergicLaMedicament = newIsVisibleAlergicLaMedicament;
    });
  }

  void callbackFebra(bool newIsToggledFebra) 
  {
    setState(() {
      isToggledFebra = newIsToggledFebra;
    });
  }

  void callbackTuse(bool newIsToggledTuse) 
  {
    setState(() {
      isToggledTuse = newIsToggledTuse;
    });
  }

  void callbackDificultatiRespiratorii(bool newIsToggledDificultatiRespiratorii) 
  {
    setState(() {
      isToggledDificultatiRespiratorii = newIsToggledDificultatiRespiratorii;
    });
  }

  void callbackAstenie(bool newIsToggledAstenie) 
  {
    setState(() {
      isToggledAstenie = newIsToggledAstenie;
    });
  }

  void callbackCefalee(bool newIsToggledCefalee) 
  {
    setState(() {
      isToggledCefalee = newIsToggledCefalee;
    });
  }

  void callbackDureriInGat(bool newIsToggledDureriInGat) 
  {
    setState(() {
      isToggledDureriInGat = newIsToggledDureriInGat;
    });
  }

  void callbackGreturiVarsaturi(bool newIsToggledGreturiVarsaturi) 
  {
    setState(() {
      isToggledGreturiVarsaturi = newIsToggledGreturiVarsaturi;
    });
  }

  void callbackDiareeConstipatie(bool newIsToggledDiareeConstipatie) 
  {
    setState(() {
      isToggledDiareeConstipatie = newIsToggledDiareeConstipatie;
    });
  }

  void callbackRefuzulAlimentatie(bool newIsToggledRefuzulAlimentatie) 
  {
    setState(() {
      isToggledRefuzulAlimentatie = newIsToggledRefuzulAlimentatie;
    });
  }

  void callbackIritatiiPiele(bool newIsToggledIritatiiPiele) 
  {
    setState(() {
      isToggledIritatiiPiele = newIsToggledIritatiiPiele;
    });
  }

  void callbackNasInfundat(bool newIsToggledNasInfundat) 
  {
    setState(() {
      isToggledNasInfundat = newIsToggledNasInfundat;
    });
  }

  void callbackRinoree(bool newIsToggledRinoree) 
  {
    setState(() {
      isToggledRinoree = newIsToggledRinoree;
    });
  }
  
  //old IGV
  /*
  void callbackAlergicLaMedicament(String newAlergicLaMedicament) {
    setState(() {
      alergicLaMedicament = newAlergicLaMedicament;
    });
  }
  */

  bool isToggled = false;
  bool isVisible = false;
  bool isVisibleAlergicLaMedicament = false;
  String alergicLaMedicament = '';

  bool isToggledAlergicLaMedicament = false;
  bool isToggledFebra = false;
  bool isToggledTuse = false;
  bool isToggledDificultatiRespiratorii = false;
  bool isToggledAstenie = false;
  bool isToggledCefalee = false;
  bool isToggledDureriInGat = false;
  bool isToggledGreturiVarsaturi = false;
  bool isToggledDiareeConstipatie = false;
  bool isToggledRefuzulAlimentatie = false;
  bool isToggledIritatiiPiele = false;
  bool isToggledNasInfundat = false;
  bool isToggledRinoree = false;
  
  final controllerAlergicLaMedicamentText = TextEditingController();

    
  bool chestionarTrimis = false;
  bool showButonTrimite = true;

  
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    controllerAlergicLaMedicamentText.dispose();

    super.dispose();
  }

  Future<http.Response?> updateChestionarDinContClient() async {
    
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

    String pListaRaspunsuri = '';

    pListaRaspunsuri = '${pListaRaspunsuri}1\$-\$${(isVisibleAlergicLaMedicament? '1' : '2')}\$-\$${(isVisibleAlergicLaMedicament? controllerAlergicLaMedicamentText.text : '')}*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}2\$-\$${(isToggledFebra? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}3\$-\$${(isToggledTuse? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}4\$-\$${(isToggledDificultatiRespiratorii? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}5\$-\$${(isToggledAstenie? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}6\$-\$${(isToggledCefalee? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}7\$-\$${(isToggledDureriInGat? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}8\$-\$${(isToggledGreturiVarsaturi? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}9\$-\$${(isToggledDiareeConstipatie? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}10\$-\$${(isToggledRefuzulAlimentatie? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}11\$-\$${(isToggledIritatiiPiele? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}12\$-\$${(isToggledNasInfundat? '1' : '2')}\$-\$\$-\$*\$*';
    pListaRaspunsuri = '${pListaRaspunsuri}13\$-\$${(isToggledRinoree? '1' : '2')}\$-\$\$-\$*\$*';


    http.Response? resUpdateChestionarDinContClient = await apiCallFunctions.updateChestionarDinContClient(

      pUser: user,
      pParola: userPassMD5,
      pListaRaspunsuri: pListaRaspunsuri,

    );

    print('updateChestionarDinContClient resUpdateChestionarDinContClient.body ${resUpdateChestionarDinContClient!.body} controllerAlergicLaMedicamentText: ${controllerAlergicLaMedicamentText.text} ');

    if (int.parse(resUpdateChestionarDinContClient!.body) == 200)
    {

      setState(() {

        chestionarTrimis = true;
        showButonTrimite = false;

      });

      //SharedPreferences prefs = await SharedPreferences.getInstance();
      //prefs.setString(pref_keys.userPassMD5, controllerEmail.text);

      print('Date chestionar trimise cu succes!');

      textMessage = 'Date chestionar trimise cu succes!';
      backgroundColor = const Color.fromARGB(255, 14, 190, 127);
      textColor = Colors.white;

    }
    else if (int.parse(resUpdateChestionarDinContClient.body) == 400)
    {

      setState(() {

        chestionarTrimis = false;
        showButonTrimite = true;

      });

      print('Apel invalid');

      textMessage = 'Apel invalid!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resUpdateChestionarDinContClient!.body) == 401)
    {

      /*prefs.setString(pref_keys.userEmail, controllerEmail.text);
      prefs.setString(pref_keys.userPassMD5, apiCallFunctions.generateMd5(controllerResetareParola.text));
      */
      print('Datele nu au putut fi trimise!');

      
      setState(() {

        chestionarTrimis = false;
        showButonTrimite = true;

      });
      
      textMessage = 'Datele nu au putut fi trimise!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resUpdateChestionarDinContClient!.body) == 405)
    {

      
      setState(() {

        chestionarTrimis = false;
        showButonTrimite = true;

      });

      print('Informatii insuficiente!');
      
      textMessage = 'Informatii insuficiente!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resUpdateChestionarDinContClient!.body) == 500)
    {

      setState(() {

        chestionarTrimis = false;
        showButonTrimite = true;

      });

      print('A apărut o eroare la execuția metodei!');
      
      textMessage = 'A apărut o eroare la execuția metodei!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }

    if (context.mounted)
    {

      showSnackbar(context, textMessage, backgroundColor, textColor);

      return resUpdateChestionarDinContClient;

    }
    
    return null;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_outlined))
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(children: [
                  //Text('Chestionar', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500)) old

                  //adăugat de George Valentin Iordache
                  Text('Chestionar', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w500)),

                ]),
                const SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  //Text('Nume si prenume pacient', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)), old
                  //Text('Laura Popescu', style: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w400)) old

                  //adăugat de George Valentin Iordache


                  Text('Nume si prenume pacient', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w400)),
                  SizedBox(
                    width: 150.0,
                    child: TextField(
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nume copil',
                        ),
                      ),
                  ),
                  //Text('Laura Popescu', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300)),
                ]),
                customDivider(),
                const SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  //Text('Varsta', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)), old
                  //Text('1 an si 8 luni', style: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w400)) old

                  //adăugat de George Valentin Iordache
                  Text('Varsta', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w400)),
                  //Text('1 an si 8 luni', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300)),
                  SizedBox(
                    width: 150.0,
                    child: TextField(
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Număr ani și număr luni',
                        ),
                      ),
                  ),
                ]),
                customDivider(),
                const SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  // Text('Greutate', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)),
                  // Text('10 kg', style: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w400))

                  //adăugat de George Valentin Iordache
                  Text('Greutate', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w400)),
                  //Text('10 kg', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300))
                                    SizedBox(
                    width: 150.0,
                    child: TextField(
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Număr kilograme',
                        ),
                      ),
                  ),
                ]),
                customDivider(),
                const SizedBox(height: 10),
                TextAndSwitchWidget(isToggled: isVisibleAlergicLaMedicament, disease: "Alergic la vreun medicament?", callback: callbackVisibleAlergicLaMedicament),

                // Column(
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text("Alergic la vreun medicament?",
                //             style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)),
                //         FlutterSwitch(
                //           value: isVisible,
                //           height: 25,
                //           width: 60,
                //           activeColor: const Color.fromARGB(255, 103, 197, 108),
                //           inactiveColor: Colors.grey[200]!,
                //           onToggle: (value) {
                //             setState(() {
                //               isVisible = value;
                //               // ignore: avoid_print
                //               print(isVisible);
                //             });
                //           },
                //         ),
                //       ],
                //     ),
                //     const SizedBox(height: 5),
                //     customDivider(),
                //     const SizedBox(height: 5),
                //   ],
                // ),
                Visibility(
                  //visible: isVisible, //old IGV
                  visible: isVisibleAlergicLaMedicament,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('La ce medicament este alergic?',

                            //style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)), old
                            
                            //adăugat de George Valentin Iordache
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 242, 239, 239),
                        ),
                        height: 70,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          textCapitalization: TextCapitalization.words,
                          controller: controllerAlergicLaMedicamentText,
                          decoration:
                            const InputDecoration(border: InputBorder.none, 
                              hintText: 'Alergic la paracetamol...',
                                //added by George Valentin Iordache
                              hintStyle: TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(children: [
                  //Text('Simptome pacient', style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500)) old

                  //adăugat de George Valentin Iordache
                  Text('Simptome pacient', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w500)),

                ]),
                const SizedBox(height: 15),
                TextAndSwitchWidget(isToggled: isToggledFebra, disease: "Febră", callback: callbackFebra,),
                TextAndSwitchWidget(isToggled: isToggledTuse, disease: "Tuse", callback: callbackTuse,),
                TextAndSwitchWidget(isToggled: isToggledDificultatiRespiratorii, disease: "Dificultăți respiratorii",callback: callbackDificultatiRespiratorii,),
                TextAndSwitchWidget(isToggled: isToggledAstenie, disease: "Astenie", callback: callbackAstenie),
                TextAndSwitchWidget(isToggled: isToggledCefalee, disease: "Cefalee", callback: callbackCefalee),
                TextAndSwitchWidget(isToggled: isToggledDureriInGat, disease: "Dureri în gât", callback: callbackDureriInGat),
                TextAndSwitchWidget(isToggled: isToggledGreturiVarsaturi, disease: "Grețuri/Vărsături", callback: callbackGreturiVarsaturi),
                TextAndSwitchWidget(isToggled: isToggledDiareeConstipatie, disease: "Diaree/Constipație", callback: callbackDiareeConstipatie),
                TextAndSwitchWidget(isToggled: isToggledRefuzulAlimentatie, disease: "Refuzul alimentație", callback: callbackRefuzulAlimentatie),
                TextAndSwitchWidget(isToggled: isToggledIritatiiPiele, disease: "Iritații piele", callback: callbackIritatiiPiele),
                TextAndSwitchWidget(isToggled: isToggledNasInfundat, disease: "Nas înfundat", callback: callbackNasInfundat),
                TextAndSwitchWidget(isToggled: isToggledRinoree, disease: "Rinoree", callback: callbackRinoree),
              ],
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () async { 
              
              setState(() {

                chestionarTrimis = false;
                showButonTrimite = false;

              });

              http.Response? resUpdateChestionarDinContClient;

              resUpdateChestionarDinContClient = await updateChestionarDinContClient();
              
              if(context.mounted)
              {
                if (int.parse(resUpdateChestionarDinContClient!.body) == 200)
                {
                  
                  print('Chestionar trimis cu succes');
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                      //builder: (context) => const ServiceSelectScreen(),
                      //builder: (context) => const TestimonialScreen(),
                    ),
                  );
                  */
                  
                }
                else
                {

                  setState(() {

                    chestionarTrimis = false;
                    showButonTrimite = true;

                  });

                }
              }

              /*
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  //return const PaymentScreen();
                  return const RaspundeIntrebareDoarChatScreen(textNume: '', textIntrebare: '', textRaspuns: '', idMedic: 1,);
                },
              ));
              */

            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: Colors.green,

                color: const Color.fromRGBO(14, 190, 127, 1),//adăugat de George Valentin Iordache

              ),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' TRIMITE CHESTIONARUL',
                    style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          //SizedBox(height: 15), old
          const SizedBox(height: 15),
        ],
      )),
    );
  }

  Divider customDivider() => const Divider(color: Colors.black12, height: 2, thickness: 1);
}

// ignore: must_be_immutable
class TextAndSwitchWidget extends StatefulWidget {
  bool isToggled;
  final Function(bool)? callback;
  final String disease;
  TextAndSwitchWidget({super.key, required this.isToggled, required this.disease, this.callback});

  @override
  State<TextAndSwitchWidget> createState() => _TextAndSwitchWidgetState();
}

class _TextAndSwitchWidgetState extends State<TextAndSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //Text(widget.disease, style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)), old

            Text(widget.disease, style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w400)),

            FlutterSwitch(
              value: widget.isToggled,
              height: 25,
              width: 60,

              //activeColor: const Color.fromARGB(255, 103, 197, 108),

              //added by George Valentin Iordache
              activeColor: const Color.fromRGBO(14, 190, 127, 1),
              
              inactiveColor: Colors.grey[200]!,
              onToggle: (value) {
                if (widget.callback != null) {
                  
                  setState(() {
                    widget.callback!(value);
                  });

                  print('callback ${widget.disease} $value');

                } else {
                  setState(() {
                    widget.isToggled = value;
                    // ignore: avoid_print
                    print(widget.isToggled);
                  });
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        customDivider(),
        const SizedBox(height: 5),
      ],
    );
  }
}
