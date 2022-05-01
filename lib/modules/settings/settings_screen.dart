import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/shared/cubit/cubit.dart';
import 'package:news_app_api/shared/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        NewsCubit cubit = NewsCubit.get(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "Settings",
                style:cubit.isDark? TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ):
                TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                )
                ,
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: 320,
                  margin: EdgeInsets.only(right: 15, left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: cubit.isDark? Color(0xffe4e6eb):Colors.black87,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.dark_mode_outlined,color: cubit.isDark? Colors.black:Colors.white),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(child: Text(" Dark Mode",style: TextStyle(
                              color: cubit.isDark? Colors.black:Colors.white,
                            ),)),
                            Switch(
                              value: cubit.isDark,
                              activeTrackColor: Colors.teal.withOpacity(0.3),
                              activeColor:Colors.teal,
                              inactiveThumbColor: cubit.isDark? Color(0xff18191a):Colors.white,
                              inactiveTrackColor:cubit.isDark? Colors.black54:Color(0xffb0b3b8),
                              onChanged: (value) {
                                // cubit.ChangeAppMode(value);
                                cubit.changeAppMode();

                                print(" App Mode ${cubit.isDark}");
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.language,color: cubit.isDark? Colors.black:Colors.white),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(child: Text(" Change Application direction",style: TextStyle(
                              color: cubit.isDark? Colors.black:Colors.white,
                            ),)),
                            Switch(
                              value: cubit.isRtl,
                              activeTrackColor: Colors.teal.withOpacity(0.3),
                              activeColor:Colors.teal,
                              inactiveThumbColor: cubit.isDark? Color(0xff18191a):Colors.white,
                              inactiveTrackColor:cubit.isDark? Colors.black54:Color(0xffb0b3b8),
                              onChanged: (value) {

                                cubit.changeAppLanguage();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
