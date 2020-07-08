# BKapp flutter

[![codecov](https://codecov.io/gh/Fundefir-dev/bk_app/branch/master/graph/badge.svg?token=36HA1X385U)](https://codecov.io/gh/Fundefir-dev/bk_app)

![Test, Build master](https://github.com/Fundefir-dev/bk_app/workflows/Test,%20Build%20master/badge.svg)
[![Codemagic build status](https://api.codemagic.io/apps/5f03816ef9cfa6000e6d3b49/5f03816ef9cfa6000e6d3b48/status_badge.svg)](https://codemagic.io/apps/5f03816ef9cfa6000e6d3b49/5f03816ef9cfa6000e6d3b48/latest_build)

### Cloning

```sh
git clone --recursive git@github.com:Fundefir-dev/bk_app.git
```

### Update submodules

```sh
git submodule init # Only When the clone is not recursive
cd bk_packages/bk_core
git checkout master
git pull
cd ../..
git commit -am "Pulled down update to submodule_dir"

# Or, if you're a busy person:
git submodule foreach git pull origin master
```

## Get started

Please install [https://github.com/Fundefir-dev/commons](https://github.com/Fundefir-dev/commons).

With `fd` commands, run `fd_console project` for view the different options and helpers.

## Create a release

In your PR, you can to add a label

`release:patch`  this is used by deploy bugs.

`release:patch`  this is used by minor versions.

`release:major`  this is used by major versions.

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
