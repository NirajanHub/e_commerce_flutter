part of 'routes_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginPageRoute.page),
        AutoRoute(page: VideosRoute.page),
        AutoRoute(page: HomeRoute.page, path: "/"),
      ];
}
