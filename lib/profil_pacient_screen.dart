import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/plati_screen.dart';
import 'package:sos_bebe_app/termeni_si_conditii_screen.dart';
import 'package:sos_bebe_app/utils/utils_widgets.dart';
//import  'package:sos_bebe_app/register_screen.dart';

//import  'package:sos_bebe_app/factura_screen.dart';

import  'package:sos_bebe_app/editare_cont_screen.dart';

import  'package:sos_bebe_app/verifica_pin_sterge_cont_screen.dart';

import 'package:flutter_switch/flutter_switch.dart';

import 'package:sos_bebe_app/utils_api/classes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_bebe_app/utils_api/shared_pref_keys.dart' as pref_keys;
import 'package:sos_bebe_app/utils_api/api_call_functions.dart';

import 'package:sos_bebe_app/utils_api/functions.dart';
import 'package:http/http.dart' as http;

ApiCallFunctions apiCallFunctions = ApiCallFunctions();

class ProfilulMeuPacientScreen extends StatefulWidget {

  final ContClientMobile? contInfo;

  const ProfilulMeuPacientScreen({super.key, required this.contInfo,});

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
  

  @override
  State<ProfilulMeuPacientScreen> createState() => ProfilulMeuPacientScreenState();
}

class ProfilulMeuPacientScreenState extends State<ProfilulMeuPacientScreen> {

  List<FacturaClientMobile> listaFacturi = [];

  bool deconectareActivat = false;

  @override
  void initState() {

    //listaRecenzii = InitializareRecenziiWidget().initList();

    // Do some other stuff
    super.initState();

    //getInfoContProfil();

    print('profil_pacient_screen contInfo: ${widget.contInfo}');

    //initializeDateFormatting("ro_RO");

  }

  void callbackDeconectare(bool newDeconectareActivat) {
    setState(() {
      deconectareActivat = newDeconectareActivat;
    });
  }

  
  getListaFacturi() async 
  {
   
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    
    String user = prefs.getString('user')??'';
    String userPassMD5 = prefs.getString(pref_keys.userPassMD5)??'';

    listaFacturi = await apiCallFunctions.getListaFacturi(
      pUser: user,
      pParola: userPassMD5,
    )?? [];

    print('listaFacturi: $listaFacturi');

  }

  
  Future<http.Response?> trimitePinPentruStergereContClient() async {
      
         
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    
    String user = prefs.getString('user')??'';
    String userPassMD5 = prefs.getString(pref_keys.userPassMD5)??'';

    /*
    http.Response? res = await apiCallFunctions.getContClient(
      pUser: controllerEmail.text,
      pParola: controllerPass.text,
    );
    */

    String textMessage = '';
    Color backgroundColor = Colors.red;
    Color textColor = Colors.black;

    http.Response? resTrimitePinPentruStergere = await apiCallFunctions.trimitePinPentruStergereContClient(
      pUser: user,
      pParola: userPassMD5,
    );

    if (int.parse(resTrimitePinPentruStergere!.body) == 200)
    {

      //SharedPreferences prefs = await SharedPreferences.getInstance();
      //prefs.setString(pref_keys.userEmail, controllerEmail.text);

      //prefs.setString(pref_keys.userPassMD5, apiCallFunctions.generateMd5(controllerPass.text));

      print('Cod trimis cu succes!');

      textMessage = 'Cod trimis cu succes!';
      backgroundColor = const Color.fromARGB(255, 14, 190, 127);
      textColor = Colors.white;
      

    }
    else if (int.parse(resTrimitePinPentruStergere.body) == 400)
    {

      print('Apel invalid');

      textMessage = 'Apel invalid!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resTrimitePinPentruStergere!.body) == 401)
    {

      //prefs.setString(pref_keys.userEmail, controllerEmail.text);
      //prefs.setString(pref_keys.userPassMD5, apiCallFunctions.generateMd5(controllerPass.text));
      print('Cont inexistent');

      textMessage = 'Cont inexistent!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resTrimitePinPentruStergere!.body) == 405)
    {

      
      print('Informatii insuficiente');
      
      textMessage = 'Cont existent dar clientul nu are date de contact!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }
    else if (int.parse(resTrimitePinPentruStergere!.body) == 500)
    {

      print('A apărut o eroare la execuția metodei');

      textMessage = 'A apărut o eroare la execuția metodei!';
      backgroundColor = Colors.red;
      textColor = Colors.black;

    }

    if (context.mounted)
    {

      showSnackbar(context, textMessage, backgroundColor, textColor);

      return resTrimitePinPentruStergere;

    }
  
    return null;

  }

  @override
  Widget build(BuildContext context) {
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
        title:Text('Profilul meu',
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
            IconDateProfil(iconPathPacient: widget.contInfo!.linkPozaProfil??'', textNume: '${widget.contInfo!.prenume} ${widget.contInfo!.nume}', textAdresaEmail: widget.contInfo!.email,
              textNumarTelefon: widget.contInfo!.telefon,),
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      const SizedBox(width: 110),
                      SizedBox(width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,    
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) 
                                  => EditareContScreen(contInfo: widget.contInfo,)
                                  ),
                                );
                              },
                              child: 
                              Text('Editare cont',
                                style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) 
                                  => EditareContScreen(contInfo: widget.contInfo,)
                                  ),
                                );
                              },
                              icon: Image.asset('./assets/images/arrow_right_verde_icon.png'),
                            ),
                          ],
                        ),
                      ),  
                    ],
                  ),
                  const SizedBox(height: 20),
                  customDividerProfil(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      const SizedBox(width: 45),
                      IconButton(
                      onPressed: () {},
                        icon: Image.asset('./assets/images/doctori_salvati_icon.png'),
                      ),
                      const SizedBox(width: 25),
                      SizedBox(width: 240,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,    
                          children: [
                            Text('Doctori Salvati',
                              style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('./assets/images/arrow_right_verde_icon.png'),
                            ),
                          ],
                        ),
                      ),  
                    ],
                  ),
                  const SizedBox(height: 20),
                  customDividerProfil(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      const SizedBox(width: 110),
                      SizedBox(width: 245,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,    
                          children: [
                            TextButton(
                              onPressed: () async {

                                await getListaFacturi();

                                if (context.mounted)
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlatiScreen(listaFacturi: listaFacturi,),
                                    )
                                  );
                                }
                                /*Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) 
                                  => const FacturaScreen(tipPlata:'SOS', emailAddressPlata: 'info@sosromania.ro', phoneNumberPlata: '+40 000112112',
                                  textNumeSubiect: 'Istiak Ahmed', tutorId: '135248', emailSubiect: 'istiakahmed194@gmail.com', phoneNumberSubiect: '01521448905',
                                  dataPlatii: 'Iul. 02, 2023', dataPlatiiProcesata: 'Iul. 02, 2023', detaliiFacturaNume: 'Radu Timofte',
                                  detaliiFacturaServicii: 'Pediatrie', detaliiFacturaNumar: '7810',
                                )));
                                */

                              },
                              child: 
                              Text('Vezi Plăti',
                                style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                            IconButton(
                              onPressed: () async 
                              {
                                await getListaFacturi();
                                if (context.mounted)
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlatiScreen(listaFacturi: listaFacturi,),
                                    )
                                  );
                                }
                              },
                              icon: Image.asset('./assets/images/arrow_right_verde_icon.png'),
                            ),
                          ],
                        ),
                      ),  
                    ],
                  ),
                  const SizedBox(height: 20),
                  customDividerProfil(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      const SizedBox(width: 110),
                      SizedBox(width: 245,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,    
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('GDPR',
                                style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                            
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('./assets/images/arrow_right_verde_icon.png'),
                            ),  
                          ],
                        ),
                      ),  
                    ],
                  ),
                  const SizedBox(height: 20),
                  customDividerProfil(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                      TextButton(
                        onPressed: () async {

                          http.Response? resTrimitePinPentruStergereContClient;
            
                          resTrimitePinPentruStergereContClient = await trimitePinPentruStergereContClient();

                          print('profil_pacient_screen: resTrimitePinPentruStergereContClient!.statusCode: ${resTrimitePinPentruStergereContClient!.statusCode} resTrimitePinPentruStergereContClient!.body: ${resTrimitePinPentruStergereContClient.body}' );
                          
                          if (int.parse(resTrimitePinPentruStergereContClient!.body) == 200)
                          {
                            SharedPreferences prefs = await SharedPreferences.getInstance(); 
    
                            String user = prefs.getString('user')??'';
                            
                            String userPassMD5 = prefs.getString(pref_keys.userPassMD5)??'';
                            
                            print('profil_pacient_screen: resTrimitePinPentruStergereContClient!.statusCode: ${resTrimitePinPentruStergereContClient!.statusCode} resTrimitePinPentruStergereContClient!.body: ${resTrimitePinPentruStergereContClient.body}' );
                            
                            if(context.mounted)
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerificaPinStergeContScreen(user: user, userPassMD5: userPassMD5),
                                  //builder: (context) => const ServiceSelectScreen(),
                                  //builder: (context) => const TestimonialScreen(),
                                ),
                              );
                            }
                          }
                        },
                        child: Text('Dezactivare cont',
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  customDividerProfil(),
                  const SizedBox(height: 20),

                  IconTextAndSwitchWidget(iconPath:'./assets/images/deconectare_icon.png', text: "Deconectare", callback: callbackDeconectare, isToggled: deconectareActivat),
                  /*
                  const SizedBox(height: 20),
                  customDividerProfil(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      const SizedBox(width: 110),
                      SizedBox(width: 245,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,    
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('SETARI',
                                style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),  
                    ],
                  ),
                  */
                  
                  const SizedBox(height: 20),
                  customDividerProfil(),
                  const SizedBox(height: 20),

                  const IconAndText(iconPath: './assets/images/termeni_si_conditii_icon.png', termeniSiConditii:'Termeni și Condiții'),
                  
                  const SizedBox(height: 20),
                  customDividerProfil(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.24),

                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      const SizedBox(width: 120),
                      SizedBox(width: 245,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,    
                          children: [
                            TextButton(
                              onPressed: () {},
                              child:Text(' ',
                                style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),  
                    ],
                  ),
                  
                  */  
                ],
              ),  
            ),
          ],
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class IconTextAndSwitchWidget extends StatefulWidget {

  final String text;
  final String iconPath;
    bool isToggled;
  final Function(bool)? callback;
  IconTextAndSwitchWidget({super.key, required this.text, required this.iconPath, required this.isToggled, this.callback});

  @override
  State<IconTextAndSwitchWidget> createState() => _IconTextAndSwitchWidgetState();
}

class _IconTextAndSwitchWidgetState extends State<IconTextAndSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,

      //Text(widget.disease, style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)), old

      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.09,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(widget.iconPath),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child:
            Text(widget.text, style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400)),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        FlutterSwitch(
          value: widget.isToggled,
          height: 20,
          width: 40,

          //activeColor: const Color.fromARGB(255, 103, 197, 108),

          //added by George Valentin Iordache
          activeColor: const Color.fromRGBO(30, 214, 158, 1),
          
          inactiveColor: Colors.grey[200]!,
          onToggle: (value) {
            if (widget.callback != null) {
              setState(() {
                widget.callback!(value);
              });
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
    );
  }
}

class IconAndText extends StatelessWidget {

  
  final String iconPath;
  final String termeniSiConditii;

  const IconAndText({
    super.key,
    required this.iconPath,
    required this.termeniSiConditii,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,

      //Text(widget.disease, style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w400)), old

      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.08,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TermeniSiConditiiScreen(),
                //builder: (context) => const TestimonialScreen(),
              )
            );
          },
          icon: Image.asset(iconPath),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.0007),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child:
          TextButton(
            onPressed: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermeniSiConditiiScreen(),
                  //builder: (context) => const TestimonialScreen(),
                )
              );
            },
            child: Text(termeniSiConditii, style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
        ),
      ],
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
      
      /*
      SizedBox( 
        width: 140,
        height: 45,
        child:
        OutlinedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ));
          },
          style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              side: const BorderSide( color: Color.fromRGBO(255, 255, 255, 1),
                //color: Colors.green, old value
                width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: 
            Text(
              "Edit Profile",
              style: GoogleFonts.rubik(
                color: const Color.fromRGBO(255, 255, 255, 1),
                //color: Colors.green, old value
                fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
      */  
      ],
    );
  }
}