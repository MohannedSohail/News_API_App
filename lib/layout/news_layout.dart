import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/modules/search/search_screen.dart';
import 'package:news_app_api/shared/components/components.dart';
import 'package:news_app_api/shared/cubit/cubit.dart';
import 'package:news_app_api/shared/cubit/states.dart';
import 'package:news_app_api/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (BuildContext context, Object? state) {

        NewsCubit cubit = NewsCubit.get(context);

        return Scaffold(
            appBar: cubit.currentIndex==3?AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ) :AppBar(
              title: Text("Daily News App"),
              actions: [
                IconButton(onPressed: (){

                  navigateTo(context, SearchScreen());
                }, icon: Icon(Icons.search)),
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
            );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
