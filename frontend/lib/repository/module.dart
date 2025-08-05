import 'package:frontend/repository/pdf_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  PdfRepository get pdfRepository => PdfRepository(Dio());
}
