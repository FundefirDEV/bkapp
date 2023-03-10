# BKapp flutter

[![codecov](https://codecov.io/gh/Fundefir-dev/bk_app/branch/master/graph/badge.svg?token=36HA1X385U)](https://codecov.io/gh/Fundefir-dev/bk_app)

![Test, Build master](https://github.com/Fundefir-dev/bk_app/workflows/Test,%20Build%20master/badge.svg)

Production: [![Codemagic build status PROD](https://api.codemagic.io/apps/5f03816ef9cfa6000e6d3b49/5f03816ef9cfa6000e6d3b48/status_badge.svg)](https://codemagic.io/apps/5f03816ef9cfa6000e6d3b49/5f03816ef9cfa6000e6d3b48/latest_build)

QA: [![Codemagic build status QA](https://api.codemagic.io/apps/5f03816ef9cfa6000e6d3b49/5f0647b532c6cf2b4f64a10d/status_badge.svg)](https://codemagic.io/apps/5f03816ef9cfa6000e6d3b49/5f0647b532c6cf2b4f64a10d/latest_build)

Stage: [![Codemagic build Stage](https://api.codemagic.io/apps/5f03816ef9cfa6000e6d3b49/5f064b18d9ccd53cdbc2002a/status_badge.svg)](https://codemagic.io/apps/5f03816ef9cfa6000e6d3b49/5f064b18d9ccd53cdbc2002a/latest_build)

### Cloning

```sh
git clone --recursive git@github.com:FundefirTeam/bk_app.git
```

## Get started

Please install [https://github.com/Fundefir-dev/commons](https://github.com/Fundefir-dev/commons).

With `fd` commands, run `fd_console project` for view the different options and helpers.

## Create a release

In your PR, you can to add a label

`release:patch` this is used by deploy bugs.

`release:patch` this is used by minor versions.

`release:major` this is used by major versions.

### Running coverage

```
fd_console project coverage
```

### Running regressive test

```sh
flutter drive --target=test_driver/app.dart

flutter drive --target=test_driver/app.dart --no-build
flutter drive --target=test_driver/app.dart --no-build --no-track-widget-creation
```

### ThemeData

We use custom color scheme `extension` in the file `custom_color_scheme.dart`.

##### Use

1. Import it into the file

```sh
  import 'package:bkapp_flutter/src/utils/custom_color_scheme.dart';
```

2. Assign to the right property

```sh
color: Theme.of(context).colorScheme.primaryColor
```

Some colors have swatches and the **greater** number the color **darkest**:

- primaryColor: **50, 100 & 200**

```sh
Theme.of(context).colorScheme.primaryColor[50]
```

- primaryColorDark: **50 & 100**

```sh
Theme.of(context).colorScheme.primaryColorDark[100]
```

- grayColor: **50, 100, 200, 300 & 400**

```sh
Theme.of(context).colorScheme.grayColor[200]
```

### Environment vars

If you need to add a new env var, you should be to add in the file `lib/environment_config.dart`

```
flutter run --dart-define=SOME_VAR=SOME_VALUE
```

### Icons and name

```sh
flutter packages pub run flutter_launcher_icons:main # Regenerate icons
flutter pub run flutter_launcher_name:main # Change name of app
```

### e2e

Your AWS user with AWS farm devices permissions, and use `region = us-west-2`

```
pub global activate sylph
sylph config
sylph --devices=all
```

### Regression test

```sh
flutter drive --target=test_driver/app.dart --driver=test_driver/register_test.dart
flutter drive --target=test_driver/app.dart --driver=test_driver/register_buy_shares_test.dart
flutter drive --target=test_driver/app.dart --driver=test_driver/register_buy_shares_credits_test.dart
flutter drive --target=test_driver/app.dart --driver=test_driver/app_test.dart
```
