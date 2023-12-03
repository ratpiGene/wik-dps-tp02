# TP - 02 : 

Pour accéder au projet :
```
cd .\TP2\
```
## I. Installation
_J'ai choisi de repartir sur la correction du tp1 pour avoir une base propre._

On va pouvoir run le projet Cargo une première fois pour l'initialiser et tester que tout fonctionne avant d'en faire une image :

```
cargo run tp2
```

On va créer une version release du projet, afin d'alléger le conteneur :
```
cargo build --release
```
## II. Image Docker

On va pouvoir maintenant construire notre image avec Docker :
```
docker build -t tp2 -f Dockerfile.dockerfile
```