import 'package:flutter/material.dart';

void main() => runApp(const ThunderMusicApp());

class ThunderMusicApp extends StatelessWidget {
  const ThunderMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFF101014);
    const panel = Color(0xFF1C1C24);
    const accent = Color(0xFFB58CFF);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'THUNDER MUSIC',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent, brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(panel: panel, accent: accent),
    );
  }
}

class HomePage extends StatefulWidget {
  final Color panel;
  final Color accent;
  const HomePage({super.key, required this.panel, required this.accent});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0;
  final pages = const ['Your music', 'Discover', 'Search', 'Downloads'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('THUNDER MUSIC',
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.2)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(pages[tab], style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: widget.panel, borderRadius: BorderRadius.circular(22),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.library_music_rounded, size: 42, color: widget.accent),
              const SizedBox(height: 12),
              const Text('Your music starts here',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('The next build will add local audio scanning and VidMate imports.'),
              const SizedBox(height: 14),
              FilledButton.icon(
                onPressed: () => _message(context),
                icon: const Icon(Icons.folder_open),
                label: const Text('Import music — coming next'),
              ),
            ]),
          ),
          const SizedBox(height: 18),
          const Text('Recently played', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const ListTile(
            leading: CircleAvatar(child: Icon(Icons.music_note)),
            title: Text('No songs scanned yet'),
            subtitle: Text('Local library scanning will be added in the next build.'),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: widget.panel, borderRadius: BorderRadius.circular(18)),
            child: const Row(children: [
              Icon(Icons.music_note_rounded),
              SizedBox(width: 12),
              Expanded(child: Text('Nothing playing')),
              Icon(Icons.skip_previous_rounded),
              SizedBox(width: 12),
              Icon(Icons.play_arrow_rounded),
              SizedBox(width: 12),
              Icon(Icons.skip_next_rounded),
            ]),
          ),
        ]),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.library_music_outlined), label: 'Library'),
          NavigationDestination(icon: Icon(Icons.explore_outlined), label: 'Discover'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.download_outlined), label: 'Downloads'),
        ],
      ),
    );
  }

  void _message(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Music import is planned for the next build.')),
    );
  }
}
