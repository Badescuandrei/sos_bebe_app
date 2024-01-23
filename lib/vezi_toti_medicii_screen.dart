import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sos_bebe_app/utils/utils_widgets.dart';
import 'package:sos_bebe_app/initializare_medici_widget.dart';
import 'package:sos_bebe_app/profil_screen.dart';
import 'package:sos_bebe_app/utils_api/classes.dart';
import 'package:sos_bebe_app/utils_api/functions.dart';
import 'package:sos_bebe_app/utils_api/api_call_functions.dart';
//import 'package:sos_bebe_app/medic_info_screen.dart';
import 'package:sos_bebe_app/profil_doctor_disponibilitate_servicii_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_bebe_app/utils_api/shared_pref_keys.dart' as pref_keys;

ApiCallFunctions apiCallFunctions = ApiCallFunctions();

List<MedicMobile> listaMedici = [];

  List<MedicMobile> filterListByActiv()
  {

    const activ = EnumStatusMedicMobile.activ;
    List<MedicMobile> listResult = [];
    for(int index = 0; index <listaMedici.length; index++){
      if (listaMedici[index].status == activ.value)
      {
        print('filterListByActiv: index = $index ');
        listResult.add(listaMedici[index]);
      }
    }  
    return listResult; 
  }

  List<MedicMobile> filterListByDisponibilitateScrieIntrebare()
  {
    List<MedicMobile> listResult = [];
    for(int index = 0; index <listaMedici.length; index++){
      if (listaMedici[index].primesteIntrebari == true)
      {
        listResult.add(listaMedici[index]);
      }
    }  
    return listResult; 
  }

  
  
  List<MedicMobile> filterListByDisponibilitateConsultatieVideo()
  {
    List<MedicMobile> listResult = [];
    for(int index = 0; index <listaMedici.length; index++){
      if (listaMedici[index].consultatieVideo == true)
      {
        listResult.add(listaMedici[index]);
      }
    }  
    return listResult; 
  }
  
  List<MedicMobile> filterListByDisponibilitateInterpretareAnalize()
  {
    List<MedicMobile> listResult = [];
    for(int index = 0; index <listaMedici.length; index++){
      if (listaMedici[index].interpreteazaAnalize == true)
      {
        listResult.add(listaMedici[index]);
      }
    }  
    return listResult; 
  }

class VeziTotiMediciiScreen extends StatefulWidget {
  
  const VeziTotiMediciiScreen({super.key});

  @override
  State<VeziTotiMediciiScreen> createState() => _VeziTotiMediciiScreenState();
}

class _VeziTotiMediciiScreenState extends State<VeziTotiMediciiScreen> {

  //List<MedicMobile> listaFiltrata = [];

  List<MedicMobile> listaFiltrata = [];

  @override
  void initState() {
    
    // Do some other stuff
    super.initState();

    getListaMedici();

    setState(() {

      listaFiltrata = listaMedici;

    });
    
    //listaMedici = InitializareMediciWidget().initList(); //old IGV
    
    //listaFiltrata = listaMedici;

  }

  getListaMedici() async 
  {
   
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    
    String user = prefs.getString('user')??'';
    String userPassMD5 = prefs.getString(pref_keys.userPassMD5)??'';

    listaMedici = await apiCallFunctions.getListaMedici(
      pUser: user,
      pParola: userPassMD5,
    )?? [];

    print('listaMedici: $listaMedici');

  }
  

  void callbackFiltreazaLista(List<MedicMobile> newListaFiltrataActiv) {

    //print('newListaFiltrataActiv: ${newListaFiltrataActiv.length}');

    setState(() {
      listaFiltrata = newListaFiltrataActiv;
      // ignore: avoid_print
      //print('is checked alergic: ' + isAlergic.toString());
    });

  }

  void callbackScrieIntrebare(List<MedicMobile> newListaFiltrataScrieIntrebare) {
    setState(() {

      listaFiltrata = newListaFiltrataScrieIntrebare;

      //listaFiltrata = newListaFiltrataScrieIntrebare;
      // ignore: avoid_print
      //print('is checked alergic: ' + isAlergic.toString());

    });
  }
  
  void callbackConsultatieVideo(List<MedicMobile> newListaFiltrataConsultatieVideo) {
    setState(() 
    {

      listaFiltrata = newListaFiltrataConsultatieVideo;
      // ignore: avoid_print
      //print('is checked alergic: ' + isAlergic.toString());
    });
  }

  void callbackInterpretareAnalize(List<MedicMobile> newListaFiltrataInterpretareAnalize) {
    setState(() {
      listaFiltrata = newListaFiltrataInterpretareAnalize;
      // ignore: avoid_print
      //print('is checked alergic: ' + isAlergic.toString());
    });
  }

  /*
  List<MedicItem> filterListByIndex()
  {
    List<MedicItem> listResult = [];
    for(int index = 0; index <listaMedici.length; index++){
      if (index < 2)
      {
        listResult.add(listaMedici[index]);
      }
    }  
    return listResult; 
  }
  */


  @override
  Widget build(BuildContext context) {

    List<Widget> mywidgets = [];
    //List<NumarPacientiItem> listaFiltrata = filterListByLowerDurata(25);
    //List<NumarPacientiItem> listaFiltrata = filterListByLowerData(DateTime.utc(2023, 2, 1));
    //List<NumarPacientiItem> listaFiltrata = filterListByHigherData(DateTime.utc(2023, 1, 8));
    //List<MedicItem> listaFiltrata = filterListByIntervalData(DateTime.utc(2021, 11, 9), DateTime.utc(2023, 3, 14));
    
    for(int index = 0; index <listaFiltrata.length; index++){
      var item = listaFiltrata[index];
      if (index < listaFiltrata.length-1)
      {
        mywidgets.add(
          IconStatusNumeRatingSpitalLikesMedic(medicItem: item,),  
        );
        mywidgets.add(
          const SizedBox(height: 15),
        );
      }
      else if (index == listaFiltrata.length-1)
      {
        mywidgets.add(
          IconStatusNumeRatingSpitalLikesMedic(medicItem: item,),  
        );
      }
      /*
      else if (index == listaFiltrata.length-1){
        mywidgets.add(
          FadingListViewWidget(textNume: item.textNume, textComentariu: item.textComentariu, 
            iconPath:item.iconPath, 
            textData: item.textData, textRating: ''),
        );
      }
      */
    }
    //var length = listaMedici.length;
    //print('Size lista: $length');

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
            TopIconFiltreazaWidget(topIcon: './assets/images/pacient_medici_icon.png', callbackFiltreaza: callbackFiltreazaLista, listaMedici:listaMedici),
            ButoaneAlegeOptiunea(listaMedici: listaFiltrata, callbackScrieIntrebare: callbackScrieIntrebare, callbackConsultatieVideo: callbackConsultatieVideo,
              callbackInterpretareAnalize: callbackInterpretareAnalize,),
            const SizedBox(height:25),
            Center(
              child: Column(
                children: 
                  mywidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopIconFiltreazaWidget extends StatefulWidget {
  
  final String topIcon;

  final List<MedicMobile> listaMedici;
  
  final Function(List<MedicMobile>)? callbackFiltreaza;
  
  const TopIconFiltreazaWidget({super.key, required this.topIcon, required this.listaMedici, required this.callbackFiltreaza});

  @override
  State<TopIconFiltreazaWidget> createState() => _TopIconFiltreazaWidgetState();

}

class _TopIconFiltreazaWidgetState extends State<TopIconFiltreazaWidget> {

  //List<MedicMobile> listaFiltrata = [];
  
  List<MedicMobile> listaFiltrataRezultat = [];
  bool isChecked = false;

  @override
  void initState() {
    
    // Do some other stuff
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 15),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilScreen(),
              )
            );
          },
          icon: Image.asset(widget.topIcon),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilScreen(),
              )
            );
          },
          child:
          Text('Profilul meu',
            style: GoogleFonts.rubik(color: const Color.fromRGBO(18, 25, 36, 1), fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(width: 100),
        TextButton(
          onPressed: () {

            print('onPressed Aici');
            setState(
              () {
                isChecked = !isChecked;
                if(isChecked == true)
                {

                  listaFiltrataRezultat = filterListByActiv();
                  //print('filterListByActiv: listaFiltrataRezultat.length = ${listaFiltrataRezultat.length}'); 
                  widget.callbackFiltreaza!(listaFiltrataRezultat);

                }
                else {

                  //listaMedici = InitializareMediciWidget().initList();
                  widget.callbackFiltreaza!(listaMedici);

                } 
              }
            );
            
          },
          child:
          Text('Filtrează', style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300)),
        ),
        const SizedBox(width: 20),
        
        GestureDetector(
          onTap: () {

            print('onTap Aici');
            setState(
              () {
                isChecked = !isChecked;
                if(isChecked == true)
                {
                  listaFiltrataRezultat = filterListByActiv(); 
                  widget.callbackFiltreaza!(listaFiltrataRezultat);
                }
                else {

                  //listaMedici = InitializareMediciWidget().initList();
                  widget.callbackFiltreaza!(listaMedici);
                  
                } 
              }
            );
          },
          child: Image.asset('./assets/images/filtreaza_medici_icon.png')
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ButoaneAlegeOptiunea extends StatelessWidget {

  final List<MedicMobile> listaMedici;
  
  final Function(List<MedicMobile>)? callbackScrieIntrebare;
  final Function(List<MedicMobile>)? callbackConsultatieVideo;
  final Function(List<MedicMobile>)? callbackInterpretareAnalize;

  const ButoaneAlegeOptiunea({super.key, required this.listaMedici, required this.callbackScrieIntrebare
  , required this.callbackConsultatieVideo, required this.callbackInterpretareAnalize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        
        ButonAlegeServiciu(textServiciu: 'Scrie o întrebare', iconLocation: './assets/images/intrebare_icon.png', colorBackground: const Color.fromRGBO(241, 248, 251, 1), 
          colorScris: const Color.fromRGBO(30, 166, 219, 1), widthScris: 60, listaMedici: listaMedici, onPressed: callbackScrieIntrebare, tipServiciu: 1,),

        ButonAlegeServiciu(textServiciu: 'Consultație video', iconLocation: './assets/images/phone-call_apel_video.png', colorBackground: const Color.fromRGBO(236, 251, 247, 1),
          colorScris: const Color.fromRGBO(30, 214, 158, 1), widthScris: 70, listaMedici: listaMedici, onPressed: callbackConsultatieVideo, tipServiciu: 2,),
        
        ButonAlegeServiciu(textServiciu: 'Interpretare analize', iconLocation: './assets/images/analize_icon.png', colorBackground: const Color.fromRGBO(253, 250, 234, 1), 
          colorScris: const Color.fromRGBO(241, 201, 0, 1), widthScris: 73, listaMedici: listaMedici, onPressed: callbackConsultatieVideo, tipServiciu: 3,),
      ],
    );
  }
}

class IconStatusNumeRatingSpitalLikesMedic extends StatefulWidget {
  
  final MedicMobile medicItem;

  const IconStatusNumeRatingSpitalLikesMedic({super.key, required this.medicItem,});

  @override
  State<IconStatusNumeRatingSpitalLikesMedic> createState() => _IconStatusNumeRatingSpitalLikesMedic();
}

class _IconStatusNumeRatingSpitalLikesMedic extends State<IconStatusNumeRatingSpitalLikesMedic> {
  
  double? _ratingValue = 4.9;

  static const activ = EnumStatusMedicMobile.activ;
  static const indisponibil = EnumStatusMedicMobile.indisponibil;
  static const inConsultatie = EnumStatusMedicMobile.inConsultatie;

  @override
  Widget build(BuildContext context) {

  return InkWell(
      onTap: () {
        print("tapped on container medic");
        /*
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const IconStatusNumeRatingSpitalLikesMedic(),//MedicInfoScreen(),
          )
        );
        */
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfilDoctorDisponibilitateServiciiScreen(eInConsultatie: false, eDisponibil:true, 
                              likes: 330, iconPath: './assets/images/profil_doctor_image.png', rating:4.9, textNume: 'Dr. Daniela Preoteasa', textSpital: 'AIS Clinics & Hospital București', 
                              textTipMedic: 'Pediatrie, Medic Primar', textTitluProfesional: 'Medic Primar', textTitluSpecializare: 'Pediatrie', textExperienta: '45 ani', 
                              textLocDeMuncaNume: 'AIS Clinics & Hospital București', textLocDeMuncaAdresa: 'Șos. Alexandriei 144, București 051523', 
                              textActivitateUtilizatori: '100%', textActivitateNumarPacientiAplicatie: '214', textActivitateNumarTestimoniale: '112', 
                              textActivitateTimpDeRaspuns: '<2 ore (estimat)',
                            ),//MedicInfoScreen(),
          )
        );

      },                         
      child: 
      Container(
        height: 121,
        width: 335,
        //color: const Color.fromRGBO(253, 250, 234, 1),
        decoration: BoxDecoration(
          /*
          border: Border.all(
            color: widget.eInConsultatie ? const Color.fromRGBO(214, 30, 42, 1): 
              widget.eDisponibil? const Color.fromRGBO(30, 214, 158, 1) : const Color.fromRGBO(205, 211, 223, 1),
          ),
          */

          border: Border.all(
            color: widget.medicItem.status == inConsultatie.value ? const Color.fromRGBO(214, 30, 42, 1): 
              widget.medicItem.status == activ.value ? const Color.fromRGBO(30, 214, 158, 1) : const Color.fromRGBO(205, 211, 223, 1),
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
                        //Image.asset(widget.iconPath),
                        widget.medicItem.linkPozaProfil.isNotEmpty?

                        Image.network(widget.medicItem.linkPozaProfil, width:60, height: 60):
                        Image.asset('./assets/images/user_fara_poza.png', width:60, height: 60),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          //child: Image.asset(widget.eInConsultatie? './assets/images/on_call_icon.png' : widget.eDisponibil? './assets/images/online_icon.png': './assets/images/offline_icon.png'),
                          child: Image.asset(widget.medicItem.status == inConsultatie.value? './assets/images/on_call_icon.png' : widget.medicItem.status == activ.value? './assets/images/online_icon.png': './assets/images/offline_icon.png'),
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
                      //widget.eInConsultatie?  //old IGV
                      widget.medicItem.status == inConsultatie.value?
                      Container(
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
                          full: 
                            //widget.eInConsultatie?  const Icon(Icons.star, color: Color.fromRGBO(252, 220, 85, 1)) :  //old IGV
                            //widget.eDisponibil? const Icon(Icons.star, color: Color.fromRGBO(252, 220, 85, 1)) : const Icon(Icons.star, color: Color.fromRGBO(103, 114, 148, 1)), //old IGV
                            widget.medicItem.status == inConsultatie.value? const Icon(Icons.star, color: Color.fromRGBO(252, 220, 85, 1)) : 
                            widget.medicItem.status == activ.value? const Icon(Icons.star, color: Color.fromRGBO(252, 220, 85, 1)) : const Icon(Icons.star, color: Color.fromRGBO(103, 114, 148, 1)),
                          /*half: const Icon(
                            Icons.star_half,
                            color: Color.fromRGBO(252, 220, 85, 1),
                          ),
                          */  
                          //half: widget.eInConsultatie?  const Icon(Icons.star_half, color: Color.fromRGBO(252, 220, 85, 1)) : // old IGV
                          //  widget.eDisponibil? const Icon(Icons.star_half, color: Color.fromRGBO(252, 220, 85, 1)) : const Icon(Icons.star_half, color: Color.fromRGBO(103, 114, 148, 1)), // old IGV  
                          half:
                            widget.medicItem.status == inConsultatie.value?  const Icon(Icons.star_half, color: Color.fromRGBO(252, 220, 85, 1)) : // old IGV
                            widget.medicItem.status == activ.value? const Icon(Icons.star_half, color: Color.fromRGBO(252, 220, 85, 1)) : const Icon(Icons.star_half, color: Color.fromRGBO(103, 114, 148, 1)), // old IGV
                          /*
                          empty: const Icon(
                            Icons.star_outline,
                            color: Color.fromRGBO(252, 220, 85, 1),
                          )*/  
                          empty: 
                            //widget.eInConsultatie?  const Icon(Icons.star_outline, color: Color.fromRGBO(252, 220, 85, 1)) : //old IGV
                            //widget.eDisponibil? const Icon(Icons.star_outline, color: Color.fromRGBO(252, 220, 85, 1)) : const Icon(Icons.star_outline, color: Color.fromRGBO(103, 114, 148, 1)), //old IGV
                            widget.medicItem.status == inConsultatie.value?  const Icon(Icons.star_outline, color: Color.fromRGBO(252, 220, 85, 1)) :
                            widget.medicItem.status == activ.value? const Icon(Icons.star_outline, color: Color.fromRGBO(252, 220, 85, 1)) : const Icon(Icons.star_outline, color: Color.fromRGBO(103, 114, 148, 1)), //old IGV
                          ),
                          
                        onRatingUpdate: (value) {
                          setState(() {
                            //_ratingValue = value;
                          });
                        }
                      ),
                      SizedBox(
                        width: 50,
                        child: 
                        /*
                          widget.eInConsultatie? 
                          Text(_ratingValue.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(252, 220, 85, 1), fontSize: 12, fontWeight: FontWeight.w500))
                          : widget.eDisponibil? Text(_ratingValue.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(252, 220, 85, 1), fontSize: 12, fontWeight: FontWeight.w500))
                          : Text(_ratingValue.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w500))
                        */
                          widget.medicItem.status == inConsultatie.value? 
                          Text(_ratingValue.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(252, 220, 85, 1), fontSize: 12, fontWeight: FontWeight.w500))
                          : widget.medicItem.status == activ.value? Text(_ratingValue.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(252, 220, 85, 1), fontSize: 12, fontWeight: FontWeight.w500))
                          : Text(_ratingValue.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w500))
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    widget.medicItem.status == inConsultatie.value? SizedBox(
                      width: 175,
                      height: 17,
                      child: Text('${widget.medicItem.titulatura}. ${widget.medicItem.numeleComplet}', style: GoogleFonts.rubik(color:const Color.fromRGBO(255, 0, 0, 1), fontSize: 14, fontWeight: FontWeight.w400))
                    ) : SizedBox(
                      width: 175,
                      height: 17,
                      child: Text('${widget.medicItem.titulatura}. ${widget.medicItem.numeleComplet}', style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 14, fontWeight: FontWeight.w400)),
                    ),

                    /* //old IGV
                    widget.eInConsultatie? SizedBox(
                          width: 175,
                          height: 17,
                          child: Text(widget.textNume, style: GoogleFonts.rubik(color:const Color.fromRGBO(255, 0, 0, 1), fontSize: 14, fontWeight: FontWeight.w400))
                        ) : SizedBox(
                          width: 175,
                          height: 17,
                          child: Text(widget.textNume, style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                    */
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 175,
                      height: 17,
                      //child: Text(widget.textSpital, style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 12, fontWeight: FontWeight.w300)), //old IGV
                      child: Text(widget.medicItem.locDeMunca, style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 12, fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 175,
                      height: 17,
                      //child: Text(widget.textTipMedic, style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 10, fontWeight: FontWeight.w300)),
                      child: Text('${widget.medicItem.specializarea}, ${widget.medicItem.functia}', style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 10, fontWeight: FontWeight.w300)),
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
                      //child: Text(widget.likes.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 10, fontWeight: FontWeight.w300)),//old IGV
                      child: Text(widget.medicItem.nrLikeuri.toString(), style: GoogleFonts.rubik(color:const Color.fromRGBO(64, 75, 109, 1), fontSize: 10, fontWeight: FontWeight.w300)),
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
    /*return
    Column(
      children: [
        Row(
          children:[
            const SizedBox(
              width: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(211, 211, 211, 1),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Card(
                color: const Color.fromRGBO(255, 255, 255, 1),
                child: ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Color.fromRGBO(14, 190, 127, 1), width: 7),
                      ),
                    ),
                    child: Column(
                      children:[
                        Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          const SizedBox(width: 20), 
                          CircleAvatar(foregroundImage: AssetImage(widget.iconPath), radius: 25),  
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(widget.textNume, style: GoogleFonts.rubik(color:const Color.fromRGBO(103, 114, 148, 1), fontSize: 15, fontWeight: FontWeight.w400)),
                                ),
                                Row(
                                  children:[
                                    RatingBar(
                                      ignoreGestures: true,
                                      initialRating: 4.9,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 13,
                                      itemPadding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 5.0),
                                      ratingWidget: RatingWidget(
                                        full: const Icon(Icons.star, color: Color.fromRGBO(252, 220, 85, 1)),
                                        half: const Icon(
                                          Icons.star_half,
                                          color: Color.fromRGBO(252, 220, 85, 1),
                                        ),
                                        empty: const Icon(
                                          Icons.star_outline,
                                          color: Color.fromRGBO(252, 220, 85, 1),
                                        )),
                                        
                                      onRatingUpdate: (value) {
                                        setState(() {
                                          _ratingValue = value;
                                        });
                                      }
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Text(_ratingValue.toString(), style: GoogleFonts.rubik(color:Colors.yellow, fontSize: 12, fontWeight: FontWeight.w500)),
                                    ),
                                  ],  
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 240,
                                      child: Text( widget.textComentariu,
                                        style: GoogleFonts.rubik(
                                          color: const Color.fromRGBO(103, 114, 148, 1),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                customPaddingRating(),
            
                                Row(children: [
                                    SizedBox(
                                      width: 110,
                                      child: Text(widget.textData,
                                      style: GoogleFonts.rubik(color: const Color.fromRGBO(103, 114, 148, 1), fontSize: 12, fontWeight: FontWeight.w300)),
                                    ),
                                    const SizedBox(
                                      width: 26,
                                    ),  
                                    SizedBox(
                                      width: 61,
                                      child: Text('Răspunde',
                                        style: GoogleFonts.rubik(color: const Color.fromRGBO(14, 190, 127, 1), fontSize: 12, fontWeight: FontWeight.w400)
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset('./assets/images/raspunde_rating.png'),
                                    ),
                                  ]  
                                )
                              ],  
                            ),
                          ),
                        ]
                      ),
                      ]
                    ),
                  ),
                ),
              ),
            ),
          ],  
        ),  
      ],
    );
    */
  }
}


class ButonAlegeServiciu extends StatefulWidget {

  final String textServiciu;
  final String iconLocation;
  final Color colorBackground;
  final Color colorScris;
  final double widthScris;
  final List<MedicMobile> listaMedici;
  final int tipServiciu;

  final Function(List<MedicMobile>)? onPressed;

  const ButonAlegeServiciu({
    
    super.key,
    required this.textServiciu,
    required this.iconLocation,
    required this.colorBackground,
    required this.colorScris,
    required this.widthScris,
    required this.listaMedici,
    required this.onPressed,
    required this.tipServiciu,

  });

  @override
  State<ButonAlegeServiciu> createState() => _ButonAlegeServiciuState();

}

class _ButonAlegeServiciuState extends State<ButonAlegeServiciu> {
  
  bool isChecked = false;

  List<MedicMobile> listaFiltrataRezultat = [];

  @override
  initState() {

    //listaMedici = widget.listaMedici;
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: () {  
        // ignore: avoid_print                        
        print("tapped on container întrebare");
        
        if (widget.tipServiciu == 1)
        {
          setState(
            () {
              isChecked = !isChecked;
              if(isChecked == true)
              {
                listaFiltrataRezultat = filterListByDisponibilitateScrieIntrebare(); 
                widget.onPressed!(listaFiltrataRezultat);
              }
              else {

                //listaMedici = InitializareMediciWidget().initList();
                widget.onPressed!(listaMedici);
                
              } 
            }
          );
        }
        else if (widget.tipServiciu == 2)
        {
          setState(
            () {
              isChecked = !isChecked;
              if(isChecked == true)
              {
                
                listaFiltrataRezultat = filterListByDisponibilitateConsultatieVideo(); 
                widget.onPressed!(listaFiltrataRezultat);

              }
              else {

                //listaMedici = InitializareMediciWidget().initList();
                widget.onPressed!(listaMedici);
                
              }
            }
          );
        }
        else if (widget.tipServiciu == 3)
        {
          setState(
            () {

              isChecked = !isChecked;
              if(isChecked == true)
              {
                listaFiltrataRezultat = filterListByDisponibilitateInterpretareAnalize(); 
                widget.onPressed!(listaFiltrataRezultat);
              }
              else {
                //listaMedici = InitializareMediciWidget().initList();
                widget.onPressed!(listaMedici);
              }

            }
          );
        }
      },                         
      child:
      Container(
        height: 60,
        //color: const Color.fromRGBO(241, 248, 251, 1),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.colorBackground,
          ),
          borderRadius: BorderRadius.circular(15.0),
          color: widget.colorBackground //const Color.fromRGBO(241, 248, 251, 1),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            const SizedBox(width: 5),
            Image.asset(widget.iconLocation),
            const SizedBox(width:5),
            SizedBox(
              width: widget.widthScris,
              height: 35,
              child: Text(widget.textServiciu, 
                style: GoogleFonts.rubik(color: widget.colorScris, fontSize: 11, fontWeight: FontWeight.w400), //const Color.fromRGBO(30, 166, 219, 1),
                maxLines: 2,
                ),
            ),  
          ],
        ),
      ),
    );
  }
}

/*
class FadingListViewWidget extends StatelessWidget {
  
  final String iconPath;
  final String textNume;
  final String textComentariu;
  final String textData;
  final String textRating;
  
  const FadingListViewWidget({super.key, required this.textNume, required this.textComentariu, required this.iconPath, required this.textData, required this.textRating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        child: ShaderMask(
          shaderCallback: (Rect rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.transparent, Colors.transparent, Colors.white],
              //stops: [0.0, 0.1, 0.9, 1.0], // 10% purple, 80% transparent, 10% purple
            ).createShader(rect);
          },
          blendMode: BlendMode.dstOut,
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return IconStatusNumeRatingSpitalLikesMedic(iconPath: iconPath, textNume: textNume, textComentariu: textComentariu, textData: textData, textRating: textRating); 
            },
          ),   
        ),
    );
  }
}
*/