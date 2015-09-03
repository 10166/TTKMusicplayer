#include "musiclrcsearchwidget.h"
#include "ui_musiclrcsearchwidget.h"
#include "musicuiobject.h"
#include "musiclrcsearchtablewidget.h"
#include "musicbgthememanager.h"

MusicLrcSearchWidget::MusicLrcSearchWidget(QWidget *parent)
    : MusicMoveDialogAbstract(parent),
      ui(new Ui::MusicLrcSearchWidget)
{
    ui->setupUi(this);
    drawWindowRoundedRect(this);
    //set window radius
    ui->topTitleCloseButton->setIcon(QIcon(":/share/searchclosed"));
    ui->topTitleCloseButton->setStyleSheet(MusicUIObject::MToolButtonStyle01);
    ui->topTitleCloseButton->setCursor(QCursor(Qt::PointingHandCursor));
    ui->topTitleCloseButton->setToolTip(tr("Close"));

    ui->songSearchEdit->setStyleSheet(MusicUIObject::MLineEditStyle02);
    ui->lrcSearchButton->setStyleSheet(MusicUIObject::MPushButtonStyle01);
    ui->lrcSearchDownload->setStyleSheet(MusicUIObject::MPushButtonStyle01);
    ui->closeButton->setStyleSheet(MusicUIObject::MPushButtonStyle01);

    ui->lrcSearchButton->setCursor(QCursor(Qt::PointingHandCursor));
    ui->lrcSearchDownload->setCursor(QCursor(Qt::PointingHandCursor));
    ui->closeButton->setCursor(QCursor(Qt::PointingHandCursor));

    connect(ui->lrcSearchButton, SIGNAL(clicked()), SLOT(lrcSearchButtonClicked()));
    connect(ui->lrcSearchDownload, SIGNAL(clicked()), SLOT(lrcSearchDownloadClicked()));
    connect(ui->topTitleCloseButton, SIGNAL(clicked()), SLOT(close()));
    connect(ui->closeButton, SIGNAL(clicked()), SLOT(close()));
    connect(ui->label_checkBox, SIGNAL(clicked(bool)), SLOT(lrcCurrentSelectAll(bool)));
    connect(ui->tableWidget, SIGNAL(lrcDownloadStateChanged(QString)),
                             SLOT(lrcDownloadStateChanged(QString)));
}

MusicLrcSearchWidget::~MusicLrcSearchWidget()
{
    delete ui;
}

void MusicLrcSearchWidget::setCurrentSongName(const QString &name) const
{
    ui->songSearchEdit->setText(name);
    ui->tableWidget->setCurrentSongName(name);
    lrcSearchButtonClicked();
}

void MusicLrcSearchWidget::lrcSearchButtonClicked() const
{
    ui->stateLabel->setText(tr("lrc is searching now!"));
    QString text = ui->songSearchEdit->text().trimmed();
    ui->tableWidget->startSearchQuery( text );
    ui->functionTopLabel->setText(tr(" find <font color=red> %1 </font> result").arg(text));
}

void MusicLrcSearchWidget::lrcSearchDownloadClicked()
{
    ui->stateLabel->setText(tr("lrc is downloading now!"));
    int row = ui->tableWidget->currentRow();
    if(row >= 0)
    {
        ui->tableWidget->musicDownloadLocal(row);
    }
}

void MusicLrcSearchWidget::lrcDownloadStateChanged(const QString &string)
{
    if(string == "Lrc")
    {
       ui->stateLabel->setText(tr("lrc download finished!"));
    }
}

void MusicLrcSearchWidget::lrcCurrentSelectAll(bool all)
{
    Q_UNUSED(all);
}

int MusicLrcSearchWidget::exec()
{
    QPixmap pix(M_BG_MANAGER.getMBackground());
    ui->background->setPixmap(pix.scaled( size() ));
    return MusicMoveDialogAbstract::exec();
}
