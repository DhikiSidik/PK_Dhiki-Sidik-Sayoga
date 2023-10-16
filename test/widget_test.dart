import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas/main.dart';

void main() {
  testWidgets('Page titles', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Halo, Pengguna'), findsOneWidget); // Cek teks "Halo, Pengguna"
    expect(find.text('Yuk transfer kemanapun bebas biaya admin.'), findsOneWidget); // Cek teks "Yuk transfer kemanapun bebas biaya admin."
    expect(find.text('Beranda'), findsOneWidget);
    expect(find.byIcon(Icons.send), findsOneWidget); // Cek ikon pesawat kertas (Telegram-like)
    expect(find.text('Akun'), findsOneWidget);

    // Tap the BottomNavigationBar to switch to the Transaksi page.
    await tester.tap(find.byIcon(Icons.send)); // Menggunakan ikon pesawat kertas (Telegram-like)
    await tester.pump();

    expect(find.text('Beranda'), findsNothing);
    expect(find.text('Yuk transfer kemanapun bebas biaya admin.'), findsNothing); // Pastikan teks hilang
    expect(find.byIcon(Icons.send), findsNothing);
    expect(find.text('Akun'), findsNothing);
    expect(find.text('Transaksi'), findsOneWidget);

    // Tap the BottomNavigationBar to switch to the Akun page.
    await tester.tap(find.byIcon(Icons.account_circle));
    await tester.pump();

    expect(find.text('Beranda'), findsNothing);
    expect(find.byIcon(Icons.account_circle), findsOneWidget);
    expect(find.text('Transaksi'), findsNothing);
    expect(find.text('Akun'), findsOneWidget);
    expect(find.text('Halo, Pengguna'), findsOneWidget); // Cek teks "Halo, Pengguna" kembali
    expect(find.text('Yuk transfer kemanapun bebas biaya admin.'), findsOneWidget); // Cek teks "Yuk transfer kemanapun bebas biaya admin." kembali
  });
}
