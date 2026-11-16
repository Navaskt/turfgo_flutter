#!/bin/bash

# Core
mkdir -p lib/core/{error,network,usecase,di,router,theme,utils}
touch lib/app.dart
touch lib/core/error/{failures.dart,exceptions.dart}
touch lib/core/usecase/usecase.dart
touch lib/core/di/injection.dart
touch lib/core/router/app_router.dart

# Features
features=("auth" "turf" "booking")

for f in "${features[@]}"; do
  base="lib/features/$f"
  mkdir -p $base/domain/{entities,repositories,usecases}
  mkdir -p $base/data/{models,datasources,repositories}
  mkdir -p $base/presentation/{bloc,pages,widgets}

#   touch $base/domain/entities/${f}.dart
#   touch $base/domain/repositories/${f}_repository.dart
#   touch $base/data/models/${f}_model.dart
#   touch $base/data/datasources/${f}_remote_datasource.dart
#   touch $base/data/repositories/${f}_repository_impl.dart
#   touch $base/presentation/bloc/${f}_cubit.dart
#   touch $base/presentation/bloc/${f}_state.dart
#   touch $base/presentation/pages/${f}_page.dart
done

echo "TurfGo structure created"