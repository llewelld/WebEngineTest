/* vim: set et ts=4 sts=4 sw=4: */
/* SPDX-License-Identifier: BSD-2-Clause */
/* Copyright © 2024 David Llewellyn-Jones */

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
        domwalk = file.readAll();
        file.close();
    }
    engine.rootContext()->setContextProperty("domwalk", domwalk);

    return app.exec();
}
