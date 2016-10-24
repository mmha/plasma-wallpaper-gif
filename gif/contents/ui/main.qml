import QtQuick 2.7
import org.kde.plasma.core 2.0 as Plasmacore

AnimatedImage {
   smooth: wallpaper.configuration.Smooth
   fillMode: wallpaper.configuration.FillMode
   source: wallpaper.configuration.Image
}