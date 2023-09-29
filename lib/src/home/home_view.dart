import 'package:flutter/material.dart';

import '../settings/settings_view.dart';

import '../income/income_view.dart';

import '../expenditure/expenditure_view.dart';

import '../cash_flow/cash_flow_view.dart';

import '../user/user_view.dart';

import 'home_chart.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final int _expenditure = 0;
  final int _income = 0;

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  const Text(
                    "Summary This Month",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Expenditure: Rp. $_expenditure",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    "Income: Rp. $_income",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 16, left: 6),
                            child: HomeChart(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.restorablePushNamed(
                                context, IncomeView.routeName);
                          },
                          child: Image.asset(
                            'assets/images/add.png',
                            height: 80,
                            width: 100,
                          ),
                        ),
                        const Text(
                          'Add Income',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.restorablePushNamed(
                                context, ExpenditureView.routeName);
                          },
                          child: Image.asset(
                            'assets/images/remove.png',
                            height: 80,
                            width: 100,
                          ),
                        ),
                        const Text(
                          'Add Expenditure',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.restorablePushNamed(
                                context, CashFlowView.routeName);
                          },
                          child: Image.asset(
                            'assets/images/list.png',
                            height: 80,
                            width: 100,
                          ),
                        ),
                        const Text(
                          'Cash Flow',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.restorablePushNamed(
                                context, UserView.routeName);
                          },
                          child: Image.asset(
                            'assets/images/setting.png',
                            height: 80,
                            width: 100,
                          ),
                        ),
                        const Text(
                          'User Settings',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
