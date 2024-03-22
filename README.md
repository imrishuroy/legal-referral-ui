## Legal Referral UI

## APP SIGNING
keytool -genkey -v -keystore ~/legal-referral-dev.jks -keyalg RSA -keysize 2048 -validity 10000 -alias androiddevkey
/gradlew signingReport