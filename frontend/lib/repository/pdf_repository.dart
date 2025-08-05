import 'dart:io';

import 'package:dio/dio.dart';
import 'package:frontend/repository/models/json_operation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'pdf_repository.g.dart';

const pdfPart = Part(name: "file", contentType: "application/pdf");

@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class PdfRepository {
  @factoryMethod
  factory PdfRepository(Dio dio, {String? baseUrl}) = _PdfRepository;

  /// Split a PDF file into multiple files, returning a zip file containing all parts.
  @POST('/pdf/split')
  @MultiPart()
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> split(@pdfPart File file);
}

extension PdfRepositoryExt on PdfRepository {
  /// Available operations for PDF files (hardcoded).
  List<JsonOperation> get operations => [
    JsonOperation(
      name: 'Merge',
      code: JsonOperationCode.merge,
      description: 'Merge multiple PDF files into one.',
    ),
    JsonOperation(
      name: 'Split',
      code: JsonOperationCode.split,
      description: 'Split a PDF into multiple files.',
    ),
  ];
}
