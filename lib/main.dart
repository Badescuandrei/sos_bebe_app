import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:sos_bebe_app/localizations/1_localizations.dart';

import 'package:sos_bebe_app/intro_screen.dart';

//import 'package:sos_bebe_app/error_pacient_screen.dart';

import  'package:sos_bebe_app/confirmare_servicii_screen.dart';
//import  'package:sos_bebe_app/adauga_metoda_plata_screen.dart';
//import  'package:sos_bebe_app/confirmare_screen.dart';

import  'package:sos_bebe_app/apel_video_pacient_screen.dart';
//import  'package:sos_bebe_app/medic_info_screen.dart';

import  'package:sos_bebe_app/register_screen.dart';

import 'package:sos_bebe_app/login_screen.dart';
//import  'package:sos_bebe_app/payment_screen.dart';

import  'package:sos_bebe_app/adauga_metoda_plata_screen.dart';

import  'package:sos_bebe_app/vezi_toti_medicii_screen.dart';

import  'package:sos_bebe_app/profil_pacient_screen.dart';

import  'package:sos_bebe_app/vezi_medici_disponibili_intro_screen.dart';

import  'package:sos_bebe_app/profil_doctor_disponibilitate_servicii_screen.dart';

//import  'package:sos_bebe_app/raspunde_intrebare_medic_screen.dart';


import  'package:sos_bebe_app/factura_screen.dart';

import  'package:sos_bebe_app/plata_esuata_screen.dart';

import  'package:sos_bebe_app/plata_succes_screen.dart';

import  'package:sos_bebe_app/questionare_screen.dart';

import 'package:sos_bebe_app/raspunde_intrebare_doar_chat_screen.dart';

import  'package:sos_bebe_app/testimonial_screen.dart';

import  'package:sos_bebe_app/confirmare_screen.dart';

import  'package:sos_bebe_app/doctor_selection_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51NiZpwCOKR6JfYKlesMUOOQJyJLVZPUPgsjQIBbTHDGXFD0ocGELdZ3uVPrJn4knnhsdhTkRVm9h1Ij3WUU8EEdg00MhGEEoPS';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: const Locale('ro', 'RO'),
      localizationsDelegates: const [
        LocalizationsApp.delegate,
        //LocalizationsCupertino.delegate, //old Adrian Murgu
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ro', 'RO'), // Romanian
        //Locale('en', 'US'), // English
        //Locale('it', 'IT'), // Italian
        //Locale('fr', 'FR') // French
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const LoginScreen(),

      //home: const ErrorPacientScreen(),

      //home: const DoctorSelectionScreen(),

      //home: const IntroScreen(),

      /*home: const ProfilDoctorDisponibilitateServiciiScreen(eInConsultatie: false, eDisponibil:true, 
        likes: 330, iconPath: './assets/images/profil_doctor_image.png', rating:4.9, textNume: 'Dr. Daniela Preoteasa', textSpital: 'AIS Clinics & Hospital București', 
        textTipMedic: 'Pediatrie, Medic Primar', textTitluProfesional: 'Medic Primar', textTitluSpecializare: 'Pediatrie', textExperienta: '45 ani', 
        textLocDeMuncaNume: 'AIS Clinics & Hospital București', textLocDeMuncaAdresa: 'Șos. Alexandriei 144, București 051523', 
        textActivitateUtilizatori: '100%', textActivitateNumarPacientiAplicatie: '214', textActivitateNumarTestimoniale: '112', 
        textActivitateTimpDeRaspuns: '<2 ore (estimat)',
      ),
      */

      //home: const ConfirmareServiciiScreen(pret:'9'),

      //home: const AdaugaMetodaPlataScreen(),

      //home: const PlataRealizataCuSuccesScreen(),

      //home: const PlataEsuataScreen(),

      //------------------------------------------------------------------

      //home: const ConfirmareScreen(correctCard: true,),

      //home: const PaymentScreen(),
      
      //home: const RegisterScreen(),
      //home: const ApelVideoPacientScreen(),
      //home: const AdaugaMetodaPlataScreen(),

      //home: const VeziTotiMediciiScreen(),

      //home: const IntroScreen(),
      //home: const MedicInfoScreen(),
      
      //home: const VeziMediciDisponibiliIntroScreen(),
      
      /*
      home: const FacturaScreen(tipPlata:'SOS', emailAddressPlata: 'info@sosromania.ro', phoneNumberPlata: '+40 000112112',
        textNumeSubiect: 'Istiak Ahmed', tutorId: '135248', emailSubiect: 'istiakahmed194@gmail.com', phoneNumberSubiect: '01521448905',
        dataPlatii: 'Iul. 02, 2023', dataPlatiiProcesata: 'Iul. 02, 2023', detaliiFacturaNume: 'Radu Timofte',
        detaliiFacturaServicii: 'Pediatrie', detaliiFacturaNumar: '7810',
      ),
      */

      /*
      home: const ProfilDoctorDisponibilitateServiciiScreen(eInConsultatie: false, eDisponibil:true, 
        likes: 330, iconPath: './assets/images/profil_doctor_image.png', rating:4.9, textNume: 'Dr. Daniela Preoteasa', textSpital: 'AIS Clinics & Hospital București', 
        textTipMedic: 'Pediatrie, Medic Primar', textTitluProfesional: 'Medic Primar', textTitluSpecializare: 'Pediatrie', textExperienta: '45 ani', 
        textLocDeMuncaNume: 'AIS Clinics & Hospital București', textLocDeMuncaAdresa: 'Șos. Alexandriei 144, București 051523', 
        textActivitateUtilizatori: '100%', textActivitateNumarPacientiAplicatie: '214', textActivitateNumarTestimoniale: '112', 
        textActivitateTimpDeRaspuns: '<2 ore (estimat)',
      ),
      */


      //required this.tutorId, required this.emailSubiect, required this.phoneNumberSubiect, required this.dataPlatii, required this.dataPlatiiProcesata,
      //required this.detaliiFacturaNume, required this.detaliiFacturaServicii, required this.detaliiFacturaNumar,

      //home: const RaspundeIntrebareMedicScreen(textNume: '', textIntrebare: '', textRaspuns: '',),

      //home: const RaspundeIntrebareDoarChatScreen(textNume: '', textIntrebare: '', textRaspuns: '', idMedic: 1),

      //home: const QuestionaireScreen(),

      //

      //home: const ProfilulMeuPacientScreen(),      
      
      //home: const TestimonialScreen(idMedic:1),

    );

  }
}
