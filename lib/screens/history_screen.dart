import 'package:flutter/material.dart';
import 'package:food/provider/order_provider.dart';
import 'package:food/widgets/order_card.dart';
import 'package:provider/provider.dart';

class HistoryOrdersScreen extends StatelessWidget {
  const HistoryOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<OrderProvider>().history;

    if (orders.isEmpty) {
      return const Center(child: Text("No Past Orders"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(order: orders[index], isHistory: true);
      },
    );
  }
}
