/*
  metaobjectbrowser.h

  This file is part of GammaRay, the Qt application inspection and
  manipulation tool.

  Copyright (C) 2010-2012 Klarälvdalens Datakonsult AB, a KDAB Group company, info@kdab.com
  Author: Kevin Funk <kevin.funk@kdab.com>

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef GAMMARAY_METAOBJECTBROWSER_METATYPEBROWSER_H
#define GAMMARAY_METAOBJECTBROWSER_METATYPEBROWSER_H

#include "include/toolfactory.h"

#include <QWidget>

class QModelIndex;

namespace GammaRay {

class PropertyWidget;

class MetaObjectBrowser : public QWidget
{
  Q_OBJECT

  public:
    explicit MetaObjectBrowser(ProbeInterface *probe, QWidget *parent = 0);

  private Q_SLOTS:
    void objectSelected(const QModelIndex& index);

  private:
     PropertyWidget* m_propertyWidget;
};

class MetaObjectBrowserFactory : public QObject,
    public StandardToolFactory<QObject, MetaObjectBrowser>
{
  Q_OBJECT
  Q_INTERFACES(GammaRay::ToolFactory)

  public:
    explicit MetaObjectBrowserFactory(QObject *parent) : QObject(parent)
    {
    }

    inline QString name() const
    {
      return tr("Meta Objects");
    }
};

}

#endif // GAMMARAY_METAOBJECTBROWSER_METATYPEBROWSER_H
