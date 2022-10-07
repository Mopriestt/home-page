import 'package:flutter/material.dart';
import 'package:home_page/grid_card.dart';
import 'dart:math' as math;

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

  Widget _buildChatroomGrid(BuildContext context) => GridCard(
        onClick: () => Navigator.pushNamed(context, 'chatroom'),
        child: const ListTile(
          title: Text('Chatroom', textAlign: TextAlign.center),
        ),
      );

  Widget _buildAddMoreCard(BuildContext context) => GridCard(
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
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

  Widget _buildTitle(BuildContext context) {
    return Image.asset(
      'assets/gif/shake.gif',
      height: 125.0,
      width: 125.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_features.isEmpty) {
      _features.addAll([
        _buildChatroomGrid(context),
        _buildAddMoreCard(context),
      ]);
    }
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Column(
          children: [
            _buildTitle(context),
            Expanded(child: SizedBox(width: 500, child: _buildGrids(context))),
          ],
        ),
      ),
    );
  }
}
