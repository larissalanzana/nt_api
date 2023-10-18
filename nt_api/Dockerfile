FROM mobiledevops/flutter-sdk-image:2.19.5
WORKDIR /app
COPY pubspec.yaml .
RUN flutter pub get
COPY . .
CMD [ "flutter", "run", "lib/main.dart" ]