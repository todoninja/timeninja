import 'package:flutter_test/flutter_test.dart';
import 'package:timeninja/app/app.dart';
import 'package:timeninja/entry_scaffold/view/entry_scaffold.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(EntryScaffold), findsOneWidget);
    });
  });
}
