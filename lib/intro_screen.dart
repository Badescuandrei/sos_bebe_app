import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:sos_bebe_app/login_screen.dart';
import 'package:sos_bebe_app/vezi_medici_disponibili_intro_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: 
        Stack(
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
                      height: 600,
                      width: 420,
                      './assets/images/splash_background_image.png'
              ),
            ),  
            Column(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Image.asset(
                    width: 140,
                    height:176,
                    './assets/images/Sosbebe.png'),
                ),
                const SizedBox(height: 200),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AutoSizeText.rich(// old value RichText(
                              TextSpan(
                                text: "Găsește cel mai bun Doctor Pediatru!",
                                style: GoogleFonts.rubik(
                                  //color: const Color.fromRGBO(14, 210, 62, 1), old
                                  color: const Color.fromRGBO(14, 190, 127, 1),
                                  // fontSize: 32, old
                                  fontSize: 35,
                                  fontWeight: FontWeight.w400,
                                )),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child:AutoSizeText.rich( 
                              TextSpan(
                                text: "Găsiți cei mai buni medici specialiști pentru copilul dvs.",
                                style: GoogleFonts.rubik(
                                  color: Colors.black,
                                  //fontSize: 18, old
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                )),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                          )),
                        ],
                      ),
                      const SizedBox(height: 30),
                      //Container( old
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size.fromHeight(60),

                                        //backgroundColor: const Color.fromRGBO(14, 210, 62, 1), // old
                                        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                        //shadowColor: const Color.fromRGBO(14, 210, 62, 1), //old
                                        shadowColor: const Color.fromRGBO(14, 190, 127, 1),
                                        elevation: 20.0),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const VeziMediciDisponibiliIntroScreen(),//LoginScreen(),
                                          ));
                                    },
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                                      children: [
                                      const ImageIcon(
                                        AssetImage("./assets/images/babyhead.png"),
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      const SizedBox(width: 20), // give the width that you desire
                                      Text(
                                        "CONTINUĂ",
                                        style: GoogleFonts.rubik(
                                          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
                                          //color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24), old cu mesajul RIGHT OVERFLOW BY 3 PIXELS
                                      ),
                                    ]),
                                  )),
                            ),
                            const SizedBox(
                              width: 130,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
