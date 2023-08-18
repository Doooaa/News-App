import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../sheared/cubit/search_cubit_state.dart';
import 'package:sp_task/sheared/cubit/search_cubit.dart';
import 'package:sp_task/sheared/widget/articslBuilder.dart';




class Search_screen extends StatelessWidget {
  TextEditingController? _controller;

  Search_screen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<SearchCubit,SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      
      builder: (context, state) {
        var list=SearchCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(
            title: Text("search",   style:Theme.of(context).textTheme.bodyMedium, ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                // SizedBox(
                //   height: 30,
                // ),
                TextField(
                  style: Theme.of(context).textTheme.bodyMedium, //
                  controller: _controller,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    label: Text('search'),
                    labelStyle: TextStyle(
                      color: Colors.white
                    ),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String value) {
                   SearchCubit.get(context).getSearchData( value);
                  },
                ),
                
                SizedBox(height: 20,),
                Expanded(child: AritcalBuilder(list)),
              ],
            ),
          ),
        );
      },
    );
  }
}
