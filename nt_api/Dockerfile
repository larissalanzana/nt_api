FROM mobiledevops/flutter-sdk-image
WORKDIR /app
COPY pubspec.yaml .
RUN flutter pub get
COPY . .
CMD [ "flutter", "run", "lib/main.dart" ]