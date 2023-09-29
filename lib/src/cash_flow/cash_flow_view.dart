import 'package:flutter/material.dart';

import '../settings/settings_view.dart';

class CashFlowView extends StatefulWidget {
  const CashFlowView({super.key});

  static const routeName = '/cash-flow';

  @override
  CashFlowViewState createState() => CashFlowViewState();
}

class CashFlowViewState extends State<CashFlowView> {
  final List<CashFlowItem> _items = List.generate(
    100,
    (index) => CashFlowItem(
      type: index % 2 == 0
          ? CashFlowItemType.income
          : CashFlowItemType.expenditure,
      nominal: (index + 1) * 1000,
      info: "Info $index",
      date: DateTime.now().subtract(Duration(days: index)),
    ),
  );

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Cash Book'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: 4, // Set to null for infinite scrolling
              itemBuilder: (context, index) {
                final itemIndex = index % _items.length;
                final item = _items[itemIndex];
                return ListTile(
                  leading: Icon(
                    item.type == CashFlowItemType.income
                        ? Icons.add
                        : Icons.remove,
                  ),
                  title: Text(
                    item.type == CashFlowItemType.income
                        ? "Rp. ${item.nominal}"
                        : "Rp. ${item.nominal}",
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.info,
                      ),
                      Text(
                        item.date.toString(),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    item.type == CashFlowItemType.income
                        ? Icons.arrow_back
                        : Icons.arrow_forward,
                    color: item.type == CashFlowItemType.income
                        ? Colors.green
                        : Colors.red,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_left),
              label: const Text('Back'),
            ),
          ),
        ],
      ),
    );
  }
}

class CashFlowItem {
  final CashFlowItemType type;
  final int nominal;
  final String info;
  final DateTime date;

  CashFlowItem({
    required this.type,
    required this.nominal,
    required this.info,
    required this.date,
  });
}

enum CashFlowItemType {
  income,
  expenditure,
}
