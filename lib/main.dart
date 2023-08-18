import 'layout/news_app_layout.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sp_task/sheared/cubit/cubit.dart';
import 'package:sp_task/sheared/cubit/state.dart';
import 'package:sp_task/sheared/cubit/search_cubit.dart';
import 'package:sp_task/sheared/network/local/cach_helper.dart';
import 'package:sp_task/sheared/network/remote/dio_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ensure that all init fun are initialize
  dio_helper.init();
  await cashHelper.init();
  bool? isdark = cashHelper.getBooleanData(key: 'isDark');
  runApp(MyApp(
    isDark: isdark,
  ));
}

class MyApp extends StatelessWidget {
  final isDark;
  MyApp({this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String lang = "ar";
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..ChangeThemeMode(fromReferances: isDark)
            ..getBusinessData(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
      ],
      child: BlocConsumer<NewsCubit, newsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //               locale: Locale(lang),
            //         localizationsDelegates: const[
            //           AppLocale.delegate,
            //           GlobalMaterialLocalizations.delegate,
            //           GlobalWidgetsLocalizations.delegate,
            //         ],
            // supportedLocales:const [
            //   Locale('en',""),
            //   Locale('ar',"")
            // ],

            // localeListResolutionCallback: (current_lang, supported_lang) {
            //   if(current_lang!=null)
            //   {
            //     if(lang=="en") return   supported_lang.first;
            //     else  return   supported_lang.last;
            //   }
            //   return supported_lang.first;
            // },

            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('4C4C4C'),

              appBarTheme: AppBarTheme(
                  elevation: 0.0,
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  backgroundColor: HexColor('4C4C4C'),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('4C4C4C'),
                    statusBarBrightness: Brightness.light,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  )),
              textTheme: TextTheme(
                  bodyMedium: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                    ,
                color: Colors.white,
              )),
              primarySwatch: Colors.amber,

              // useMaterial3: true,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('4C4C4C'),
                selectedItemColor: Colors.amber,
                unselectedItemColor: Color.fromARGB(255, 169, 169, 169),
              ),
            ),

            theme: ThemeData(
              textTheme: TextTheme(
                  bodyMedium: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                    ,
                color: Colors.black,
              )),
              appBarTheme: const AppBarTheme(
                scrolledUnderElevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.dark,
                ),
              ),
              primarySwatch: Colors.amber,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                // type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.amber,
                unselectedItemColor: const Color.fromARGB(255, 48, 47, 46),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            initialRoute: '/',
            routes: {
              '/': (context) => start(),
            },
          );
        },
      ),
    );
  }
}
