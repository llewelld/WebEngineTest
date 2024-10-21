#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebEngineQuick/QtWebEngineQuick>

int main(int argc, char *argv[])
{
    QtWebEngineQuick::initialize();

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("WebEngineTest", "Main");

    QString domwalk;
    QFile file(":/js/DomWalk.js");
    if (file.open(QIODevice::ReadOnly)) {
        QTextStream in(&file);
        domwalk = file.readAll();
        file.close();
    }
    engine.rootContext()->setContextProperty("domwalk", domwalk);

    return app.exec();
}
