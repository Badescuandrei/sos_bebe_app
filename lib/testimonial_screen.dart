import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_bebe_app/utils_api/api_call_functions.dart';
import 'package:http/http.dart' as http;
import 'package:sos_bebe_app/utils_api/classes.dart';
import 'package:sos_bebe_app/login_screen.dart';
import 'package:sos_bebe_app/utils_api/functions.dart';
import 'package:sos_bebe_app/utils_api/shared_pref_keys.dart' as pref_keys;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:sos_bebe_app/localizations/1_localizations.dart';

//import 'package:sos_bebe_app/testimonial_screen.dart';

ApiCallFunctions apiCallFunctions = ApiCallFunctions();

class TestimonialScreen extends StatefulWidget {

  final int idMedic;
  final int idFactura;

  const TestimonialScreen({super.key, required this.idMedic, required this.idFactura});

  @override
  State<TestimonialScreen> createState() => _TestimonialScreenState();
}

class _TestimonialScreenState extends State<TestimonialScreen> {
  final registerKey = GlobalKey<FormState>();

  
  double? _ratingValue = 1.0;
  bool feedbackCorect = false;
  bool showButonTrimiteTestimonial = true;

  final controllerTestimonialText = TextEditingController();

  
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    controllerTestimonialText.dispose();

    super.dispose();
  }


  Future<http.Response?> adaugaFeedbackDinContClient() async {

    LocalizationsApp l = LocalizationsApp.of(context)!;

    SharedPreferences prefs = await SharedPreferences.getInstance();

        
    String user = prefs.getString('user')??'';
    String userPassMD5 = prefs.getString(pref_keys.userPassMD5)??'';

    String textMessage = '';
    Color backgroundColor = Colors.red;
    Color textColor = Colors.black;
    
    
    http.Response? resAdaugaFeedback = await apiCallFunctions.adaugaFeedbackDinContClient(
      pUser: user,
      pParola: userPassMD5,
      pIdMedic: widget.idMedic.toString(),
      pIdFactura: widget.idFactura.toString(),
      pNota: _ratingValue.toString(),
      pComentariu: controllerTestimonialText.toString(),
    );


    print('adaugaFeedbackDinContClient resAdaugaCont.body ${resAdaugaFeedback!.body}');


    if (int.parse(resAdaugaFeedback!.body) == 200)
    {

      setState(() {

        feedbackCorect = true;
        showButonTrimiteTestimonial = false;

      });

      print('Feedback trimis cu succes!');

      //textMessage = 'Feedback trimis cu succes!'; //old IGV
      textMessage = l.testimonialFeedbackTrimisCuSucces;

      backgroundColor = const Color.fromARGB(255, 14, 190, 127);
      textColor = Colors.white;

    }
    else if (int.parse(resAdaugaFeedback.body) == 400)
    {

      
      setState(() {

        feedbackCorect = false;
        showButonTrimiteTestimonial = true;

      });

      print('Apel invalid');

      //textMessage = 'Apel invalid!'; //old IGV

      textMessage = l.testimonialApelInvalid;
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resAdaugaFeedback!.body) == 401)
    {
      
      setState(() {

        feedbackCorect = false;
        showButonTrimiteTestimonial = true;

      });
      
      //textMessage = 'Feedback-ul nu a fost trimis!'; //old IGV
      textMessage = l.testimonialFeedbackNetrimis;
      
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resAdaugaFeedback!.body) == 405)
    {

      setState(() {

        feedbackCorect = false;
        showButonTrimiteTestimonial = true;

      });

      print('Informații insuficiente');
    
      
      //textMessage = 'Informații insuficiente!'; //old IGV

      textMessage = l.testimonialInformatiiInsuficiente;

      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resAdaugaFeedback!.body) == 500)
    {


      setState(() {

        feedbackCorect = false;
        showButonTrimiteTestimonial = true;

      });

      print('A apărut o eroare la execuția metodei');
      
      //textMessage = 'A apărut o eroare la execuția metodei!'; //old IGV

      textMessage = l.testimonialAAparutOEroare;

      backgroundColor = Colors.red;
      textColor = Colors.black;

    }

    if (context.mounted)
    {

      showSnackbar(context, textMessage, backgroundColor, textColor);

      return resAdaugaFeedback;

    }
    
    return null;

  }

  @override
  Widget build(BuildContext context) {

    LocalizationsApp l = LocalizationsApp.of(context)!;

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
                  Text(
                    //'Vă mulțumim!', //old IGV
                    l.testimonialVaMultumim,
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 26,),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Image.asset('./assets/images/testimonial_icon.png'),
              const SizedBox(height: 110),
              Padding(
                padding: const EdgeInsets.only(left:25),
                child: Column(
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          //'Rating', //old IGV
                          l.testimonialRating,
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar(
                            //ignoreGestures: true,
                            initialRating: 0.0,
                            minRating: 1.0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 40,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 5.0),
                            ratingWidget: RatingWidget(
                              full: const Icon(Icons.star, color: Color.fromRGBO(195, 161, 110, 1)),
                              half: const Icon(
                                Icons.star_half,
                                color: Color.fromRGBO(252, 220, 85, 1),
                              ),
                              empty: const Icon(
                                Icons.star_outline,
                                color: Color.fromRGBO(195, 161, 110, 1),
                              )),
                            onRatingUpdate: (value) {
                              setState(() {
                                _ratingValue = value;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      //'Te rugăm să ne lași si un testimonial!', //old IGV
                      l.testimonialTeRugamSaLasiUnTestimonial,
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
                child: TextField(
                  keyboardType: TextInputType.streetAddress,
                  textCapitalization: TextCapitalization.words,
                  controller: controllerTestimonialText,
                  style: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1)), //added by George Valentin Iordache
                  //decoration: InputDecoration(border: InputBorder.none, hintText: 'Doctorul a raspuns rapid...'),
                  decoration: InputDecoration(border: InputBorder.none, 
                    //hintText: 'Doctorul a raspuns rapid...', //old IGV
                    hintText: l.testimonialDoctorulARaspunsHint,
                    hintStyle: const TextStyle(color: Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300), //added by George Valentin Iordache 
                  ),
                  maxLines: 4,
                ),
              ),
              const SizedBox(height: 15),
              
              (!showButonTrimiteTestimonial)? Text(
                //'Se încearcă trimiterea feedback-ului!', //old IGV
                l.testimonialSeIncearcaTrimiterea,
                style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 16, fontWeight: FontWeight.w500),)
              :
              GestureDetector(
                onTap: () async { 

                  setState(() {

                    feedbackCorect = false;
                    showButonTrimiteTestimonial = false;

                  });
                  
                  http.Response? resAdaugaFeedback;
    
                  resAdaugaFeedback = await adaugaFeedbackDinContClient();
                  
                  if(context.mounted)
                  {
                    if (int.parse(resAdaugaFeedback!.body) == 200)
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }
                    else
                    {

                      setState(() {

                        feedbackCorect = false;
                        showButonTrimiteTestimonial = true;

                      });

                    }
                  }

                  /*
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        
                        return const TestimonialScreen(idMedic: 1,);
                      },
                    ));
                  */
                },
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
                        //'TRIMITE TESTIMONIALUL', //old IGV
                        l.testimonialTrimiteTestimonialul,
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