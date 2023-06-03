import 'package:taslema_task/core/bloc/bloc_request.dart';
import 'package:taslema_task/core/bloc/event.dart';
import 'package:taslema_task/features/task2/views/home_screen.dart';

import '../../../core/consts/exports.dart';
import '../../../core/injection/injectable.dart';
import '../logic/main_bloc.dart';
import '../widgets/bottom_bar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final _bloc = getIt<MainBloc>()
    ..init(this)
    ..add(LoadingEvent(data: 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _bloc.tabController,
          children: [
            HomeScreen(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: BlocRequest<MainBloc>(
        bloc: _bloc,
        onSuccess: (context, state) {
          return BottomAppBar(
            //  shape: const CircularNotchedRectangle(),
            // notchMargin: 10.0,
            child: BottomBarWidget(
              onChanged: (index) {
                _bloc.add(LoadingEvent(data: index));
              },
              groupValue: _bloc.indx,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocRequest<MainBloc>(
        bloc: _bloc,
        onSuccess: (context, state) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Coolors.primaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.0,
                  color: Coolors.highLight,
                  spreadRadius: 1.0,
                )
              ],
              shape: BoxShape.circle,
            ),
            child: BottomBarItem(
              color: Coolors.white,
              active: _bloc.indx == 2,
              icon: Svgs.add,
              title: '',
            ),
          ).addAction(
            onGesture: () {
              _bloc.add(LoadingEvent(data: 2));
            },
          );
        },
      ),
    );
  }
}
