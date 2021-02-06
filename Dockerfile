FROM golang:1.15 as build
COPY . /app
RUN cd /app/cmd/csi-attacher && go build -o csi-attacher .

FROM ubuntu:20.04
LABEL maintainers="Joan Marc Carbo Arnau jmcarbo@gmail.com"
LABEL description="CSI External Attacher"

COPY --from=build /app/cmd/csi-attacher/csi-attacher /csi-attacher
ENTRYPOINT ["/csi-attacher"]
