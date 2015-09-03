#ifndef DAEMON_H
#define DAEMON_H

#include <QObject>
#include <QTimer>
#include <QDebug>

class Daemon : public QObject
{
    Q_OBJECT
public:
    explicit Daemon(QObject *parent = 0);
    ~Daemon();
    void Start();

    quint32 period() const;
    void setPeriod(const quint32 &period);

    quint16 limit() const;
    void setLimit(const quint16 &limit);

private:
    //Config varibales
    quint32 m_period; // period in seconds
    quint16 m_limit; // Connections limit

signals:

public slots:
    void update();
};

#endif // DAEMON_H
