import 'package:intl/intl.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sos_bebe_app/confirmare_servicii_screen.dart';
import 'package:sos_bebe_app/initializare_recenzii_old_dart';
import 'package:sos_bebe_app/utils/utils_widgets.dart';
//import 'package:sos_bebe_app/initializare_medici_widget.dart';
//import 'package:sos_bebe_app/profil_screen.dart';
//import 'package:sos_bebe_app/medic_info_screen_old_dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sos_bebe_app/utils_api/classes.dart';

import 'package:sos_bebe_app/utils_api/api_call_functions.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_bebe_app/utils_api/shared_pref_keys.dart' as pref_keys;
import 'package:sos_bebe_app/factura_screen.dart';

import 'package:sos_bebe_app/localizations/1_localizations.dart';


FacturaClientMobile? facturaSelectata;


ApiCallFunctions apiCallFunctions = ApiCallFunctions();

class PlatiScreen extends StatefulWidget {

final List<FacturaClientMobile> listaFacturi;

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



  const PlatiScreen({super.key, required this.eInConsultatie, required this.eDisponibil, required this.likes,
    required this.iconPath, required this.rating, required this.textNume, required this.textSpital, required this.textTipMedic,
    required this.textTitluProfesional, required this.textTitluSpecializare, required this.textExperienta, required this.textLocDeMuncaNume,
    required this.textLocDeMuncaAdresa, required this.textActivitateUtilizatori, required this.textActivitateNumarPacientiAplicatie,
    required this.textActivitateNumarTestimoniale, required this.textActivitateTimpDeRaspuns});
*/

  const PlatiScreen({super.key, required this.listaFacturi});

  @override
  State<PlatiScreen> createState() => _PlatiScreenState();
}

class _PlatiScreenState extends State<PlatiScreen> {

  //ist<FacturaClientMobile>? listaFacturi;


  @override
  void initState() {

    //listaRecenzii = InitializareRecenziiWidget().initList();

    // Do some other stuff
    super.initState();

    //initializeDateFormatting("ro_RO");

  }

  @override
  Widget build(BuildContext context) {

    LocalizationsApp l = LocalizationsApp.of(context)!;

    List<Widget> mywidgets = [];
    //List<NumarPacientiItem> listaFiltrata = filterListByLowerDurata(25);
    //List<NumarPacientiItem> listaFiltrata = filterListByLowerData(DateTime.utc(2023, 2, 1));
    //List<NumarPacientiItem> listaFiltrata = filterListByHigherData(DateTime.utc(2023, 1, 8));
    //List<MedicItem> listaFiltrata = filterListByIntervalData(DateTime.utc(2021, 11, 9), DateTime.utc(2023, 3, 14));

  
    //var length = listaMedici.length;
    //print('Size lista: $length');

    List<FacturaClientMobile> listaFiltrata;

    //print('Lungime lista recenzii: ${listaFiltrata.length}');

    initializeDateFormatting();

    for(int index = 0; index <widget.listaFacturi!.length; index++){
      //print('Aici');
      var item = widget.listaFacturi![index];
      //String dataRo = DateFormat("dd MMMM yyyy", "ro").format(item.dataPlata); //old IGV
      String dataRo = DateFormat(l.platiDateFormat, l.platiLimba).format(item.dataPlata);
      
      String dataRoLuna = dataRo.substring(0,3) + 
            dataRo.substring(3,4).toUpperCase() + 
            dataRo.substring(4);

      print('Aici dataRoLuna: $dataRoLuna');

      if (index < widget.listaFacturi!.length-1)
      //if (index < 2)
      {
        
        mywidgets.add(
          PlatiWidget(id: item.id, textData: dataRoLuna, suma: item.valoareCuTVA,), 
        );
        mywidgets.add(
          const SizedBox(height: 5),
        );
        mywidgets.add(
          customDivider(),
        );

      }
      else if (index == widget.listaFacturi!.length-1)
      //else if (index == 2)
      {
        
        mywidgets.add(
          PlatiWidget(id: item.id, textData: dataRoLuna, suma: item.valoareCuTVA,), 
        );
        mywidgets.add(
          const SizedBox(height: 5),
        );
        mywidgets.add(
          customDivider(),
        );
        mywidgets.add(
          const SizedBox(height: 25),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          //'Înapoi', //old IGV
          l.universalInapoi,
        ),
        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
        foregroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),

            Container(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    //'Plăți', //old IGV
                    l.platiTitlu,
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]
              ),
            ),

            //const HeaderPlatiWidget( titluDataPlatii: 'Data plății', titluSumaPlatii: 'Suma plății',), //old IGV
            HeaderPlatiWidget( titluDataPlatii: l.platiDataPlatiiTitlu, titluSumaPlatii: l.platiSumaPlatiiTitlu,),

            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: 
                    mywidgets,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderPlatiWidget extends StatelessWidget {
  final String titluDataPlatii;
  final String titluSumaPlatii;

  const HeaderPlatiWidget({
    super.key,
    required this.titluDataPlatii,
    required this.titluSumaPlatii,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.only(left:25, top:15, right: 20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(         
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titluDataPlatii,
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    titluSumaPlatii,
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
      );
  }
}

class PlatiWidget extends StatelessWidget {
  final int id;
  final String textData;
  final double suma;

  //bool isInteger(num value) => (value % 1) == 0;

  const PlatiWidget({
    super.key,
    required this.id,
    required this.textData,
    required this.suma,
  });

  Future<FacturaClientMobile?> getDetaliiFactura(int idFactura) async 
  {
  
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    
    String user = prefs.getString('user')??'';
    String userPassMD5 = prefs.getString(pref_keys.userPassMD5)??'';

    facturaSelectata = await apiCallFunctions.getDetaliiFactura(
      pUser: user,
      pParola: userPassMD5,
      pIdFactura: idFactura.toString(),
    );

    print('getDetaliiFactura: $facturaSelectata');

    return facturaSelectata;

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async
      {
                
        facturaSelectata = await getDetaliiFactura(id);

        SharedPreferences prefs = await SharedPreferences.getInstance(); 

        String user = prefs.getString('user')??'';

        if (context.mounted)
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FacturaScreen(user: user, facturaDetalii: facturaSelectata!,
              ),
            )
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left:25, top:15, right: 20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(         
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textData,
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      suma.toString(),
                      style: GoogleFonts.rubik(
                        color: const Color.fromRGBO(103, 114, 148, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),            
      ),
    );
  }
}