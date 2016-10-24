cmake_minimum_required(VERSION 3.6 FATAL_ERROR)
project(wallpaper-gif VERSION 0.1)

find_package(ECM 0.0.11 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

find_package(KF5 REQUIRED COMPONENTS Plasma)

plasma_install_package(gif org.kde.gif wallpapers wallpaper)
