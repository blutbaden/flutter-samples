import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

// future builder to review

class OrdersScreen extends StatelessWidget {
  static final routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    // final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (dataSnapshot.error != null) {
            return Center(
              child: Text('An error occured!'),
            );
          } else {
            return Consumer<Orders>(
              builder: (ctx, ordersData, child) => ListView.builder(
                itemBuilder: (ctx, i) => OrderItem(ordersData.orders[i]),
                itemCount: ordersData.orders.length,
              ),
            );
          }
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
