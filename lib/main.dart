import 'core/consts/exports.dart';
import 'core/injection/injectable.dart';
import 'features/task2/views/main_screen.dart';

late MainContext rootContext;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  rootContext = getIt<MainContext>();
  runApp(const TaslemaTask());
}

class TaslemaTask extends StatefulWidget {
  const TaslemaTask({
    super.key,
  });

  @override
  State<TaslemaTask> createState() => _TaslemaTaskState();
}

class _TaslemaTaskState extends State<TaslemaTask> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootContext.nav,
      debugShowCheckedModeBanner: false,
      //  home: PostsScreen(),
      home: const MainScreen(),
      theme: Themes.light,
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          defaultName: MOBILE,
          defaultNameLandscape: MOBILE,
          breakpoints: [
            const ResponsiveBreakpoint.resize(
              480,
              name: MOBILE,
              scaleFactor: 1.0,
            ),
            const ResponsiveBreakpoint.autoScale(
              800,
              name: TABLET,
              scaleFactor: 0.9,
            ),
            const ResponsiveBreakpoint.resize(
              1000,
              name: DESKTOP,
            ),
            const ResponsiveBreakpoint.autoScale(
              2460,
              name: '4K',
            ),
          ],
        );
      },
    );
  }
}
