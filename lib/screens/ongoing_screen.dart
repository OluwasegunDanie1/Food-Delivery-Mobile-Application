import 'package:flutter/material.dart';
import 'package:food/provider/order_provider.dart';
import 'package:food/widgets/order_card.dart';
import 'package:provider/provider.dart';

class OngoingOrdersScreen extends StatelessWidget {
  const OngoingOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = context.watch<OrderProvider>().ongoing;

    if (orders.isEmpty) {
      return const Center(child: Text("No Ongoing Orders"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(order: orders[index], isHistory: false);
      },
    );
  }
}
