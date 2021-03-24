import 'package:api_call_bloc/bloc/this_for_that/this_for_that_cubit.dart';
import 'package:api_call_bloc/repository/this_for_that_repository.dart';
import 'package:api_call_bloc/view/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (context) => ThisForThatCubit(ThisForThatRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    ),
  );
}
