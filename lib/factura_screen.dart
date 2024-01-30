
import 'dart:math';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:external_path/external_path.dart';

import 'package:sos_bebe_app/testimonial_screen.dart';

import 'package:sos_bebe_app/questionare_screen.dart';
import 'package:sos_bebe_app/utils_api/classes.dart';
import 'package:sos_bebe_app/utils_api/functions.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_bebe_app/utils_api/shared_pref_keys.dart' as pref_keys;

import 'package:flutter_to_pdf/flutter_to_pdf.dart';



class FacturaScreen extends StatefulWidget {
  static const String routeName = '/home';

  final FacturaClientMobile facturaDetalii;
  final String user;
  /*
  final String tipPlata;
  final String emailAddressPlata;
  final String phoneNumberPlata;
  final String textNumeSubiect;
  final String tutorId;
  final String emailSubiect;
  final String phoneNumberSubiect;
  final String dataPlatii;
  final String dataPlatiiProcesata;
  final String detaliiFacturaNume;
  final String detaliiFacturaServicii;
  final String detaliiFacturaNumar;


  const FacturaScreen({super.key, required this.tipPlata, required this.emailAddressPlata, required this.phoneNumberPlata, required this.textNumeSubiect,
    required this.tutorId, required this.emailSubiect, required this.phoneNumberSubiect, required this.dataPlatii, required this.dataPlatiiProcesata,
     required this.detaliiFacturaNume, required this.detaliiFacturaServicii, required this.detaliiFacturaNumar,
     });
  */

  const FacturaScreen({super.key, required this.facturaDetalii, required this.user,});

  @override
  State<FacturaScreen> createState() => _FacturaScreenState();
}

class _FacturaScreenState extends State<FacturaScreen> {

//class FacturaScreen extends StatelessWidget {


  final ScreenshotController _screenshotController = ScreenshotController();

    

    String dataEmitereRo = '';

    String dataPlataRo = '';
  
  @override
  void initState() {

    //listaRecenzii = InitializareRecenziiWidget().initList();

    // Do some other stuff
    super.initState();

    //getInfoContProfil();

    print('factura_screen facturaDetalii: ${widget.facturaDetalii.id}');

    //initializeDateFormatting("ro_RO");

  }
  
  String _getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  // the widget that need to be the one we want to take screenshot
  Widget _widgetScreen() {

    
    initializeDateFormatting();

    String dataEmitereRo = DateFormat("MMM dd. yyyy", "ro").format(widget.facturaDetalii.dataEmitere).capitalizeFirst();

    String dataPlataRo = DateFormat("MMM dd. yyyy", "ro").format(widget.facturaDetalii.dataPlata).capitalizeFirst();
    //dataPlata = widget.facturaDetalii.dataEmitere;
    return 
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height:50
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Factură',
            style: GoogleFonts.rubik(
              color: const Color.fromRGBO(103, 114, 148, 1),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ), 
        Container(
            //margin: EdgeInsets.only(top: 10), //old
            margin: const EdgeInsets.all(30.0),
            //padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(14, 190, 127, 1),),
              borderRadius: BorderRadius.circular(5),
            ),
            child:Padding(
              padding: const EdgeInsets.only(left: 25, right: 35),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  SizedBox(width: 284,
                    child: Text('Plată - SOS', 
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(height:8),
                  /*
                  SizedBox(width: 284,
                    child: Text('Email : ${widget.emailAddressPlata}', 
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ),
                  */
                  SizedBox(width: 284,
                    child: Text('Email : ${widget.facturaDetalii.emailEmitent}', 
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(width: 284,
                    child: Text('Telefon : ${widget.facturaDetalii.telefonEmitent}', 
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              SizedBox(width: 284,
                child: Text('Factură pentru:', 
                  style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height:15
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              /*
              SizedBox(width: 284,
                child: Text(widget.textNumeSubiect, 
                  style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
              */
              SizedBox(width: 284,
                child: Text(widget.facturaDetalii.denumireBeneficiar,
                  style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          const SizedBox(
            height:5
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              SizedBox(width: 284,
                child: Text('User Id: ${widget.user}', 
                  style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          const SizedBox(
            height:5
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              SizedBox(width: 284,
                child: Text('Email: ${widget.facturaDetalii.emailBeneficiar}', 
                  style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          const SizedBox(
            height:5
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              SizedBox(width: 284,
                child: Text('Telefon: ${widget.facturaDetalii.telefonBeneficiar}', 
                  style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          const SizedBox(
            height:20
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              SizedBox(width: 284,
                child: Text('Data plății', 
                  style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height:20
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Data plații', 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  Text(dataPlataRo, 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(
                width: 140,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Procesată', 
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    Text(dataEmitereRo, 
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height:20
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              SizedBox(width: 284,
                child: Text('Detalii factură', 
                  style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height:15
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              SizedBox(width: 284,
                child: Text(widget.facturaDetalii.denumireMedic, 
                  style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          const SizedBox(
            height:5
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              SizedBox(width: 284,
                child: Text('Servicii: ${widget.facturaDetalii.serviciiFactura}', 
                  style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          const SizedBox(
            height:10
          ),

          Padding(
            padding: const EdgeInsets.only(left:55, right:30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 100,
                  child: Text('Număr: ${widget.facturaDetalii.numar}', 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(width: 100,
                  child: Text('Serie: ${widget.facturaDetalii.serie}', 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height:10
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 55,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Valoare cu TVA', 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  /*
                  Text(widget.dataPlatii, 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  */
                  Text(widget.facturaDetalii.valoareCuTVA.toString(), 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Valoare TVA', 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  /*
                  Text(widget.dataPlatii, 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  */
                  Text(widget.facturaDetalii.valoareTVA.toString(), 
                    style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Valoare fără TVA', 
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  /*
                  Text(widget.dataPlatiiProcesata, 
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  */
                  Text(widget.facturaDetalii.valoareFaraTVA.toString(), 
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
        const SizedBox(
          height:35
        ),
      ],
    );
  }


  // Take a screenshot
  _takeScreenshot(BuildContext context) {
    Widget container = _widgetScreen();
    _screenshotController
        .captureFromWidget(
            InheritedTheme.captureAll(context, Material(child: container)),
            delay: const Duration(seconds: 1))
        .then((capturedImage) {
      _exportScreenshotToPdf(context, capturedImage);
    });
  }

  // Export the screenshot as pdf
  Future<dynamic> _exportScreenshotToPdf(
      BuildContext context, Uint8List screenShot) async {
    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Expanded(
            child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain),
          );
        },
      ),
    );
    //Directory documentDirectory = await getApplicationDocumentsDirectory();
    //String documentPath = documentDirectory.path;

    String path;
    path = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    print(path);

    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(now);


    // ignore_for_file: avoid_print 
    print('$path/${'${_getRandomString(10)}-'}$formatted.pdf');
    File pdfFile = File(
        '$path/${'${_getRandomString(10)}-'}$formatted.pdf');
    pdfFile.writeAsBytesSync(await pdf.save());
  }


  @override
  Widget build(BuildContext context) {
    
    initializeDateFormatting();

    String dataEmitereRo = DateFormat("MMM dd. yyyy", "ro").format(widget.facturaDetalii.dataEmitere).capitalizeFirst();

    String dataPlataRo = DateFormat("MMM dd. yyyy", "ro").format(widget.facturaDetalii.dataPlata).capitalizeFirst();

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
        scrollDirection: Axis.vertical,
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height:50
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Factură',
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.only(top: 10), //old
                  margin: const EdgeInsets.all(30.0),
                  //padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromRGBO(14, 190, 127, 1),),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(left: 25, right: 35),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        SizedBox(width: 284,
                          child: Text('Plată - SOS', 
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(height:8),
                        /*
                        SizedBox(width: 284,
                          child: Text('Email : ${widget.emailAddressPlata}', 
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ),
                        */
                        SizedBox(width: 284,
                          child: Text('Email : ${widget.facturaDetalii.emailEmitent}', 
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(width: 284,
                          child: Text('Telefon : ${widget.facturaDetalii.telefonEmitent}', 
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    SizedBox(width: 284,
                      child: Text('Factură pentru:', 
                        style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height:15
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    /*
                    SizedBox(width: 284,
                      child: Text(widget.textNumeSubiect, 
                        style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ),
                    */
                    SizedBox(width: 284,
                      child: Text(widget.facturaDetalii.denumireBeneficiar,
                        style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height:5
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    SizedBox(width: 284,
                      child: Text('User Id: ${widget.user}', 
                        style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height:5
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    SizedBox(width: 284,
                      child: Text('Email: ${widget.facturaDetalii.emailBeneficiar}', 
                        style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height:5
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    SizedBox(width: 284,
                      child: Text('Telefon: ${widget.facturaDetalii.telefonBeneficiar}', 
                        style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height:20
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    SizedBox(width: 284,
                      child: Text('Data plății', 
                        style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height:20
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Data plații', 
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        Text(dataPlataRo, 
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 140,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Procesată', 
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          Text(dataEmitereRo, 
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height:20
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    SizedBox(width: 284,
                      child: Text('Detalii factură', 
                        style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height:15
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    SizedBox(width: 284,
                      child: Text(widget.facturaDetalii.denumireMedic, 
                        style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height:5
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    SizedBox(width: 284,
                      child: Text('Servicii: ${widget.facturaDetalii.serviciiFactura}', 
                        style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height:10
                ),

                Padding(
                  padding: const EdgeInsets.only(left:55, right:30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 100,
                        child: Text('Număr: ${widget.facturaDetalii.numar}', 
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(width: 100,
                        child: Text('Serie: ${widget.facturaDetalii.serie}', 
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height:10
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 55,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Valoare cu TVA', 
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        /*
                        Text(widget.dataPlatii, 
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        */
                        Text(widget.facturaDetalii.valoareCuTVA.toString(), 
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Valoare TVA', 
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        /*
                        Text(widget.dataPlatii, 
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        */
                        Text(widget.facturaDetalii.valoareTVA.toString(), 
                          style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Valoare fără TVA', 
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        /*
                        Text(widget.dataPlatiiProcesata, 
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        */
                        Text(widget.facturaDetalii.valoareFaraTVA.toString(), 
                            style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height:35
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 284,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.push(
                            //context,
                            //MaterialPageRoute(
                              //builder: (context) => const ServiceSelectScreen(),
                              //builder: (context) => const TestimonialScreen(),
                            //));
                          //Navigator.of(context).popUntil((route) => route.isFirst);
                        
                          
                          _takeScreenshot(context);

                          print("pressed on button CONECTARE");
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuestionaireScreen(),
                            )
                          );
                          */
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TestimonialScreen(),
                            )
                          );

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                            minimumSize: const Size.fromHeight(50), // NEW
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('./assets/images/download_icon.png'),
                            const SizedBox(
                              width:10
                            ),
                            Text('Download PDF',
                                style: GoogleFonts.rubik(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: 14, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
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
