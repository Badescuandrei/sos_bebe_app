import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PlataRealizataCuSuccesScreen extends StatelessWidget {
  const PlataRealizataCuSuccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Înapoi'),
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
                    Text('Plată realizată cu succes', 
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
                        children: const <TextSpan>[
                          TextSpan(text: 'Vă mulțumim! Detaliile dvs. de plată vor fi trimise la adresa dvs. de e-mail.'),
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
                  Text('Vă mulțumim! ',
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(14, 190, 127, 1), fontSize: 26, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 115),
              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Vei fi redirectionat ...',
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
