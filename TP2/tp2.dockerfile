# Build : docker build -t tp2 -f Dockerfile.dockerfile .
# Run : docker run tp2
FROM rust:latest as builder

# Créer le répertoire /app/tp2 et définir les permissions
RUN mkdir -p /app/tp2 && \
    adduser --no-create-home --disabled-login --group --system www && \
    chown -R www /app

# Définir le répertoire de travail
WORKDIR /app/tp2

# Copier les fichiers source dans le conteneur
COPY . .

# Construire l'application Rust en mode "release"
RUN cargo build --release

# Supprimer les fichiers source non nécessaires après la compilation
RUN rm -f src/*.rs

# Définir l'utilisateur www comme utilisateur par défaut pour le conteneur
USER www

# Commande par défaut pour exécuter l'application
CMD ["./target/release/tp2"]
