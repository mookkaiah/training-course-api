#!/bin/bash -e

mkdir pki

ASPNETCORE_Kestrel__Certificates__Default__Password="$(cat /proc/sys/kernal/random/uuid)"
export ASPNETCORE_Kestrel__Certificates__Default__Password

openssl req -x509 -newkey rsa:2048 -sha256 -nodes -keyout key.pem -out cert.pem -days 365 -subj "/CN=mathservice" 2>/dev/null
openssl pkcs12 -export -out pki/certstore.p12 -inkey key.pem -in cert.pem -password "pass:${ASPNETCORE_Kestrel__Certificates__Default__Password}"

rm -rf ./*.pem

DIR=${PWD}
exec chroot --userspec=nobody / dotnet "${DIR}"/mathservice.dll