import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

// Command used to generat the code :
// flutter pub run build_runner watch —delete-conflicting-outputs

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
@InjectableInit(generateForDir: ['test'])
void configureDependencies() => $initGetIt(getIt);
