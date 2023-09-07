add_rules("mode.debug", "mode.release")

if is_plat("wasm") then
    if os.getenv("QT6") then
        add_requires("emscripten 3.1.25")
    else
        add_requires("emscripten 1.39.8")
    end
    set_toolchains("emcc@emscripten")
end

target("app")
    if is_plat("wasm") then
        add_rules("qt.widgetapp_static")
    else
        add_rules("qt.widgetapp")
    end
    if os.getenv("QT6") then
        add_frameworks("QtGui", "QtCore", "QtWidgets", "QWasmIntegrationPlugin")
    else
        add_frameworks("QtGui", "QtCore", "QtWidgets")
    end
    add_files("src/*.cpp")
