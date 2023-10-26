import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sos_bebe_app/confirmare_servicii_screen.dart';
import 'package:sos_bebe_app/initializare_recenzii.dart';
import 'package:sos_bebe_app/utils/utils_widgets.dart';
//import 'package:sos_bebe_app/initializare_medici_widget.dart';
//import 'package:sos_bebe_app/profil_screen.dart';
import 'package:sos_bebe_app/medic_info_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProfilDoctorDisponibilitateServiciiScreen extends StatefulWidget {


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


  const ProfilDoctorDisponibilitateServiciiScreen({super.key, required this.eInConsultatie, required this.eDisponibil, required this.likes,
    required this.iconPath, required this.rating, required this.textNume, required this.textSpital, required this.textTipMedic,
    required this.textTitluProfesional, required this.textTitluSpecializare, required this.textExperienta, required this.textLocDeMuncaNume,
    required this.textLocDeMuncaAdresa, required this.textActivitateUtilizatori, required this.textActivitateNumarPacientiAplicatie,
    required this.textActivitateNumarTestimoniale, required this.textActivitateTimpDeRaspuns});

  

  @override
  State<ProfilDoctorDisponibilitateServiciiScreen> createState() => _ProfilDoctorDisponibilitateServiciiScreenState();
}

class _ProfilDoctorDisponibilitateServiciiScreenState extends State<ProfilDoctorDisponibilitateServiciiScreen> {

  List<RecenzieItem> listaRecenzii = [];

  @override
  void initState() {

    listaRecenzii = InitializareRecenziiWidget().initList();

    // Do some other stuff
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> mywidgets = [];
    //List<NumarPacientiItem> listaFiltrata = filterListByLowerDurata(25);
    //List<NumarPacientiItem> listaFiltrata = filterListByLowerData(DateTime.utc(2023, 2, 1));
    //List<NumarPacientiItem> listaFiltrata = filterListByHigherData(DateTime.utc(2023, 1, 8));
    //List<MedicItem> listaFiltrata = filterListByIntervalData(DateTime.utc(2021, 11, 9), DateTime.utc(2023, 3, 14));

  
    //var length = listaMedici.length;
    //print('Size lista: $length');

    List<RecenzieItem> listaFiltrata = listaRecenzii;

    //print('Lungime lista recenzii: ${listaFiltrata.length}');

    for(int index = 0; index <listaFiltrata.length; index++){
      var item = listaFiltrata[index];
      //if (index < listaFiltrata.length-1)
      if (index < 2)
      {
        mywidgets.add(
          RecenzieWidget( textNume: item.textNume, textData: item.textData, rating: item.rating,), 
        );
        mywidgets.add(
          const SizedBox(height: 5),
        );
        mywidgets.add(
          customDividerProfilDoctor(),
        );

      }
      //else if (index == listaFiltrata.length-1)
      else if (index == 2)
      {
        
        mywidgets.add(
          RecenzieWidget( textNume: item.textNume, textData: item.textData, rating: item.rating,), 
        );
        mywidgets.add(
          const SizedBox(height: 5),
        );
        mywidgets.add(
          customDividerProfilDoctor(),
        );
        mywidgets.add(
          const SizedBox(height: 25),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Înapoi'),
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
          IconStatusNumeRatingSpitalLikesMedic(eInConsultatie: widget.eInConsultatie, eDisponibil: widget.eDisponibil, likes: widget.likes,
            rating: widget.rating,
            iconPath: widget.iconPath, textNume: widget.textNume, textSpital: widget.textSpital, textTipMedic: widget.textTipMedic,),
            //const TopIconFiltreazaWidget(topIcon: './assets/images/pacient_medici_icon.png'),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                  
                ButtonServiciiProfilDoctor(
                  pret: "49.9 ",
                  textServiciu: "Scrie o întrebare",
                  iconLocation: './assets/images/chat_profil_doctor_icon.png',
                  color: Color.fromRGBO(30, 166, 219, 1),
                  tipConsultatieReteta: false,
                ),
                ButtonServiciiProfilDoctor(
                  pret: "25.9 ",
                  textServiciu: "Sună acum",
                  iconLocation: './assets/images/apel_video_profil_doctor_icon.png',
                  color: Color.fromRGBO(14, 190, 127, 1),
                  tipConsultatieReteta: false,
                ),
                
                ButtonServiciiProfilDoctor(
                  pret: "99,9 ",
                  textServiciu: "Primiți o recomandare și rețetă medicală",
                  iconLocation: './assets/images/reteta_profil_doctor_icon.png',
                  color: Color.fromRGBO(241, 201, 0, 1),
                  tipConsultatieReteta: true,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Text(
                  'Sumar',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                SizedBox( width: 100,
                  child:Text(
                    'Titlu profesional',
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 172),  
                SizedBox( width: 80,
                  child:Text(
                    widget.textTitluProfesional,
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ]
            ),
          ),

          customDividerProfilDoctor(),
          
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                SizedBox( width: 100,
                  child:Text(
                    'Specializare',
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 172),  
                SizedBox( width: 80,
                  child:Text(
                    widget.textTitluSpecializare,
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ]
            ),
          ),
          
          customDividerProfilDoctor(),
          
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                SizedBox( width: 100,
                  child:Text(
                    'Experiență',
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 172),  
                SizedBox( width: 80,
                  child:Text(
                    widget.textExperienta,
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(103, 114, 148, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ]
            ),
          ),
          
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Text(
                  'Loc de muncă',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Image.asset('./assets/images/spital_icon.png'),
                const SizedBox(width: 5),
                Text(
                  widget.textSpital,
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ]
            ),
          ),
          
          customDividerProfilDoctor(),

          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Image.asset('./assets/images/adresa_icon.png'),
                const SizedBox(width: 5),
                Text(
                  widget.textLocDeMuncaAdresa,
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ]
            ),
          ),
          
          customDividerProfilDoctor(),

          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Text(
                  'Activitate',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Image.asset('./assets/images/utilizatori_multumiti_icon.png'),
                const SizedBox(width: 5),
                Text(
                  'Utilizatori mulțumiți: ',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  widget.textActivitateUtilizatori,
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),  
              ]
            ),
          ),
          
          customDividerProfilDoctor(),

          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Image.asset('./assets/images/numar_pacienti_ajutati_icon.png'),
                const SizedBox(width: 5),
                Text(
                  'Am ajutat',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  ' ${widget.textActivitateNumarPacientiAplicatie} pacienți ',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  ' ai aplicației',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ]
            ),
          ),
          
          customDividerProfilDoctor(),

          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Image.asset('./assets/images/testimoniale_icon.png'),
                const SizedBox(width: 5),
                Text(
                  '${widget.textActivitateNumarTestimoniale} ',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Testimoniale',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ]
            ),
          ),
          
          customDividerProfilDoctor(),

          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Image.asset('./assets/images/timp_raspuns_icon.png'),
                const SizedBox(width: 5),
                Text(
                  'Timp de răspuns',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  ' ${widget.textActivitateTimpDeRaspuns} ',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 25),
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                SizedBox( width: 360,
                  child: AutoSizeText.rich(
                    TextSpan(text: 'Acest timp este estimat folosind cele mai recente răspunsuri. Ocazional poate fi mai mare sau mai mic decat intervalul afișat.',
                      style: GoogleFonts.rubik(color: const Color.fromRGBO(161, 168, 190, 1), fontWeight: FontWeight.w300, fontSize: 12),
                    ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  ),
                ),
              ]
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Text(
                  'Recenzii',
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
            ),
          ),

          //const RecenzieWidget( textNume: 'Irina Coman', textData: '26 Iulie 2023', rating: 5.0,),

          Center(
            child: Column(
              children: 
                mywidgets,
            ),
          ),

          /*const SizedBox(height:25),
          Center(
            child: Column(
              children: 
                mywidgets,
            ),
          ),
          */
          ],
        ),
      ),
    );
  }
}


class IconStatusNumeRatingSpitalLikesMedic extends StatefulWidget {
  
  final bool eInConsultatie;
  final bool eDisponibil;
  final int likes;
  final String iconPath;
  //final String statusIconPath;
  final double rating;
  final String textNume;
  final String textSpital;
  final String textTipMedic;

  const IconStatusNumeRatingSpitalLikesMedic({super.key, required this.eInConsultatie, required this.eDisponibil, required this.likes,
    required this.rating, required this.iconPath, //required this.statusIconPath,
    required this.textNume, required this.textSpital, required this.textTipMedic,});

  @override
  State<IconStatusNumeRatingSpitalLikesMedic> createState() => _IconStatusNumeRatingSpitalLikesMedic();
}

class _IconStatusNumeRatingSpitalLikesMedic extends State<IconStatusNumeRatingSpitalLikesMedic> {
  
  final double _ratingValue = 4.9;

  @override
  Widget build(BuildContext context) {

  return InkWell(
      onTap: () {
        // ignore: avoid_print
        print("tapped on container medic");
        /*
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MedicInfoScreen(),
          )
        );
        */
      },                         
      child: 
      Container(
        height: 121,
        width: 335,
        //color: const Color.fromRGBO(253, 250, 234, 1),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          borderRadius: BorderRadius.circular(15.0),
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 15),
                    Stack(
                      children: [
                        Image.asset(widget.iconPath),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Image.asset(widget.eInConsultatie? './assets/images/on_call_icon.png' : widget.eDisponibil? './assets/images/online_icon.png': './assets/images/offline_icon.png'),
                        ),  
                      ],
                    ),
                    const SizedBox(width: 25),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                SizedBox(
                  width:200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      widget.eInConsultatie? Container(
                        width: 69,
                        height: 16,
                        //color: const Color.fromRGBO(255, 0, 0, 1),
                        decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(255, 0, 0, 1),
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                        color: const Color.fromRGBO(255, 0, 0, 1),
                      ),
                        child: Text(' în consultație', style: GoogleFonts.rubik(color:const Color.fromRGBO(255, 255, 255, 1), fontSize: 9, fontWeight: FontWeight.w500)),
                      ) : const SizedBox(width:0, height:0),
                      RatingBar(
                        ignoreGestures: true,
                        initialRating: 4.9,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 13,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 5.0),
                        ratingWidget: RatingWidget(
                          //full: const Icon(Icons.star, color: Color.fromRGBO(252, 220, 85, 1)),
                          full: widget.eInConsultatie?  const Icon(Icons.star, color: Color.fromRGBO(252, 220, 85, 1)) : 
                            widget.eDisponibil? const Icon(Icons.star, color: Color.fromRGBO(252, 220, 85, 1)) : const Icon(Icons.star, color: Color.fromRGBO(103, 114, 148, 1)),
                          /*half: const Icon(
                            Icons.star_half,
                            color: Color.fromRGBO(252, 220, 85, 1),
                          ),
                          */  
                          half: widget.eInConsultatie?  const Icon(Icons.star_half, color: Color.fromRGBO(252, 220, 85, 1)) : 
                            widget.eDisponibil? const Icon(Icons.star_half, color: Color.fromRGBO(252, 220, 85, 1)) : const Icon(Icons.star_half, color: Color.fromRGBO(103, 114, 148, 1)),
                          /*
                          empty: const Icon(
                            Icons.star_outline,
                            color: Color.fromRGBO(252, 220, 85, 1),
                          )*/  
                          empty: widget.eInConsultatie?  const Icon(Icons.star_outline, color: Color.fromRGBO(252, 220, 85, 1)) : 
                            widget.eDisponibil? const Icon(Icons.star_outline, color: Color.fromRGBO(252, 220, 85, 1)) : const Icon(Icons.star_outline, color: Color.fromRGBO(103, 114, 148, 1)),
                          ),
                          
                        onRatingUpdate: (value) {
                          setState(() {
                            //_ratingValue = value;
                          });
                        }
                      ),
                      SizedBox(
                        width: 50,
                        child: widget.eInConsultatie? 
                          Text(_ratingValue.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(252, 220, 85, 1), fontSize: 12, fontWeight: FontWeight.w500))
                          : widget.eDisponibil? Text(_ratingValue.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(252, 220, 85, 1), fontSize: 12, fontWeight: FontWeight.w500))
                          : Text(_ratingValue.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w500))
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.eInConsultatie? SizedBox(
                          width: 175,
                          height: 17,
                          child: Text(widget.textNume, style: GoogleFonts.rubik(color:const Color.fromRGBO(255, 0, 0, 1), fontSize: 14, fontWeight: FontWeight.w400))
                        ) : 
                        widget.eDisponibil? SizedBox(
                          width: 175,
                          height: 17,
                          child: Text(widget.textNume, style: GoogleFonts.rubik(color:const Color.fromRGBO(30, 214, 158, 1), fontSize: 14, fontWeight: FontWeight.w400)),
                        ) : SizedBox(
                          width: 175,
                          height: 17,
                          child: Text(widget.textNume, style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 175,
                      height: 17,
                      child: Text(widget.textSpital, style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 12, fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 175,
                      height: 17,
                      child: Text(widget.textTipMedic, style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 10, fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('./assets/images/ok_mic_icon.png'),
                    const SizedBox(
                      width: 5
                    ),
                    SizedBox(
                      width: 100,
                      height: 17,
                      child: Text(widget.likes.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 10, fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 17),
                Image.asset('./assets/images/love_icon.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonServiciiProfilDoctor extends StatelessWidget {
  final String textServiciu;
  final String pret;
  final String iconLocation;
  final Color color;
  final bool tipConsultatieReteta;

  const ButtonServiciiProfilDoctor({
    super.key,
    required this.textServiciu,
    required this.pret,
    required this.iconLocation,
    required this.color,
    required this.tipConsultatieReteta,
  });

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ConfirmareServiciiScreen(pret: pret);
          },
        ));
      },
      child:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        height: 55,
        child:     
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(         
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Image.asset(iconLocation),
                ), 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    tipConsultatieReteta?  
                    Padding(
                      padding: const EdgeInsets.only(left:10, right: 10, top: 1),
                      child:
                      SizedBox( width: 95, height: 23,
                        child: AutoSizeText.rich(
                          TextSpan(text: textServiciu,
                          //style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18), old
                            style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 9),
                          ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )   :
                    Padding(
                      padding: const EdgeInsets.only(left:10, right: 10, top: 10),
                      child:
                      AutoSizeText.rich(
                        TextSpan(text: textServiciu,
                        //style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18), old
                          style: GoogleFonts.rubik(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 9),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),   
                    Padding(
                      padding: const EdgeInsets.only(left:10, top:5),
                      child:  
                      AutoSizeText.rich(
                        TextSpan(text: pret, style: GoogleFonts.rubik(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400,), 
                          children: [
                            TextSpan(
                              text: "RON",
                              // style: GoogleFonts.rubik(fontSize: 16), old
                              style: GoogleFonts.rubik(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w300,)
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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

class RecenzieWidget extends StatelessWidget {
  final String textNume;
  final String textData;
  final double rating;

  bool isInteger(num value) => (value % 1) == 0;


  const RecenzieWidget({
    super.key,
    required this.textNume,
    required this.textData,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        padding: const EdgeInsets.only(left:25, top:15, right: 20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(         
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  textNume,
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(         
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textData,
                  style: GoogleFonts.rubik(
                    color: const Color.fromRGBO(103, 114, 148, 1),
                    fontSize: 9,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  children: [
                    Image.asset('./assets/images/utilizatori_multumiti_icon.png'),
                    const SizedBox(width:5),
                    isInteger(rating)?
                    Text(
                      'Rating ${rating.toInt()}/5',
                      style: GoogleFonts.rubik(
                        color: const Color.fromRGBO(103, 114, 148, 1),
                        fontSize: 9,
                        fontWeight: FontWeight.w300,
                      ),
                    ):
                    Text(
                      'Rating $rating/5',
                      style: GoogleFonts.rubik(
                        color: const Color.fromRGBO(103, 114, 148, 1),
                        fontSize: 9,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),            
    );
  }
}