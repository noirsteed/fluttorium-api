FROM dart:stable AS build

WORKDIR /api
COPY . .
RUN dart pub get
RUN dart compile exe bin/server.dart -o bin/server

FROM scratch

COPY --from=build /runtime/ /
COPY --from=build /api/bin/server /api/bin/

EXPOSE 8080
CMD ["/api/bin/server"]
