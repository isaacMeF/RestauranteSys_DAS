# RestauranteSys_DAS
Repositorio para trabajar en el proyecto de DAS antes del 18 de dic (Fecha de entrega)


# METODOLOGIA:

1.- Toda modificacion no aprobada por el equipo no se tendra que poner en el main, si todo es funcional
    se hara un git merge a la rama main

2.- todo se tiene que trabajar en la rama preview
    Para cambiar a la rama usar: git checkout preview

3.- Antes de realizar un cambio, verificar en github si se ha modificado algo de la carpeta

4.- Siempre antes de trabajar usar el comando: ** git pull origin main && git pull origin preview **

5.- De preferencia si hacen algun cambio tambien manifestarlo en el canal de discord destinado

6.- El admin se encarga de fusionar el preview con el main

7.- Comentar todos los cambios de manera explicita, sin excepciones

## Metodologia de comandos
1.- git pull origin main && git pull origin preview

2.- git add .

3.- git commit -m "comentario del commit"

4.- git pull origin main && git pull origin preview

5.- git push origin preview

6.- git pull origin main && git pull origin preview

# RECUERDEN QUE EL PULL ANTES DE CUALQUIER OPERACION ES MUY IMPORTANTE

# Dependencias del proyecto

"@babel/cli": "^7.12.8",
    "@babel/core": "^7.12.9",
    "@babel/node": "^7.12.6",
    "@babel/preset-env": "^7.12.7",
    "connect-history-api-fallback": "^1.6.0",
    "cors": "^2.8.5",
    "express": "^4.17.1",
    "morgan": "^1.10.0",
    "mysql": "^2.18.1",
    "nodemon": "^2.0.6"