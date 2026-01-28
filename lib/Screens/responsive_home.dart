import 'package:flutter/material.dart';

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    final bool isTablet = screenWidth > 600;
    final bool isLandscape = screenWidth > screenHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Home'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: isTablet ? 24 : 16,
                horizontal: isTablet ? 32 : 16,
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Text(
                'Welcome to the Responsive Screen',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),

            // Main Content Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isTablet ? 24 : 12),
                child: isTablet || isLandscape
                    ? GridView.count(
                        crossAxisCount: isTablet ? 2 : 1,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: isTablet ? 1.4 : 1.2,
                        children: List.generate(
                          4,
                          (index) => _ContentCard(index: index),
                        ),
                      )
                    : ListView.separated(
                        itemCount: 4,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return _ContentCard(index: index);
                        },
                      ),
              ),
            ),

            // Footer / Action Area
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: isTablet ? 20 : 12,
                horizontal: isTablet ? 32 : 16,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Primary Action'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Secondary Action'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  final int index;

  const _ContentCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Card Title ${index + 1}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  'This content adapts based on screen size and orientation. '
                  'Flexible and adaptive widgets prevent overflow.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
