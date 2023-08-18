import 'package:flutter/material.dart';
import '../sheared/widget/articslBuilder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sp_task/sheared/cubit/cubit.dart';
import 'package:sp_task/sheared/cubit/state.dart';



class bisness_screen extends StatelessWidget {
  const bisness_screen({super.key});

  @override
  Widget build(BuildContext context) {
    //consumer kol mara bs el blocprovider fy el main bs ok?
    return BlocConsumer<NewsCubit, newsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).business; //buildArticalItems()
       
        return AritcalBuilder(list);
      },
    );
  }
}
