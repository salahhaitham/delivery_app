
import 'package:delivery_app/Features/Home/presentation/Cubits/Home_Cubit/Home_Cubit.dart';
import 'package:delivery_app/Features/Home/presentation/Views/HomeView.dart';
import 'package:delivery_app/Features/Home/presentation/Views/widgets/Home_ViewBody/widgets/HomeViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key,required this.onBrowsePressed});
  final VoidCallback onBrowsePressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          const Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            'Add items to start your order',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onBrowsePressed,
            child: const Text('Browse restaurant'),
          ),
        ],
      ),
    );
  }
}
