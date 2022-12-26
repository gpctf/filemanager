# Polecenia aby uruchomić obraz
## Budowa obrazu
```bash
sudo docker build -t filemanager ./
```
## Uruchomienie obrazu
```bash
sudo docker run -p 3000:3000 -p 1000:1000 filemanager
```
