import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_profit_summary_card/app/controllers/summary_controller.dart';
import 'package:flutter_profit_summary_card/app/core/use_cases/summary_usecase_impl.dart';
import 'package:flutter_profit_summary_card/app/repositories/summary_repository_impl.dart';
import 'package:flutter_profit_summary_card/app/services/graphqi_service_impl.dart';
import 'package:flutter_profit_summary_card/app/services/helper/graphqi_config.dart';
import 'package:flutter_profit_summary_card/app/ui/screens/summary_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => GraphQIConfig.init()),
        Bind((i) => GraphQIServiceImpl(i.get())),
        Bind((i) => SummaryRepositoryImpl(i.get())),
        Bind((i) => SummaryUseCaseImpl(i.get())),
        Bind((i) => SummaryController(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => SummaryScreen()),
      ];
}
