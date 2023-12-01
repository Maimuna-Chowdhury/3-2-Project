import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  var _firestoreInstance=FirebaseFirestore.instance;
  List<Map<String, dynamic>> _products = [];
  TextEditingController _searchController = TextEditingController();
  Future<void> fetchProducts() async {
    try {
      QuerySnapshot querySnapshot = await _firestoreInstance.collection("products").get();
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          _products = querySnapshot.docs.map((doc) {
            return {
              "name": doc["name"],
              "description": doc["description"],
              "price": doc["price"],
              "img": doc["img"],
            };
          }).toList();
        });
      } else {
        print("No products found");
      }
    } catch (e) {
      print("Error fetching products: $e");
    }
  }
  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ... (previous code)

              // Add a medium-sized card (featured product)
              Card(
                elevation: 3,
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Featured Product',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Detail 1',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                'Detail 2',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'Detail 3',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Detail 4',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              Text(
                                'Detail 5',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                'Detail 6',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  throw UnimplementedError();
  }

}


