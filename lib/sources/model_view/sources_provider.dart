import 'package:flutter/widgets.dart';
import 'package:news/sources/data/data_sources.dart';
import 'package:news/sources/data/sources_model.dart';

class SourcesProvider extends ChangeNotifier{
 DataSources dataSources=DataSources();
 SourcesModel? sourcesModel;
 String? errorMessage;
 bool isWaiting=false;

 Future getSources(String catId)async{
   isWaiting=true;
   notifyListeners();
   try{
      SourcesModel response = await dataSources.getSources(catId);
      sourcesModel = response;
      if(response.status!="ok")
        {
          errorMessage=response.status;
          print(errorMessage);
        }
    }catch(e)
   {
      errorMessage=e.toString();
      print(errorMessage);
   }
   isWaiting=false;
   notifyListeners();
  }
}