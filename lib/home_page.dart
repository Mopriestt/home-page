import 'package:flutter/material.dart';
import 'package:home_page/grid_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _features = <Widget>[];

  void showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Coming soon'),
      duration: Duration(seconds: 1),
    ));
  }

  Widget _buildPdfToolGrid(BuildContext context) => GridCard(
        onClick: () => showComingSoon(context),
        child: const ListTile(
          title: Text('PDF Converter', textAlign: TextAlign.center),
        ),
      );

  Widget _buildQRToolGrid(BuildContext context) => GridCard(
        onClick: () => showComingSoon(context),
        child: const ListTile(
          title: Text('QR Code', textAlign: TextAlign.center),
        ),
      );

  Widget _buildAddMoreCard(BuildContext context) => GridCard(
        onClick: () =>
            setState(() => _features.add(_buildAddMoreCard(context))),
        child: const Icon(Icons.add),
      );

  Widget _buildGrids(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 24,
      children: [..._features], // GridView hack.
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_features.isEmpty) {
      _features.addAll([
        _buildPdfToolGrid(context),
        _buildQRToolGrid(context),
        _buildAddMoreCard(context),
      ]);
    }
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Home Page!',
              style: TextStyle(fontSize: 64, color: Colors.blue),
            ),
            Expanded(child: SizedBox(width: 500, child: _buildGrids(context))),
          ],
        ),
      ),
    );
  }
}
