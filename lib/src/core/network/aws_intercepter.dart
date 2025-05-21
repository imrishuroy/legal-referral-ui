import 'package:aws_common/aws_common.dart';
import 'package:aws_signature_v4/aws_signature_v4.dart';
import 'package:dio/dio.dart';

class AWSSigV4Interceptor extends Interceptor {
  AWSSigV4Interceptor({
    required this.awsSigner,
    required this.region,
    required this.serviceName,
  });
  final AWSSigV4Signer awsSigner;
  final String region;
  final String serviceName;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final request = AWSHttpRequest(
      method: AWSHttpMethod.values.byName(options.method.toLowerCase()),
      uri: options.uri,
      headers: options.headers.cast<String, String>(),
      body: options.data,
    );

    const region = '<YOUR-REGION>';
    final scope = AWSCredentialScope(
      region: region,
      service: AWSService.cognitoIdentityProvider,
    );

    final signedRequest = await awsSigner.sign(
      request,
      credentialScope: scope,
    );

    // Add signed headers to the request
    options.headers.addAll(signedRequest.headers);
    handler.next(options);
  }
}
