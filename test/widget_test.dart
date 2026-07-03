import 'package:flutter_test/flutter_test.dart';
import 'package:onest_all_router_app/main.dart';

void main() {
  testWidgets('Connect router screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title text exists (using a substring search).
    expect(find.textContaining('Is your router connected'), findsOneWidget);

    // Verify that the button text 'Yes, Connected' exists.
    expect(find.text('Yes, Connected'), findsOneWidget);

    // Verify that the button text 'Need Help?' exists.
    expect(find.text('Need Help?'), findsOneWidget);
  });
}
