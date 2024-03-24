## Legal Referral UI

## APP SIGNING
keytool -genkey -v -keystore ~/legal-referral-dev.jks -keyalg RSA -keysize 2048 -validity 10000 -alias androiddevkey
/gradlew signingReport

## Merge a local branch with a remote branch
    git merge origin/aRemoteBranch
    
## Generate Code
    dart run build_runner build --delete-conflicting-outputs