import * as cdk from '@aws-cdk/core';
import * as lambda from '@aws-cdk/aws-lambda';
import * as apigateway from '@aws-cdk/aws-apigateway';
import * as path from 'path';

export class CdkCartServiceStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const nestJsLambda = new lambda.Function(this, 'NestJsLambda', {
      runtime: lambda.Runtime.NODEJS_16_X,
      handler: 'src/lambda.handler',
      code: lambda.Code.fromAsset(path.join(__dirname, '../../dist')),
    });


    new apigateway.LambdaRestApi(this, 'CartServiceApi', {
      handler: nestJsLambda,
    });
  }
}
