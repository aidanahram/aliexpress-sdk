<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Aliexpress SDK written in dart. Used to call Aliexpress APIs. Build in signed hash features and different methods (POST, GET) to call API. Based on the aliexpress python sdk.

## Features

Calls Aliexpress APIs in dart package. Generates hashes for request authentication.

## Usage

Start by importing the library
```dart
import 'package:requests/requests.dart';
```

```dart
final request = IopRequest('/auth/token/create');
request.addParam("code", "3_508156_0B6q8xRJgGk4iSTVqmhSSaKC566");
request.addParam('uuid', 'uuid');
final response = await client.execute(request);
```

## Additional information

Examples are found in the ```/example``` folder
