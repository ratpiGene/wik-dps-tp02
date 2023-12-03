# TP - 02 : 

Pour accéder au projet :
```bash
cd .\TP2\
```
## I. Installation
_J'ai choisi de repartir sur la correction du tp1 pour avoir une base propre._

On va pouvoir run le projet Cargo une première fois pour l'initialiser et tester que tout fonctionne avant d'en faire une image :

```bash
cargo run tp2
```

On va créer une version release du projet, afin d'alléger le conteneur :
```bash
cargo build --release
```
## II. Image Docker

On va pouvoir maintenant construire notre image avec Docker :
```bash
docker build -t tp2 -f tp2.dockerfile
```

Ensuite on va pouvoir run le conteneur :
```bash
docker run tp2
```