add_rules("mode.debug", "mode.release")

if is_plat("mingw") and is_host("windows") then
    add_requires("mingw-w64 8.1.0")
    set_toolchains("mingw@mingw-w64")
    add_requires("qt5widgets 5.15.2")
end

if is_plat("wasm") then
    add_requires("emscripten 1.39.8")
    set_toolchains("emcc@emscripten")
end

target("app")
    if is_plat("wasm") then
        add_rules("qt.widgetapp_static")
    else
        add_rules("qt.widgetapp")
    end
    add_frameworks("QtGui", "QtCore")
    add_files("src/*.cpp")
