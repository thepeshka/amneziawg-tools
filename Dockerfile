FROM --platform=linux/arm64 alpine:3.19 AS build

WORKDIR /app

COPY src /app

RUN apk add linux-headers build-base

RUN make

FROM alpine:3.19

COPY --from=build /app/wg /build/awg
COPY --from=build /app/wg-quick/linux.bash /build/awg-quick

CMD cp -R /build /output