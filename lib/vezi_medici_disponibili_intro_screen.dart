import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sos_bebe_app/register_screen.dart';
import 'package:sos_bebe_app/utils/utils_widgets.dart';
import 'package:sos_bebe_app/adauga_metoda_plata_screen.dart';
import  'package:sos_bebe_app/vezi_toti_medicii_screen.dart';

class VeziMediciDisponibiliIntroScreen extends StatelessWidget {
  const VeziMediciDisponibiliIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //begin added by George Valentin Iordache
      appBar: AppBar(
        title: const Text('Înapoi'),
        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
        foregroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      //end added by George Valentin Iordache
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 85),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Colors.white, Colors.transparent],
                            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: 
                          Image.asset(
                                  width: 336,
                                  './assets/images/medici_disponibili_intro_background_image.png'
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Center(child: Image.asset('./assets/images/Sosbebe.png', 
                      height: 102, 
                      width: 81)
                    ),
                  ],
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    const SizedBox(height: 390),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VeziTotiMediciiScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                              //const Color.fromARGB(255, 14, 190, 127), old
                              //minimumSize: const Size.fromHeight(50), // NEW
                              maximumSize: const Size(306, 53),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Vezi medici disponibili',
                                  style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14,)),
                              Image.asset('./assets/images/medici_disponibili_buton_icon.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height:25),
                    SizedBox(
                      width:310,
                      child:AutoSizeText.rich(// old value RichText(
                        TextSpan(
                          style: GoogleFonts.rubik(
                            color: const Color.fromRGBO(103, 114, 148, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: 'Acesta aplicatie doreste sa vina in sprijinul parintilor oferind sfaturi medicale profesioniste, la orice ora din zi sau din noapte.'),
                          ],
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width:310,
                      child:AutoSizeText.rich(// old value RichText(
                        TextSpan(
                          style: GoogleFonts.rubik(
                            color: const Color.fromRGBO(103, 114, 148, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                          children: const <TextSpan>[
                            TextSpan(text: 'Medicii nostri acorda asistenta pediatrica de prima interventie cu scopul de a linisti temerile parintilor si a ameliora sintmomele copiilor pana la un consult in persoana cu medicul pediatru sau de familie.'),
                          ],
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width:310,
                      child:
                      ShaderMask(
                        shaderCallback: (Rect rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white,Colors.white, Colors.transparent,],
                            //stops: [0.0, 0.1, 0.9, 1.0], // 10% purple, 80% transparent, 10% purple
                          ).createShader(rect);
                        },
                        child:AutoSizeText.rich(// old value RichText(
                          TextSpan(
                            style: GoogleFonts.rubik(
                              color: const Color.fromRGBO(103, 114, 148, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            children: const <TextSpan>[
                              TextSpan(text: 'Atentie! In cazul in care viata copilului este in pericol, va rugam sa apelati numarul unic de urgente 112 sau sa va adresati Unitatilor de Primire Urgente.'),
                            ],
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),  
                    ),
                  ],
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
