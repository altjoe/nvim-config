## create ~/.fonts if not exist

mkdir -p ~/.fonts

# if lekton files are already in .fonts, remove them
rm -rf ~/.fonts/Lekton*

unzip _constants/Lekton.zip -d ~/.fonts/


fc-cache -fv
