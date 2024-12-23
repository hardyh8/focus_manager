enum AppRoute {
  dashboard('/dashboard', 'dashboard'),
  timer('/timer', 'timer'),
  calendar('/calendar', 'calendar'),
  eventDetails('/eventDetails', 'eventDetails'),

  ;

  const AppRoute(this.path, this.name);

  final String path;
  final String name;
}
