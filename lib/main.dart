import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/shared/cubit/cubit.dart';
import 'package:news_app_api/shared/cubit/states.dart';
import 'package:news_app_api/shared/network/local/cache_helper.dart';
import 'package:news_app_api/shared/network/remote/dio_helper.dart';

import 'layout/news_layout.dart';

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();
  print("DioHelper Is Initialed");

  await CacheHelper.initSharedPreferences();

  bool? isDark=CacheHelper.getData(key: "isDark");
  runApp(MyApp(isDark));


}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.


  final bool? isDark;


  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    // To Hide Status Bar & Bottom Bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..changeAppMode(darkMode: isDark)
        ..getBusiness(),
        // ..getSports()
        // ..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: ' Daily News App',
            theme: ThemeData(

              progressIndicatorTheme: ProgressIndicatorThemeData(
                circularTrackColor: Colors.teal,
                color: Colors.grey,
              ),
              navigationBarTheme: NavigationBarThemeData(
                backgroundColor: Colors.grey.shade100,
                indicatorColor: Colors.teal.withOpacity(0.3),
                labelTextStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.teal,
                splashColor: Colors.tealAccent,
                elevation: 10,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w400),
                backgroundColor: Colors.teal.withOpacity(0.6),
                // centerTitle: true,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  // statusBarBrightness: Brightness.light,
                  // statusBarIconBrightness: Brightness.dark,
                ),
                elevation: 0,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),

              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Color(0xff242526),
              progressIndicatorTheme: ProgressIndicatorThemeData(
                circularTrackColor: Colors.black,
                color: Colors.teal[200],
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Color(0xff3a3b3c),
                    // statusBarBrightness: Brightness.light,
                    // statusBarIconBrightness: Brightness.dark,
                  ),
                titleSpacing: 20,
                  backgroundColor: Color(0xff3a3b3c),
                  actionsIconTheme: IconThemeData(
                    color: Colors.white,

                  )),
              navigationBarTheme: NavigationBarThemeData(
                backgroundColor: Color(0xff3a3b3c),
                indicatorColor: Colors.white,

                labelTextStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
                textDirection:cubit.isRtl?TextDirection.rtl: TextDirection.ltr, child: NewsLayout()),
          );
        },
      ),
    );
  }
}
