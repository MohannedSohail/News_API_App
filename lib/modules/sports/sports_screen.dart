
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list=cubit.sports;

        return list.length>0
            ? ListView.separated(

          // Rendering number of Images
          // physics: PageScrollPhysics(parent: BouncingScrollPhysics()),


            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return buildNewsItem(list[index]);
            },
            separatorBuilder: (context, index) => Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              height: 2,
              color: Colors.grey[350],
            ),
            itemCount: cubit.business.length):
        Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
