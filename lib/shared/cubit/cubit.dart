import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/modules/business/business_screen.dart';
import 'package:news_app_api/modules/science/science_screen.dart';
import 'package:news_app_api/modules/sports/sports_screen.dart';
import 'package:news_app_api/shared/cubit/states.dart';

import '../../modules/settings/sports_screen.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens=[
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingsScreen(),
  ];

 List<dynamic> business=[];
 List<dynamic> sports=[];
 List<dynamic> science=[];

  void changeIndex(int index){

    currentIndex=index;

    if(index==0){
      getBusiness();
    }else if(index==1){
      getScience();

    }else if(index==2){
      getSports();
    }
    emit(NewsChangeIndexState());

  }

  void getBusiness(){

    emit(NewsBusinessLoadingState());
    //   DioHelper.getData(path: "v2/everything", query: {
    //   'q':'tesla',
    //   'from':'2022-03-29',
    //   'sortBy':'publishedAt',
    //   'apiKey':'d48789e203084bad9900d0411b20eaae',
    // })
     DioHelper.getData(path: "v2/top-headlines", query: {
       'country':'us',
       'category':'business',
       'apiKey':'d48789e203084bad9900d0411b20eaae',
     })
        .then((value){
          business=value.data['articles'];
          print(business.length);

          emit(NewsGetBusinessSuccessState());
    }).catchError((error){

      print("Error => ${error.toString()}");
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports(){

    if(sports.length==0){

      emit(NewsSportsLoadingState());
      //   DioHelper.getData(path: "v2/everything", query: {
      //   'q':'tesla',
      //   'from':'2022-03-29',
      //   'sortBy':'publishedAt',
      //   'apiKey':'d48789e203084bad9900d0411b20eaae',
      // })
      DioHelper.getData(path: "v2/top-headlines", query: {
        'country':'us',
        'category':'sports',
        'apiKey':'d48789e203084bad9900d0411b20eaae',
      })
          .then((value){
        sports=value.data['articles'];
        print(sports.length);

        emit(NewsGetSportsSuccessState());
      }).catchError((error){

        print("Error => ${error.toString()}");
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }else{
      emit(NewsGetSportsSuccessState());

    }


  }

  void getScience(){

    if(science.length==0){
      emit(NewsScienceLoadingState());
      //   DioHelper.getData(path: "v2/everything", query: {
      //   'q':'tesla',
      //   'from':'2022-03-29',
      //   'sortBy':'publishedAt',
      //   'apiKey':'d48789e203084bad9900d0411b20eaae',
      // })
      DioHelper.getData(path: "v2/top-headlines", query: {
        'country':'us',
        'category':'science',
        'apiKey':'d48789e203084bad9900d0411b20eaae',
      })
          .then((value){
        science=value.data['articles'];
        print(science.length);

        emit(NewsGetScienceSuccessState());
      }).catchError((error){

        print("Error => ${error.toString()}");
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else{
      emit(NewsGetScienceSuccessState());

    }

  }

}
