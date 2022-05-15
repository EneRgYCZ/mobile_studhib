import 'package:studhub/chat/chat.dart';
import 'package:studhub/home/home.dart';
import 'package:studhub/posts/posts.dart';
import 'package:studhub/login/login.dart';
import 'package:studhub/search/search.dart';
import 'package:studhub/profile/profile.dart';
import 'package:studhub/posts/post_create.dart';
import 'package:studhub/notifications/notifications.dart';
import 'package:studhub/tipsandtricks/tipsandtricks.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/chat': (context) => const ChatScreen(),
  '/login': (context) => const LoginScreen(),
  '/posts': (context) => const PostsScreen(),
  '/tips': (context) => const TipsAndTricks(),
  '/search': (context) => const SearchScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/post_create': (context) => const PostCreateScreen(),
  '/notifications': (context) => const NotificationsScreen(),
};
