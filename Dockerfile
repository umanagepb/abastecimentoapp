FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
# Instala dependências do XAF
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgdiplus libc6-dev libicu-dev libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
ENV LC_ALL=pt_BR.UTF-8
ENV LANG=pt_BR.UTF-8
# Não fazemos COPY aqui, pois usaremos Volume
