#include "daemon.h"

Daemon::Daemon(QObject *parent) : QObject(parent)
{
    // Set default values
    setLimit(60);
    setPeriod(5);
}

Daemon::~Daemon()
{

}

void Daemon::Start()
{
    QTimer *timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(update()));
    timer->start(period() * 1000);
}

quint32 Daemon::period() const
{
    return m_period;
}

void Daemon::setPeriod(const quint32 &period)
{
    m_period = period == 0 ? 1 : period;
}

quint16 Daemon::limit() const
{
    return m_limit;
}

void Daemon::setLimit(const quint16 &limit)
{
    m_limit = limit < 3 ? 3 : limit;
}

void Daemon::update()
{
    qDebug() << "Start check";

}



