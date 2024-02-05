import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sos_bebe_app/register_screen.dart';
import 'package:sos_bebe_app/utils/utils_widgets.dart';
import 'package:sos_bebe_app/adauga_metoda_plata_screen.dart';

import 'package:sos_bebe_app/localizations/1_localizations.dart';

class ConfirmareServiciiScreen extends StatelessWidget {

  final String pret;

  const ConfirmareServiciiScreen({
    super.key,
    required this.pret,
  });

  @override
  Widget build(BuildContext context) {

    LocalizationsApp l = LocalizationsApp.of(context)!;
    //print('l.confirmareServiciiTitlu ${l.confirmareServiciiTitlu}');

    return Scaffold(
      //begin added by George Valentin Iordache
      appBar: AppBar(
        //title: const Text('Înapoi'), //old IGV
        title: Text(
          //'Înapoi'
          l.universalInapoi,
        ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 55),
              Text(
                //'Confirmă plata', //old IGV
                l.confirmareServiciiTitlu,

                style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w500, fontSize: 18, 
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 325,
                height:100,
                child: Stack(
                  children:[ 
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset('./assets/images/servicii_pediatrie_dreptunghi.png'),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset('./assets/images/servicii_pediatrie_adauga_efect_1.png'),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset('./assets/images/servicii_pediatrie_adauga_efect_2.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height:15),
                            Text(
                              //'Servicii Pediatrie', //old IGV
                              l.confirmareServiciiServiciiPediatrie,
                              style: GoogleFonts.rubik(color:const Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w700, fontSize: 14,),),
                            const SizedBox(height:10),
                            SizedBox(
                              width: 222,
                              child: Text(
                                //'Primiți o recomandare și rețetă medicală', //old IGV
                                l.confirmareServiciiPrimitiRecomandareReteta,
                                maxLines: 2,
                                style: GoogleFonts.rubik(color:const Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w300, fontSize: 13,),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height:20),
                            SizedBox(
                              width: 69,
                              height: 38,
                              child: 
                              Text(
                                pret,
                                //'9.9',
                                style: GoogleFonts.rubik(color:const Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w400, fontSize: 32,),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                const SizedBox(width: 40),
                                Text(
                                  //'RON', //old IGV 
                                  l.confirmareServiciiRON,
                                  style: GoogleFonts.rubik(color:const Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w300, fontSize: 9,),),
                              ],
                            ),
                          ],
                        ),    
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height:35),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width:15),
                  SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          //'Subtotal', //old IGV
                          l.confirmareServiciiSubtotal,
                          style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w400, fontSize: 16,),),
                        Text(
                          //'$pret RON', //old IGV
                          '$pret ${l.confirmareServiciiRON}', 
                          style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w300, fontSize: 14,),),
                      ],
                    ),
                  ),  
                ],
              ),
              const SizedBox(height: 30),
              customDividerConfirmareServicii(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width:15),
                  SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Text(
                          //'Total',  //old IGV
                          l.confirmareServiciiTotal,
                          style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w400, fontSize: 16,),),
                        Text(
                          //'$pret RON', //old IGV
                          '$pret ${l.confirmareServiciiRON}', 
                          style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontWeight: FontWeight.w400, fontSize: 18,),),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdaugaMetodaPlataScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                    //const Color.fromARGB(255, 14, 190, 127), old
                    minimumSize: const Size.fromHeight(50), // NEW
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  //'CONFIRMĂ PLATA', //old IGV
                  l.confirmareServiciiConfirmaPlataButon,
                  style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16,)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
