FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app

# --- CORREÇÃO DO PROBLEMA ---
# Como o Debian 10 (base do NET 5) é EOL, precisamos apontar para o archive
# e remover verificação de validade estrita para permitir o update
RUN echo "deb http://archive.debian.org/debian buster main" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list \
    && apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get install -y --no-install-recommends \
    libgdiplus libc6-dev libicu-dev libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*
# ----------------------------

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
ENV LC_ALL=pt_BR.UTF-8
ENV LANG=pt_BR.UTF-8

# Não fazemos COPY aqui, pois usaremos Volume

