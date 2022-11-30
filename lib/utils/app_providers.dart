import 'package:ems/src/di_injection.dart' as di;
import 'package:ems/src/view_models/auth_view_model.dart';
import 'package:ems/src/view_models/create_profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<AuthViewModel>(
        create: (_) => di.sl<AuthViewModel>()),
    ChangeNotifierProvider<CreateProfileViewModel>(
        create: (_) => di.sl<CreateProfileViewModel>()),
  ];
}
