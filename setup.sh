## create ~/.fonts if not exist

mkdir -p ~/.fonts

# if lekton files are already in .fonts, remove them
rm -rf ~/.fonts/Lekton*

unzip _constants/Lekton.zip -d ~/.fonts/

sudo apt install luarocks
sudo apt install lua5.4
sudo apt-get install clang

fc-cache -fv
