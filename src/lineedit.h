/****************************************************************************
**
** Copyright (c) 2007 Trolltech ASA <info@trolltech.com>
**
** Use, modification and distribution is allowed without limitation,
** warranty, liability or support of any kind.
**
****************************************************************************/

#ifndef LINEEDIT_H
#define LINEEDIT_H

#include <QLineEdit>

class QToolButton;

class LineEdit : public QLineEdit
{
	Q_OBJECT

public:
	LineEdit(QWidget *parent = 0);
	virtual QSize sizeHint() const;

protected:
	void resizeEvent(QResizeEvent *event);

private slots:
	void updateClearButton(const QString &text);

private:
	QToolButton *m_clearButton;
};

#endif // LINEEDIT_H