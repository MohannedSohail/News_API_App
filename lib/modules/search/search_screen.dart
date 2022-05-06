import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_api/shared/components/components.dart';
import 'package:news_app_api/shared/cubit/cubit.dart';
import 'package:news_app_api/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // if (state is NewsGetSearchSuccessState) {
        //   Center(child: CircularProgressIndicator());
        // }
      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        var list = cubit.search;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: cubit.isDark ? Color(0xff242526) : Colors.white,
            elevation: 0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                  onChange: (value) {
                    // if(state is NewsSearchLoadingState){
                    //
                    //   Center(child: CircularProgressIndicator());
                    // }

                    cubit.getSearch(value);

                    // if (value.toString().isEmpty) {
                    //
                    //   cubit.clearSearchList(searchController.text,value);
                    //
                    // } else {
                    //   cubit.getSearch(value);
                    // }
                  },
                  controller: searchController,
                  // maxLength: 4,
                  validator: (value) {
                    if (value.isEmpty) {
                      CupertinoActivityIndicator(
                        animating: true,
                        color: Colors.white,
                      );
                      return 'Search Must Not Be Empty';
                    }
                    return null;
                  },
                  // labelTxt: "Search",
                  hintTxt: "Search",

                  //   hintTxtStyle: TextStyle(color: cubit.isDark?Colors.white:Colors.black),
                  styleTxtFormField: TextStyle(
                      color: cubit.isDark ? Colors.white : Colors.black),
                  //   // lblStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                  ),
                  // enabledborderColor: OutlineInputBorder(
                  //   borderSide: BorderSide(color: cubit.isDark?Colors.white:Colors.black,),
                  //   borderRadius: BorderRadius.circular(10)
                  // ),
                  // focusedborderColor: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.teal,width: 2),
                  //     borderRadius: BorderRadius.circular(10)
                  // ),
                  // prefixIconColor: Colors.white,
                ),
              ),
              searchController.text.isEmpty
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            "assets/images/searching_lottie.json",
                          ),
                          Text("Please! Search To Show Results",
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    cubit.isDark ? Colors.white : Colors.black,
                              )),
                        ],
                      ),
                    )

              :state is NewsGetSearchSuccessState? Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                    child: CircularProgressIndicator()),
              )
                  : Expanded(
                      child: screenBuilder(
                      list,
                      context,
                      isSearch: true,
                    )),
            ],
          ),
        );
      },
    );
  }
}
