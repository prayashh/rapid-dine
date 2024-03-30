import 'package:digital_menu/feature/edit/bloc/add%20item%20bloc/add_item_bloc.dart';
import 'package:digital_menu/feature/edit/bloc/fetch%20item%20block/fetch_item_bloc.dart';
import 'package:digital_menu/feature/edit/bloc/validation%20bloc/validation_bloc.dart';
import 'package:digital_menu/feature/edit/presentation/ui/edit_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ValidationBloc>(create: (_) => ValidationBloc()),
          BlocProvider<FetchItemBloc>(create: (_) => FetchItemBloc()),
          BlocProvider<AddItemBloc>(create: (_) => AddItemBloc()),
        ],
        child: const AddItem(),
      ),
    );
  }
}
