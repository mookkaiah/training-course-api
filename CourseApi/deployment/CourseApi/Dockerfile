FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
LABEL maintainer = "velumookkaiah@gmail.com"

WORKDIR /opt/mathservice
COPY . .

RUN chmod +x entrypoint.sh \
    && \
    rm -f   /usr/share/doc/pygpgme-0.3/tests/keys/key1.sec \
            /usr/share/doc/pygpgme-0.3/tests/keys/key2.sec \
            /usr/share/doc/pygpgme-0.3/tests/keys/signonly.sec \
    && \
    mv *CA.crt /etc/pki/ca-trust/source/anchors/ && \
    update-ca-trust

ENTRYPOINT ["./entrypoint.sh"]