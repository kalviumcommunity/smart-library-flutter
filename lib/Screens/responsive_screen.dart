import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Library'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Colors.blue.shade100,
                child: Text(
                  'Welcome to Smart Library',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ),

              // MAIN CONTENT
              Expanded(
                child: isTablet
                    ? GridView.count(
                        padding: const EdgeInsets.all(16),
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        children: _buildCards(),
                      )
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: _buildCards(),
                      ),
              ),

              // FOOTER / ACTION AREA
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                color: Colors.blue.shade50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Explore Books'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildCards() {
    return List.generate(
      4,
      (index) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.book, size: 40, color: Colors.blue),
              const SizedBox(height: 8),
              Text(
                'Book Category ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
