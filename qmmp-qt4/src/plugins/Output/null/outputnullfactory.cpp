/***************************************************************************
 *   Copyright (C) 2010-2012 by Ilya Kotov                                 *
 *   forkotov02@hotmail.ru                                                 *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.         *
 ***************************************************************************/

#include <QtGui>
#include <qmmp/qmmp.h>
#include "outputnull.h"
#include "outputnullfactory.h"


const OutputProperties OutputNullFactory::properties() const
{
    OutputProperties properties;
    properties.name = tr("Null Plugin");
    properties.hasAbout = true;
    properties.hasSettings = false;
    properties.shortName = "null";
    return properties;
}

Output* OutputNullFactory::create()
{
    return new OutputNull();
}

Volume *OutputNullFactory::createVolume()
{
    return 0;
}

void OutputNullFactory::showSettings(QWidget* parent)
{
   Q_UNUSED(parent);
}


Q_EXPORT_PLUGIN2(null, OutputNullFactory)
