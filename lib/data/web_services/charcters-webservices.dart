import 'package:bloc_training/constant/strings.dart';
import 'package:dio/dio.dart';
class charcterWebServices{
  Dio dio;
  charcterWebServices(){
    BaseOptions options=BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20*1000,
      receiveTimeout: 20*1000
    );
    dio=Dio(options);
  }
  Future <List<dynamic>> getalllcharacters()async{
   try{
     Response response=await dio.get('characters');
     return response.data;
   }catch(e){
     return[];
   }

  } Future <List<dynamic>> getallQuotes(String charname)async{
    try{
      Response response=await dio.get('quote',queryParameters:{'author':charname} );
      return response.data;
    }catch(e){
      return[];
    }

  }

}