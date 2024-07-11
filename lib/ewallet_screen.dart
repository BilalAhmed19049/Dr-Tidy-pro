import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EWalletScreen extends StatefulWidget {
  @override
  _EWalletScreenState createState() => _EWalletScreenState();
}

class _EWalletScreenState extends State<EWalletScreen>
    with SingleTickerProviderStateMixin {
  double availableBalance = 150.75;
  List<Map<String, dynamic>> transactions = [
    {"date": "2024-07-01", "amount": -20.0, "description": "Cleaning Service"},
    {"date": "2024-06-25", "amount": 50.0, "description": "Top-up"},
    {"date": "2024-06-20", "amount": -30.0, "description": "Cleaning Service"},
    {"date": "2024-06-15", "amount": 100.0, "description": "Top-up"},
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void transferToAccount() {
    // Implement the transfer to account functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Wallet'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Balance & Debits'),
            Tab(text: 'Deductions & Credits'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Available Balance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Gap(10),
                Text(
                  'RM${availableBalance.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Gap(30),
                Text(
                  'Transaction History',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      if (transaction["amount"] < 0) {
                        return ListTile(
                          leading: Icon(Icons.remove, color: Colors.red),
                          title: Text(transaction["description"]),
                          subtitle: Text(transaction["date"]),
                          trailing: Text(
                            '- RM ${transaction["amount"].abs().toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deductions & Credits',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      if (transaction["amount"] > 0) {
                        return ListTile(
                          leading: Icon(Icons.add, color: Colors.green),
                          title: Text(transaction["description"]),
                          subtitle: Text(transaction["date"]),
                          trailing: Text(
                            '+ RM ${transaction["amount"].toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
