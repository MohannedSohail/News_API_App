import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/shared/cubit/cubit.dart';
import 'package:news_app_api/shared/cubit/states.dart';
import 'package:news_app_api/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      // create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience(),
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (BuildContext context, Object? state) {

          NewsCubit cubit = NewsCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                title: Text("News App"),
                actions: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.search)),
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
                  backgroundColor: Colors.white,
                  animationDuration: Duration(seconds: 1),
                  height: 60,
                  labelBehavior:NavigationDestinationLabelBehavior.onlyShowSelected,
                  selectedIndex: cubit.currentIndex,
                  onDestinationSelected: (int newIndex) {
                    cubit.changeIndex(newIndex);
                  },
                  destinations:  [

                    NavigationDestination(
                      selectedIcon: Icon(Icons.business,
                        color: Colors.brown,

                      ),
                      icon: Icon(Icons.business_outlined),
                      label: 'Business',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(
                        Icons.science,
                        color: Colors.deepOrange,
                      ),
                      icon: Icon(Icons.science_outlined),
                      label: 'Science',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(Icons.sports,
                        color: Colors.green[800],

                      ),
                      icon: Icon(Icons.sports_outlined),
                      label: 'Sports',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(Icons.settings,),
                      icon: Icon(Icons.settings_outlined),
                      label: 'Settings',
                    ),
                  ],
                ),
            body: cubit.screens[cubit.currentIndex],
              );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
