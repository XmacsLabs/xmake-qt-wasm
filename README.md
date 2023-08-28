# Qt on WASM using xmake
## Install xmake
After the installation of xmake, we need to switch to the latest xmake on dev branch.
```
xmake update -s dev
```

## xmake config
### Config for Qt 5
```
cd ~
python3 -m aqt install-qt linux desktop 5.15.2 wasm_32 --autodesktop
xmake config -p wasm --qt=~/5.15.2/wasm_32/ -vD --yes
```

If `/usr/bin/python` is not available, execute `sudo ln -s /usr/bin/python3 /usr/bin/python` first.

### Config for Qt 6
```
cd ~
python3 -m aqt install-qt linux desktop 6.5.2 wasm_singlethread  -m qtimageformats --autodesktop
QT6=true xmake config -p wasm --qt=~/6.5.2/wasm_singlethread/ -vD --yes
```

## xmake build
```
xmake build
```
## view in browser
```
python3 -m http.server -d build/wasm/wasm32/release/
```

