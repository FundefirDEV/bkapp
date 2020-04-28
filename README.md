# bkapp_flutter

## Cloning

```sh
git clone --recursive git@github.com:Fundefir-dev/bk_app.git
```

## Update submodules

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

## Running test coverage

```sh
 flutter test --coverage
 genhtml -o coverage coverage/lcov.info
```

## Running regressive test

```sh
flutter drive --target=test_driver/app.dart

flutter drive --target=test_driver/app.dart --no-build
flutter drive --target=test_driver/app.dart --no-build --no-track-widget-creation
```
