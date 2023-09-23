# Qt on WASM using xmake

## Install xmake
After the installation of xmake, we need to switch to the latest xmake on dev branch.
```
xmake update -s dev
```

If that does not work, you can try 

```bash
sudo xmake update --root -s dev
```

## xmake config
### Config for Qt 5
```
cd path/to/this/repo
python3 -m aqt install-qt linux desktop 5.15.2 wasm_32 --autodesktop

# cd path/to/this/repo
xmake config -p wasm --qt=./5.15.2/wasm_32/ -vD --yes
```

If `/usr/bin/python` is not available, execute `sudo ln -s /usr/bin/python3 /usr/bin/python` first.

### Config for Qt 6
```
cd ~
python3 -m aqt install-qt linux desktop 6.5.2 wasm_singlethread  -m qtimageformats --autodesktop

# cd path/to/this/repo
QT6=true xmake config -p wasm --qt=~/6.5.2/wasm_singlethread/ -vD --yes
```

## xmake build
```
QT6=true xmake build
```
## view in browser
```
python3 -m http.server -d build/wasm/wasm32/release/
```

## Arch Linux
```
yay -S xmake emscripten python-aqtinstall
sudo xmake update --root -s dev 
python3 -m aqt install-qt linux desktop 5.15.2 wasm_32 --autodesktop
xmake config -p wasm --qt=~/5.15.2/wasm_32/ -vD --yes
xmake build
python3 -m http.server -d build/wasm/wasm32/release/
```
If you cannot install aqt via `yay -S python-aqtinstall`, you can install it manually by pip.
