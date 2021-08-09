import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example1/general_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF212332),
        canvasColor: const Color(0xFF103F6B),
      ),
      home: const MyHomePage2(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  void _increment(BuildContext context) {
    context.read(numberStateNotifierProvider).add(5.toString());
  }

  @override
  Widget build(BuildContext context, watch) {
    final number = watch(numberProvider);
    final numberState = watch(numberStateProvider).state;
    final numberStateNotifier = watch(numberStateNotifierProvider);
    final numberChangeNotifier = watch(numberChangeNotifierProvider);

    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: numberChangeNotifier.numbers.length,
          itemBuilder: (context, index) {
            return Text(numberChangeNotifier.numbers[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => numberChangeNotifier.add(UniqueKey().toString()),
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyHomePage2 extends ConsumerWidget {
  const MyHomePage2({Key? key, required this.title}) : super(key: key);
  final String title;

  void _increment(BuildContext context) {
    context.read(numberStateNotifierProvider).add(5.toString());
  }

  @override
  Widget build(BuildContext context, watch) {
    final numberFuture = watch(numberFutureProvider);
    final numberStream = watch(numberStreamProvider);
    return Scaffold(
      body: Center(
        child: numberStream.when(
          data: (data) => Text(data.toString()),
          loading: () => const CircularProgressIndicator.adaptive(),
          error: (error, trace) => const SizedBox(),
        ),
      ),
    );
  }
}
