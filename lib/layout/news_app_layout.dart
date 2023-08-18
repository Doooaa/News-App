import '../sheared/cubit/cubit.dart';
import '../sheared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:sp_task/screens/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sp_task/sheared/widget/navigation.dart';
import 'package:sp_task/sheared/network/local/cach_helper.dart';


 bool? isdark= cashHelper.getBooleanData(key: 'isDark');
class start extends StatelessWidget {
  const start({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, newsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("News App", style: const TextStyle(
                     // color: Color.fromARGB(255, 72, 77, 79),
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ), 
                    ),
                  actions: [
                    IconButton(onPressed: (){
                   navigateToScreen(context, Search_screen());
                    }, icon: Icon(Icons.search)),
                   IconButton(onPressed: (){cubit.ChangeThemeMode();},
                    icon: Icon(Icons.brightness_6_outlined))
                  ],
            ),
              
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.BottomNavItems,
              currentIndex: cubit.currenIndex_navBar,
              onTap: (value) {
                cubit.ontap_BottomNavbar(value);
                cubit.getBusinessData();
              },
            ),
            body: cubit.Screens[cubit.currenIndex_navBar],
          ),
        );
      },
    );
  }
}
