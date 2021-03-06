//
// Copyright (C) 2017 James Turner  zakalawe@mac.com
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License as
// published by the Free Software Foundation; either version 2 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

#ifndef FGCANVASPAINTCONTEXT_H
#define FGCANVASPAINTCONTEXT_H

#include <QPainter>

class FGCanvasPaintContext
{
public:
    FGCanvasPaintContext(QPainter* painter);

    QPainter* painter() const
    { return _painter; }

    QTransform globalCoordinateTransform() const
    {
        return _globalCoordsTransform;
    }

private:
    QPainter* _painter;
    QTransform _globalCoordsTransform;
};

#endif // FGCANVASPAINTCONTEXT_H
