import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employment_test/bloc/order/orders_bloc.dart';
import 'package:employment_test/bloc/products/products_bloc.dart';
import 'package:employment_test/bloc/user/user_bloc.dart';
import 'package:employment_test/data/repositories/order_repository.dart';
import 'package:employment_test/data/repositories/product_repository.dart';
import 'package:employment_test/data/repositories/user_repository.dart';
import 'package:employment_test/ui/tab_box/tab_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/tab/tab_cubit.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(firebaseFirestore: firestore),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(firebaseFirestore: firestore),
        ),
        RepositoryProvider(
          create: (context) => OrdersRepository(firebaseFirestore: firestore),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavCubit(),
          ),
          BlocProvider(
            create: (context) =>
                UsersBloc(userRepository: context.read<UserRepository>())
                  ..add(FetchUsers()),
          ),
          BlocProvider(
            create: (context) => ProductsBloc(
                productRepository: context.read<ProductRepository>())
              ..add(FetchProducts()),
          ),
          BlocProvider(
            create: (context) => OrdersBloc(
                ordersRepository: context.read<OrdersRepository>())
              ..add(FetchOrders()),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employment_test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabBoxPage(),
    );
  }
}
