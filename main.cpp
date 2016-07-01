#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtPlugin>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    qputenv("QT_QUICK_CONTROLS_STYLE", "Flat");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
