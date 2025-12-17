// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:food/data/all_products.dart';
// import 'package:food/screens/home_screen.dart';

// class AdminUploadFoods extends StatefulWidget {
//   const AdminUploadFoods({super.key});

//   @override
//   State<AdminUploadFoods> createState() => _AdminUploadFoodsState();
// }

// class _AdminUploadFoodsState extends State<AdminUploadFoods> {
//   bool isUploading = false;

//   Future<void> uploadDummyFoods() async {
//     setState(() => isUploading = true);

//     final firestore = FirebaseFirestore.instance;

//     for (var food in dummyFoods) {
//       await firestore.collection("food").add({
//         "category": food.category,
//         "name": food.name,
//         "image": food.image,
//         "price": food.price,
//         "rating": food.rating,
//         "size": food.size,
//         "description": food.description,
//         "deliveryTime": food.deliveryTime,
//         "restaurantName": food.restaurantName,
//         "isPopular": food.isPopular,
//         "isRecommended": food.isRecommended,
//       });
//     }

//     setState(() => isUploading = false);
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => HomeScreen()),
//     );

//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text("All foods uploaded successfully!")));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Admin Upload Foods")),
//       body: Center(
//         child: isUploading
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 20),
//                   Text("Uploading... please wait"),
//                 ],
//               )
//             : ElevatedButton(
//                 onPressed: uploadDummyFoods,
//                 child: Text("Upload Dummy Foods to Firestore"),
//               ),
//       ),
//     );
//   }
// }
