
import 'package:barbershop/data/datasources/datasource.dart';
import 'package:barbershop/data/repos/barbershop_repository_impl.dart';
import 'package:barbershop/domain/helpers/load_data.dart';
import 'package:barbershop/presentation/bloc/barbershop_cubit.dart';
import 'package:barbershop/presentation/view/barbershop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final remoteDataSource = RemoteDataSource();
  final repository = BarbershopRepositoryImpl(remoteDataSource);
  final usecase = LoadBarberShopData(repository);

  runApp(BarbershopApp(usecase));
}

class BarbershopApp extends StatelessWidget {
  final LoadBarberShopData loadBarberShopData;

  BarbershopApp(this.loadBarberShopData);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: BlocProvider(
        create: (_) => BarbershopCubit(loadBarberShopData)..loadData(),
        child: BarbershopHomepage(),
      ),
    );
  }
}
