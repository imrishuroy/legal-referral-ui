## Legal Referral UI

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=imrishuroy_legal-referral-ui&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=imrishuroy_legal-referral-ui)

## APP SIGNING
keytool -genkey -v -keystore ~/legal-referral-dev.jks -keyalg RSA -keysize 2048 -validity 10000 -alias androiddevkey
/gradlew signingReport

## Merge a local branch with a remote branch
    git merge origin/aRemoteBranch
    
## Abort a rebase    
    git rebase --abort

## Reset a commit
    git reset --hard HEAD@{1}   

## Generate Code
    dart run build_runner build --delete-conflicting-outputs

## Build APK
    flutter build apk --release --no-tree-shake-icons

## Web HTML Render
    flutter run -d chrome --web-renderer html

## Build Runner Clean
dart run build_runner clean


