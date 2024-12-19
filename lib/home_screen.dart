import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int rows = 12;
  final int columns = 12;
  List<List<bool?>> grid = List.generate(12, (index) => List.filled(12, null));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text(
          'Connect Four Game',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0, left: 8, right: 8),
        child: Column(
          children: [
            SizedBox(
              height: 450,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0,
                ),
                itemCount: rows * columns,
                itemBuilder: (context, index) {
                  int row = index ~/ columns;
                  int col = index % columns;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (grid[row][col] == null) {
                          grid[row][col] = true;
                        }
                      });
                    },
                    child: Card(
                      color: Colors.blueAccent,
                      child: grid[row][col] == null
                          ? null
                          : CircleAvatar(
                              backgroundColor:
                                  grid[row][col]! ? Colors.red : Colors.yellow,
                            ),
                    ),
                  );
                },
              ),
            ),
            Text(
              'Congratulations',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
