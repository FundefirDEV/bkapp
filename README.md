# BKapp flutter

[![codecov](https://codecov.io/gh/Fundefir-dev/bk_app/branch/master/graph/badge.svg?token=36HA1X385U)](https://codecov.io/gh/Fundefir-dev/bk_app)

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

### Running test coverage

```sh
 flutter test --coverage
 genhtml -o coverage coverage/lcov.info
 #Open Coverage
 open coverage/index.html
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
