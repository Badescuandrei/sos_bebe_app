import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sos_bebe_app/intro_screen.dart';
//import  'package:sos_bebe_app/confirmare_servicii_screen.dart';
//import  'package:sos_bebe_app/adauga_metoda_plata_screen.dart';
//import  'package:sos_bebe_app/confirmare_screen.dart';

//import  'package:sos_bebe_app/apel_video_pacient_screen.dart';
//import  'package:sos_bebe_app/medic_info_screen.dart';

//import  'package:sos_bebe_app/register.dart';

//import 'package:sos_bebe_app/login_screen.dart';
//import  'package:sos_bebe_app/payment_screen.dart';

//import  'package:sos_bebe_app/adauga_metoda_plata_screen.dart';

//import  'package:sos_bebe_app/vezi_toti_medicii_screen.dart';

//import  'package:sos_bebe_app/profil_screen.dart';

import  'package:sos_bebe_app/vezi_medici_disponibili_intro_screen.dart';

import  'package:sos_bebe_app/profil_doctor_disponibilitate_servicii_screen.dart';

//import  'package:sos_bebe_app/raspunde_intrebare_medic_screen.dart';


//import  'package:sos_bebe_app/factura_screen.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const IntroScreen(),
      //home: const ConfirmareServiciiScreen(),
      //home: const PaymentScreen(),
      //home: const AdaugaMetodaPlataScreen(),
      //home: const LoginScreen(),
      //home: const RegisterScreen(),
      //home: const ConfirmareScreen(correctCard: true,),
      //home: const ApelVideoPacientScreen(),
      //home: const AdaugaMetodaPlataScreen(),
      //home: const VeziTotiMediciiScreen(),
      //home: const IntroScreen(),
      //home: const MedicInfoScreen(),
      
      //home: const ProfilScreen(),
      
      //home: const VeziMediciDisponibiliIntroScreen(),
      
      /*
      home: const FacturaScreen(tipPlata:'SOS', emailAddressPlata: 'info@sosromania.ro', phoneNumberPlata: '+40 000112112',
        textNumeSubiect: 'Istiak Ahmed', tutorId: '135248', emailSubiect: 'istiakahmed194@gmail.com', phoneNumberSubiect: '01521448905',
        dataPlatii: 'Iul. 02, 2023', dataPlatiiProcesata: 'Iul. 02, 2023', detaliiFacturaNume: 'Radu Timofte',
        detaliiFacturaServicii: 'Pediatrie', detaliiFacturaNumar: '7810',
      ),
      */
      home: const ProfilDoctorDisponibilitateServiciiScreen(eInConsultatie: false, eDisponibil:true, 
        likes: 330, iconPath: './assets/images/profil_doctor_image.png', rating:4.9, textNume: 'Dr. Daniela Preoteasa', textSpital: 'AIS Clinics & Hospital București', 
        textTipMedic: 'Pediatrie, Medic Primar', textTitluProfesional: 'Medic Primar', textTitluSpecializare: 'Pediatrie', textExperienta: '45 ani', 
        textLocDeMuncaNume: 'AIS Clinics & Hospital București', textLocDeMuncaAdresa: 'Șos. Alexandriei 144, București 051523', 
        textActivitateUtilizatori: '100%', textActivitateNumarPacientiAplicatie: '214', textActivitateNumarTestimoniale: '112', 
        textActivitateTimpDeRaspuns: '<2 ore (estimat)',
      ),


      //required this.tutorId, required this.emailSubiect, required this.phoneNumberSubiect, required this.dataPlatii, required this.dataPlatiiProcesata,
      //required this.detaliiFacturaNume, required this.detaliiFacturaServicii, required this.detaliiFacturaNumar,

      //home: const RaspundeIntrebareMedicScreen(textNume: '', textIntrebare: '', textRaspuns: '',),

    );

  }
}
