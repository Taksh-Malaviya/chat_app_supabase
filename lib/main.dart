import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://mvkoevvgdhtjgcujjldf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im12a29ldnZnZGh0amdjdWpqbGRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA1MDQzOTEsImV4cCI6MjA2NjA4MDM5MX0.xwMNRw66DCwK75buHwqpj9SpAXrA3ndlr-tP3iOHyo8',
  );

  runApp(const MyApp());
}
