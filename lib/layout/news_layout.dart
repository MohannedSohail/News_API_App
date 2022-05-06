import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/modules/search/search_screen.dart';
import 'package:news_app_api/shared/components/components.dart';
import 'package:news_app_api/shared/cubit/cubit.dart';
import 'package:news_app_api/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (BuildContext context, Object? state) {

        NewsCubit cubit = NewsCubit.get(context);

        cubit.checkInternet();


        return cubit.isConnection==true? Scaffold(
            appBar: cubit.currentIndex==3?AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ) :AppBar(
              title: Text("Daily News App"),
              actions: [
                IconButton(onPressed: (){
                  cubit.search=[];
                  navigateTo(context, SearchScreen());
                }, icon: Icon(Icons.search,color: cubit.isDark ? Colors.white : Colors.black,)),
              ],
            ),

            // floatingActionButton: FloatingActionButton(
            //   onPressed: ()  {
            //
            //     // cubit.getBusiness();
            //   },
            //   child: Icon(Icons.add,color: Colors.black),
            // ),
            bottomNavigationBar: NavigationBar(
                animationDuration: Duration(seconds: 1),
                height: 60,
                labelBehavior:NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: cubit.currentIndex,
                onDestinationSelected: (int newIndex) {
                  cubit.changeIndex(newIndex);
                },
                destinations:  [

                  NavigationDestination(
                    selectedIcon: Icon(Icons.business_center,
                      color: Colors.brown[800],

                    ),
                    icon: Icon(Icons.business_center_outlined,color: cubit.isDark?Colors.white:Colors.black),
                    label: 'Business',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.science,
                      color: Colors.deepOrange,
                    ),
                    icon: Icon(Icons.science_outlined,color: cubit.isDark?Colors.white:Colors.black),
                    label: 'Science',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.sports_volleyball_rounded,
                      color: Colors.green[700],

                    ),
                    icon: Icon(Icons.sports_volleyball_outlined,color: cubit.isDark?Colors.white:Colors.black),
                    label: 'Sports',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.settings,color: Colors.indigo[900]),
                    icon: Icon(Icons.settings_outlined,color: cubit.isDark?Colors.white:Colors.black),
                    label: 'Settings',
                  ),
                ],
              ),
          body: cubit.screens[cubit.currentIndex],
            ):Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 350,
                  width: 350,
                  child: Image.asset("assets/images/No connection.png"),
                ),
                SizedBox(height: 10,),
                Text("No Internet !",style: TextStyle(color: cubit.isDark?Colors.white:Colors.black,fontSize: 18)),
                SizedBox(height: 10,),
                Text("Please Check Your Internet\nConnection",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w600,),textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {

      },
    );
  }
}


