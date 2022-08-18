import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_admin/providers/product_provider.dart';
import 'package:store_admin/screens/product_detail_screen.dart';
import 'package:store_admin/screens/products_screen.dart';

import './providers/categories_provider.dart';
import './styles/colors.dart';
import './layout/layout.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: const StoreAdmin(),
    ),
  );
}

class StoreAdmin extends StatelessWidget {
  const StoreAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Admin',
      theme: ThemeData(
        fontFamily: 'Almarai',
        scaffoldBackgroundColor: CustomColor.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: CustomColor.black,
          ),
          titleMedium: TextStyle(
            fontSize: 14,
            color: CustomColor.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomColor.black,
          ),
          backgroundColor: CustomColor.white,
          foregroundColor: CustomColor.blue,
        ),
      ),
      home: const LayoutScreen(),
      routes: {
        ProductScreen.routeName: (context) => const ProductScreen(),
        ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
      },
    );
  }
}
