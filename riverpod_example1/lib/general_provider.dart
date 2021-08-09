import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example1/services/number_management.dart';

final numberProvider = Provider<int>((ref) => 43);
final numberStateProvider = StateProvider<int>((ref) => 42);
final numberStateNotifierProvider =
    StateNotifierProvider<NumbersNotifier, List<String>>(
        (ref) => NumbersNotifier(null));
final numberChangeNotifierProvider =
    ChangeNotifierProvider<NumbersChangeNotifier>(
        (ref) => NumbersChangeNotifier());
final numberFutureProvider = FutureProvider<int>((ref) => Future.value(42));
final numberStreamProvider = StreamProvider<int>((ref) => Stream.value(54));
