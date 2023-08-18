import '../sheared/cubit/cubit.dart';
import '../sheared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sp_task/sheared/widget/articslBuilder.dart';



class sports_screen extends StatelessWidget {
  const sports_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, newsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).sports; //buildArticalItems()

        return AritcalBuilder(list);
      },
    );
  }
}
