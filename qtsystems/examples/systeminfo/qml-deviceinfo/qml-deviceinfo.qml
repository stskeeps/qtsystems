/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QtSystems module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import QtSystemInfo 5.0
import QtQuick.Window 2.0

Rectangle {
    width: 320; height: 480

    Flickable {
        id: flickable
        anchors.margins: 10
        anchors.leftMargin: 20
        anchors.fill: parent
        contentWidth: column.width; contentHeight: column.height
        Column {
            id: column
            spacing: 10
            Text {
                text: "Device Info:"
                x: -10
                font.bold: true
            }
            Text {
                text: "Manufacturer: " + devinfo.manufacturer()
            }
            Text {
                text: "Product name: " + devinfo.productName()
            }
            Text {
                text: "Model: " + devinfo.model()
            }
            Text {
                text: "Unique device ID: " + devinfo.uniqueDeviceID()
            }
            Text {
                text: "OS version: " + devinfo.version(DeviceInfo.Os)
            }
            Text {
                text: "Firmware version: " + devinfo.version(DeviceInfo.Firmware)
            }
            Text {
                text: "IMEI :" + devinfo.imei(0)
            }
            Text {
                text: "Thermal state: " + devinfo.thermalState
            }
            Text {
                text: "Screen Info:"
                x: -10
                font.bold: true
            }
            Text {
                text: "backlight state: " + displayInfo.backlightState(0);
            }
            Text {
                text: "brightness: " + displayInfo.brightness(0);
            }
            Text {
                text: "contrast: " + displayInfo.contrast(0);
            }
            Text {
                text: "colorDepth: " + displayInfo.colorDepth(0);
            }
            Text {
                text: "pitch: " + displayInfo.dpiX(0) + " x " + displayInfo.dpiY(0) + " DPI; " +
                      parseFloat(25.4 / displayInfo.dpiX(0)).toFixed(4) + " x " + parseFloat(25.4 / displayInfo.dpiY(0)).toFixed(4) + "mm"
            }
            Text {
                text: "physical size: " + displayInfo.physicalWidth(0) + " x " + displayInfo.physicalHeight(0);
            }
            Text {
                text: "resolution: " + Screen.width + " x " + Screen.height;
            }
            Text {
                text: "orientation: " + Screen.orientation + " primary " + Screen.primaryOrientation;
            }
        }
    }
    Rectangle {
        id: scrollDecoratorV
        color: "grey"
        opacity: 0.5
        width: 5
        radius: width / 2
        smooth: true
        property real ratio: flickable.height / column.height
        height: flickable.height * ratio
        y: flickable.anchors.topMargin + flickable.contentY * ratio
        anchors.right: parent.right
        anchors.margins: 2
        visible: flickable.height < column.height
    }
    Rectangle {
        id: scrollDecoratorH
        color: "grey"
        opacity: 0.5
        height: 5
        radius: height / 2
        smooth: true
        property real ratio: flickable.width / column.width
        width: flickable.width * ratio
        x: flickable.anchors.topMargin + flickable.contentX * ratio
        anchors.bottom: parent.bottom
        anchors.margins: 2
        visible: flickable.width < column.width
    }

    DeviceInfo {
        id: devinfo;
    }

    DisplayInfo {
        id: displayInfo
    }
}
