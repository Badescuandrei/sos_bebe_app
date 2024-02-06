import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import  'package:sos_bebe_app/factura_screen.dart';
import  'package:sos_bebe_app/questionare_screen.dart';

import 'package:sos_bebe_app/localizations/1_localizations.dart';


class PlataRealizataCuSuccesScreen extends StatefulWidget {
  const PlataRealizataCuSuccesScreen({super.key});

  @override
  State<PlataRealizataCuSuccesScreen> createState() => _PlataRealizataCuSuccesScreenState();
}

class _PlataRealizataCuSuccesScreenState extends State<PlataRealizataCuSuccesScreen> {


  @override
  void initState() {
    Timer(const Duration(seconds: 3), (){
      /*
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) 
                          => const FacturaScreen(tipPlata:'SOS', emailAddressPlata: 'info@sosromania.ro', phoneNumberPlata: '+40 000112112',
        textNumeSubiect: 'Istiak Ahmed', tutorId: '135248', emailSubiect: 'istiakahmed194@gmail.com', phoneNumberSubiect: '01521448905',
        dataPlatii: 'Iul. 02, 2023', dataPlatiiProcesata: 'Iul. 02, 2023', detaliiFacturaNume: 'Radu Timofte',
        detaliiFacturaServicii: 'Pediatrie', detaliiFacturaNumar: '7810',
      )));
      */

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) 
                          => const QuestionaireScreen()));

  });
  
  super.initState();

  }

  @override
  Widget build(BuildContext context) {

    LocalizationsApp l = LocalizationsApp.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          //'Înapoi' //old IGV
          l.universalInapoi,
        ),
        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
        foregroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 55),
              Container(
                margin: const EdgeInsets.only(left: 25),
                child:
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Text(
                      //'Plată realizată cu succes', //old IGV
                      l.plataSuccesTitlu,
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width:325,
                    margin: const EdgeInsets.only(left: 25),
                    child: 
                    AutoSizeText.rich(// old value RichText(
                      TextSpan(
                        style: GoogleFonts.rubik(
                          color: const Color.fromRGBO(103, 114, 148, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            //text: 'Vă mulțumim! Detaliile dvs. de plată vor fi trimise la adresa dvs. de e-mail.'
                            text: l.plataSuccesVaMultumimDetalii,
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),  
                ],
              ),
              const SizedBox(height: 90),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    //'Vă mulțumim! ', //old IGV
                    l.plataSuccesVaMultumimSimplu,
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(14, 190, 127, 1), fontSize: 26, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 115),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    //'Vei fi redirectionat ...', //old IGV
                    l.plataSuccesVeiFiRedirectionat,
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
