import 'package:ble_reader/ble_reader.dart';
import 'package:riverpod/riverpod.dart';

final bleStreamProvider =
    StreamProvider<dynamic>((ref) => BleReader.receivedDataStream);
