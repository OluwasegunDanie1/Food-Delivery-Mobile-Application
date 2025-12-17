import 'package:flutter/material.dart';
import 'package:food/constants/app_colors.dart';
import 'package:food/screens/history_screen.dart';

import 'package:food/screens/ongoing_screen.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "My Orders",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),

          leading: IconButton(
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.more_horiz),
              ),

              onPressed: () {},
              // onPressed: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomeScreen()),
              // ),
            ),
          ],
          bottom: TabBar(
            labelColor: AppColors.btn,
            unselectedLabelColor: AppColors.darkgrey,
            labelStyle: TextStyle(fontWeight: FontWeight.w600),
            indicatorColor: Colors.orange,
            tabs: [
              Tab(text: "Ongoing"),
              Tab(text: "History"),
            ],
          ),
        ),

        body: const TabBarView(
          children: [OngoingOrdersScreen(), HistoryOrdersScreen()],
        ),
      ),
    );
  }
}
