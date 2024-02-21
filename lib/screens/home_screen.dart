import 'package:flutter/material.dart';
import 'package:reminderpro/widgets/bottom_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showBottomnModal() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showBottomnModal,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3,
        child: Icon(
          Icons.add,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      body: const Center(
        child: Text(
          'Hello User!',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
