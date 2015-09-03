#include "daemon.h"

#include <QCoreApplication>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    /*
    * Loading paramters
    */
    QMap<QString, QString> paramters;

    for (QString arg : a.arguments())
    {
        if (arg.indexOf("="))
        {
            QStringList _parametr = arg.split("=");
            if (_parametr.length() == 2)
            {
                paramters.insert(_parametr[0], _parametr[1]);
            }
        }
    }

    Daemon* daemon = new Daemon();
    if (paramters.contains("limit"))
        daemon->setLimit(paramters["limit"].toInt());

    if (paramters.contains("period"))
        daemon->setPeriod(paramters["period"].toInt());

    daemon->Start();

    return a.exec();
}
