import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/shared/components/components.dart';
import 'package:news_app_api/shared/cubit/cubit.dart';
import 'package:news_app_api/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        NewsCubit cubit=NewsCubit.get(context);
        var list=cubit.search;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: cubit.isDark? Color(0xff242526):Colors.white,
            elevation: 0,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(

                  onChange: (value){
                    cubit.getSearch(value);
                  },
                    controller: searchController,
                    validator: (value) {
                      if (value.isEmpty) {
                        CupertinoActivityIndicator(animating: true,color: Colors.white,);
                        return 'Search Must Not Be Empty';
                      }
                      return null;
                    },
                    // labelTxt: "Search",
                  hintTxt: "Search",
                //   hintTxtStyle: TextStyle(color: cubit.isDark?Colors.white:Colors.black),
                  styleTxtFormField: TextStyle(color: cubit.isDark?Colors.white:Colors.black),
                //   // lblStyle: TextStyle(color: Colors.white),
                    prefixIcon:Icon(Icons.search_rounded,),
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
              Expanded(child: screenBuilder(list, context,)),
            ],
          ),
        );
      },
    );
  }
}
