import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/utils/utils_widgets.dart';
import  'package:sos_bebe_app/register_screen.dart';

import  'package:sos_bebe_app/factura_screen.dart';


class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

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
          
        title:Text('Profil',
              style: GoogleFonts.rubik(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: 16, fontWeight: FontWeight.w500),
            ),
        centerTitle: true,
      ),  
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            const IconDateProfil(iconPathPacient: './assets/images/user_profil_icon.png', textNume: 'Cristina Mihalache', textAdresaEmail: 'cristina.24@gmail.com',
              textNumarTelefon: '+40 0770 545 224',),  
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      const SizedBox(width: 45),
                      IconButton(
                      onPressed: () {},
                        icon: Image.asset('./assets/images/doctori_salvati_icon.png'),
                      ),
                      const SizedBox(width: 25),
                      SizedBox(width: 245,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,    
                          children: [
                            Text('Doctori Salvati',
                              style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('./assets/images/doctori_salvati_forward_icon.png'),
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
                              onPressed: () {

                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) 
                                  => const FacturaScreen(tipPlata:'SOS', emailAddressPlata: 'info@sosromania.ro', phoneNumberPlata: '+40 000112112',
                                  textNumeSubiect: 'Istiak Ahmed', tutorId: '135248', emailSubiect: 'istiakahmed194@gmail.com', phoneNumberSubiect: '01521448905',
                                  dataPlatii: 'Iul. 02, 2023', dataPlatiiProcesata: 'Iul. 02, 2023', detaliiFacturaNume: 'Radu Timofte',
                                  detaliiFacturaServicii: 'Pediatrie', detaliiFacturaNumar: '7810',
                                )));

                              },
                              child: 
                              Text('Vezi Plăti',
                                style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
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
                              child: Text('SETARI',
                                style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),  
                    ],
                  ),
                  
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
                    icon: Image.asset(iconPathPacient),
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
      ],
    );
  }
}