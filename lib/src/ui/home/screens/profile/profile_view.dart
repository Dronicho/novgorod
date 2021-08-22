import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/bloc/authentication/authentication.dart';
import 'package:test_map/src/domain/models/user.dart';
import 'package:test_map/src/domain/repository/auth.dart';
import 'package:test_map/src/ui/login/login.dart';
import 'package:test_map/src/widgets/primary_button.dart';

class AuthProtected extends StatelessWidget {
  const AuthProtected({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final state = context.read<AuthenticationBloc>().state;

    if (state.status == AuthenticationStatus.unauthenticated) {
      SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
        Navigator.of(context).push(LoginPage.route());
      });
      return Container();
    }

    return child;
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthenticationBloc>().state.user;
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Профиль',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold)),
                    IconButton(
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(AuthenticationLogoutRequested());
                      },
                      icon: Icon(Icons.logout),
                    )
                  ],
                ),
              ),
              Center(
                child: CircleAvatar(
                    radius: 64,
                    backgroundImage: CachedNetworkImageProvider(user.photoUrl)),
              ),
              SizedBox(height: 16),
              Center(child: Text(user.name)),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(user.level.toString(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: LinearProgressIndicator(
                      value: 0.4,
                    ),
                  )),
                  Text((user.level + 1).toString(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16))
                ],
              ),
              Center(
                child: Text('${user.exp} xp',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
              ),
              SizedBox(
                height: 32,
              ),
              PrimaryButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            AchievementsPage(achievements: user.achievements)));
                  },
                  child: Text('Достижения')),
              SizedBox(height: 8),
              PrimaryButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Scaffold()));
                  },
                  child: Text('Пройденные маршруты')),
              SizedBox(height: 8),
              PrimaryButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Scaffold()));
                  },
                  child: Text('Настройки')),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class AchievementsPage extends StatelessWidget {
  final List<Achievement> achievements;
  const AchievementsPage({Key? key, required this.achievements})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Достижения'),
        ),
        body: ListView(
          children:
              achievements.map((e) => AchievementTile(achievement: e)).toList(),
        ));
  }
}

class AchievementTile extends StatelessWidget {
  const AchievementTile({Key? key, required this.achievement})
      : super(key: key);

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ListTile(
        leading: Icon(Icons.event_available_rounded, color: primaryColor),
        title: Text(achievement.name, style: TextStyle(color: primaryColor)),
        subtitle: Text(achievement.description),
        trailing: Column(
          children: [
            Text('${achievement.exp} xp',
                style: TextStyle(color: Color(0xFF6FB736)))
          ],
        ));
  }
}
