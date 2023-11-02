
//ignore: must_be_immutable
class InitializareMediciWidget {

  InitializareMediciWidget();

    List<MedicItem> listaRatings = [MedicItem(eInConsultatie: true, eOnline: false, primesteIntrebari: false, interpretareAnalize: false,
                                      consultatieVideo: false, rating: 4.9, likes: 330, 
                                      iconPath:'./assets/images/medici_daniela_preoteasa_consultatie.png', 
                                      textNume: 'Dr. Daniela Preoteasa', textSpital: 'AIS Clinics & Hospital București',
                                      textTipMedic: 'Pediatrie, Medic Primar',),
                                    MedicItem(eInConsultatie: false, eOnline: false, primesteIntrebari: false, interpretareAnalize: false,
                                      consultatieVideo: false, rating: 4.9, likes: 214, 
                                      iconPath:'./assets/images/medici_daniela_preoteasa_offline.png', 
                                      textNume: 'Dr. Daniela Preoteasa', textSpital: 'AIS Clinics & Hospital București',
                                      textTipMedic: 'Pediatrie, Medic Primar',),
                                    MedicItem(eInConsultatie: false, eOnline: true, primesteIntrebari: true, interpretareAnalize: false,
                                      consultatieVideo: true, rating: 4.9, likes: 330, 
                                      iconPath:'./assets/images/medici_daniela_preoteasa_offline.png', 
                                      textNume: 'Dr. Daniela Preoteasa', textSpital: 'AIS Clinics & Hospital București',
                                      textTipMedic: 'Pediatrie, Medic Primar',),
                                    MedicItem(eInConsultatie: false, eOnline: true, primesteIntrebari: false, interpretareAnalize: true,
                                      consultatieVideo: false, rating: 4.8, likes: 340, 
                                      iconPath:'./assets/images/medici_daniela_preoteasa_offline.png', 
                                      textNume: 'Dr. Daniela Preoteasa nou', textSpital: 'AIS Clinics & Hospital București',
                                      textTipMedic: 'Pediatrie, Medic Primar',),
                                  ];

    //MedicItem({required this.eInConsultatie, required this.eDisponibil, required this.likes, required this.rating, 
    //required this.iconPath, required this.statusIconPath, required this.textNume, required this.textSpital, required this.textTipMedic});

  List<MedicItem> initList () {

    return listaRatings;
  }

  List<MedicItem> filterListByIndex()
  {
    List<MedicItem> listResult = [];
    for(int index = 0; index <listaRatings.length; index++){
      if (index < 2)
      {
        listResult.add(listaRatings[index]);
      }
    }  
    return listResult; 
  }

/*   
  List<MedicItem> filterListByLowerData(DateTime higherThresholdData)
  {
    List<MedicItem> listResult = [];
    for(int index = 0; index < listaRatings.length; index++){
      var dataStartItem = listaRatings[index].dataStart;
      
      if (dataStartItem.year < higherThresholdData.year)
      {
        listResult.add(listaRatings[index]);
      }
      else if ((dataStartItem.year == higherThresholdData.year) && (dataStartItem.month < higherThresholdData.month))
      {
        listResult.add(listaRatings[index]);
      }
      else if (((dataStartItem.year == higherThresholdData.year) && (dataStartItem.month == higherThresholdData.month))
             && (dataStartItem.day < higherThresholdData.day))
      {
        listResult.add(listaRatings[index]);
      }
      
    } 
    return listResult; 
  }
  
  List<MedicItem> filterListByHigherData(DateTime lowerThresholdData)
  {
    List<MedicItem> listResult = [];
    for(int index = 0; index <listaRatings.length; index++){
      var dataStartItem = listaRatings[index].dataStart;
      if (dataStartItem.year > lowerThresholdData.year)
      {
        listResult.add(listaRatings[index]);
      }
      else if (dataStartItem.year == lowerThresholdData.year && dataStartItem.month > lowerThresholdData.month)
      {
        listResult.add(listaRatings[index]);
      }
      else if (dataStartItem.year == lowerThresholdData.year && dataStartItem.month == lowerThresholdData.month
             && dataStartItem.day > lowerThresholdData.day)
      {
        listResult.add(listaRatings[index]);
      }
    }  
    return listResult; 
  }
  
  List<MedicItem> filterListByIntervalData(DateTime lowerThresholdData, DateTime higherThresholdData)
  {
    List<MedicItem> listResult = [];
    if (lowerThresholdData.isAfter(higherThresholdData))
    {
      return listResult;
    }
    
for(int index = 0; index <listaRatings.length; index++){
      
      var dataStartItem = listaRatings[index].dataStart;    

      if ((dataStartItem.year > lowerThresholdData.year) 
                && ((dataStartItem.year < higherThresholdData.year)
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month < higherThresholdData.month)
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month == higherThresholdData.month && dataStartItem.day <= higherThresholdData.day)))
      {
        listResult.add(listaRatings[index]);
      }
      else if (((dataStartItem.year == lowerThresholdData.year) && (dataStartItem.month > lowerThresholdData.month))
                && ((dataStartItem.year < higherThresholdData.year) 
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month < higherThresholdData.month)
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month == higherThresholdData.month && dataStartItem.day <= higherThresholdData.day)))
      {
        listResult.add(listaRatings[index]);
      }
      else if (((dataStartItem.year == lowerThresholdData.year) && (dataStartItem.month == lowerThresholdData.month) && (dataStartItem.day >= lowerThresholdData.day))
      && ((dataStartItem.year < higherThresholdData.year) 
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month < higherThresholdData.month)
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month == higherThresholdData.month  && dataStartItem.day <= higherThresholdData.day)))
      {
        listResult.add(listaRatings[index]);
      }
    }  

    return listResult; 
  }
  */
} 

class MedicItem {
  final bool eInConsultatie;
  final bool eOnline;
  final bool primesteIntrebari;
  final bool interpretareAnalize;
  final bool consultatieVideo;
  final int likes;
  final double rating;
  final String iconPath;
  //final String statusIconPath;
  final String textNume;
  //final String textRating;
  final String textSpital;
  final String textTipMedic;
  //DateTime dataStart;
  
  MedicItem({required this.eInConsultatie, required this.eOnline, required this.primesteIntrebari, 
    required this.interpretareAnalize, required this.consultatieVideo, required this.likes, required this.rating, 
    required this.iconPath, required this.textNume, required this.textSpital, required this.textTipMedic});

}
