
//ignore: must_be_immutable
class InitializareRecenziiWidget {

  InitializareRecenziiWidget();

    List<RecenzieItem> listaRecenzii = [RecenzieItem( 
                                      textNume: 'Irina Coman', textData: '26 Iulie 2023',
                                      rating: 5.0,),
                                      RecenzieItem( 
                                      textNume: 'Florentina Bucuș', textData: '27 Iulie 2023',
                                      rating: 5.0,),
                                      RecenzieItem( 
                                      textNume: 'Florentina Bucuș', textData: '27 Iulie 2023',
                                      rating: 5.0,),
                                  ];

    //RecenzieItom({required this.eInConsultatie, required this.eDisponibil, required this.likes, required this.rating, 
    //required this.iconPath, required this.statusIconPath, required this.textNume, required this.textSpital, required this.textTipMedic});

  List<RecenzieItem> initList () {

    return listaRecenzii;
  }

  List<RecenzieItem> filterListByIndex()
  {
    List<RecenzieItem> listResult = [];
    for(int index = 0; index <listaRecenzii.length; index++){
      if (index < 2)
      {
        listResult.add(listaRecenzii[index]);
      }
    }  
    return listResult; 
  }

/*   
  List<RecenzieItem> filterListByLowerData(DateTime higherThresholdData)
  {
    List<RecenzieItem> listResult = [];
    for(int index = 0; index < listaRecenzii.length; index++){
      var dataStartItem = listaRecenzii[index].dataStart;
      
      if (dataStartItem.year < higherThresholdData.year)
      {
        listResult.add(listaRecenzii[index]);
      }
      else if ((dataStartItem.year == higherThresholdData.year) && (dataStartItem.month < higherThresholdData.month))
      {
        listResult.add(listaRecenzii[index]);
      }
      else if (((dataStartItem.year == higherThresholdData.year) && (dataStartItem.month == higherThresholdData.month))
             && (dataStartItem.day < higherThresholdData.day))
      {
        listResult.add(listaRecenzii[index]);
      }
      
    } 
    return listResult; 
  }
  
  List<RecenzieItem> filterListByHigherData(DateTime lowerThresholdData)
  {
    List<RecenzieItem> listResult = [];
    for(int index = 0; index <listaRecenzii.length; index++){
      var dataStartItem = listaRecenzii[index].dataStart;
      if (dataStartItem.year > lowerThresholdData.year)
      {
        listResult.add(listaRecenzii[index]);
      }
      else if (dataStartItem.year == lowerThresholdData.year && dataStartItem.month > lowerThresholdData.month)
      {
        listResult.add(listaRecenzii[index]);
      }
      else if (dataStartItem.year == lowerThresholdData.year && dataStartItem.month == lowerThresholdData.month
             && dataStartItem.day > lowerThresholdData.day)
      {
        listResult.add(listaRecenzii[index]);
      }
    }  
    return listResult; 
  }
  
  List<RecenzieItem> filterListByIntervalData(DateTime lowerThresholdData, DateTime higherThresholdData)
  {
    List<RecenzieItem> listResult = [];
    if (lowerThresholdData.isAfter(higherThresholdData))
    {
      return listResult;
    }
    
for(int index = 0; index <listaRecenzii.length; index++){
      
      var dataStartItem = listaRecenzii[index].dataStart;    

      if ((dataStartItem.year > lowerThresholdData.year) 
                && ((dataStartItem.year < higherThresholdData.year)
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month < higherThresholdData.month)
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month == higherThresholdData.month && dataStartItem.day <= higherThresholdData.day)))
      {
        listResult.add(listaRecenzii[index]);
      }
      else if (((dataStartItem.year == lowerThresholdData.year) && (dataStartItem.month > lowerThresholdData.month))
                && ((dataStartItem.year < higherThresholdData.year) 
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month < higherThresholdData.month)
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month == higherThresholdData.month && dataStartItem.day <= higherThresholdData.day)))
      {
        listResult.add(listaRecenzii[index]);
      }
      else if (((dataStartItem.year == lowerThresholdData.year) && (dataStartItem.month == lowerThresholdData.month) && (dataStartItem.day >= lowerThresholdData.day))
      && ((dataStartItem.year < higherThresholdData.year) 
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month < higherThresholdData.month)
                  || (dataStartItem.year == higherThresholdData.year && dataStartItem.month == higherThresholdData.month  && dataStartItem.day <= higherThresholdData.day)))
      {
        listResult.add(listaRecenzii[index]);
      }
    }  

    return listResult; 
  }
  */
} 

class RecenzieItem {
  final String textNume;
  //final String textRating;
  final String textData;
  final double rating;
  //DateTime dataStart;
  
  RecenzieItem({required this.textNume, required this.textData, required this.rating});

}
