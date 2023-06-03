Future<void> than({
  required Function() make,
  required Function() than,
}) async {
  make();
  await Future.delayed(Duration.zero);
  await than();
}
