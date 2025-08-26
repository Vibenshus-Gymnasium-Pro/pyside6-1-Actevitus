import QtQuick 2.15
import QtQuick.Controls 2.15
import Calculator 1.0

ApplicationWindow {
    visible: true
    width: 500
    height: 550
    title: "Andengradsligningsløser"
    color: "#0d1117"

    Backend { id: backend }

    property alias titelFontfamily: titel.font.family

    Text {
        id: titel
        x: 135
        y: 18
        color: "#ffffff"
        text: "Andengradsligningsløser"
        font.pixelSize: 19
        font.family: "Consolas"
        textFormat: Text.RichText
    }

    Text {
        id: titel1
        x: 122
        y: 46
        color: "#ffffff"
        text: "Lavet af Kalle Bersang Glibstrup"
        font.pixelSize: 15
        textFormat: Text.RichText
        font.family: "Consolas"
    }

    Rectangle {
        id: rectangle
        x: 58
        y: 330
        width: 384
        height: 121
        color: "#151b23"
        border.color: "#a3a3a3"

        Button {
            id: calc_button
            x: 149
            y: 66
            width: 86
            height: 16
            text: qsTr("Beregn")
            font.pointSize: 10
            font.family: "Consolas"
            onClicked: backend.calculate(a_field.text, b_field.text, c_field.text)
        }

        Button {
            id: clear_button
            x: 149
            y: 88
            width: 86
            height: 16
            text: qsTr("Ryd Felter")
            font.pointSize: 10
            font.family: "Consolas"
            onClicked: {
                a_field.text = ""
                b_field.text = ""
                c_field.text = ""
                backend.clear()
            }
        }

        TextField {
            id: b_field
            x: 141
            y: 23
            width: 102
            height: 25
            horizontalAlignment: Text.AlignHCenter
            font.family: "Consolas"
            placeholderText: qsTr("b")
        }

        TextField {
            id: a_field
            x: 8
            y: 23
            width: 102
            height: 25
            horizontalAlignment: Text.AlignHCenter
            font.family: "Consolas"
            font.bold: true
            placeholderText: qsTr("a")
        }

        TextField {
            id: c_field
            x: 274
            y: 23
            width: 102
            height: 25
            horizontalAlignment: Text.AlignHCenter
            font.family: "Consolas"
            placeholderText: qsTr("c")
        }
    }

    Rectangle {
        id: rectangle1
        x: 58
        y: 310
        width: 384
        height: 19
        color: "#4b93da"
        border.color: "#ffffff"
    }

    Text {
        id: titel2
        x: 73
        y: 314
        text: "Indsæt værdierne i inputfelterne herunder for at benytte lommeregneren:"
        font.pixelSize: 10
        font.family: "Consolas"
        color: "#ffffff"
    }

    Image {
        id: cheatsheet
        x: 172
        y: 141
        width: 158
        height: 156
        source: "img/cheatsheet.png"
        fillMode: Image.PreserveAspectFit
    }

    Text {
        id: titel3
        x: 122
        y: 111
        color: "#ffffff"
        text: "Basale andengradsligningsregler"
        font.pixelSize: 15
        font.family: "Consolas"
    }

    Rectangle {
        id: rectangle2
        x: 59
        y: 457
        width: 384
        height: 41
        color: "#151b23"
        border.color: "#a3a3a3"

        TextField {
            id: result_field
            x: 38
            y: 8
            width: 308
            height: 25
            horizontalAlignment: Text.AlignHCenter
            placeholderText: qsTr("Resultat")
            font.family: "Consolas"
            font.bold: true
            readOnly: true
            color: "#000000"   // sort tekst
            text: backend.result
        }
    }

    Rectangle {
        id: rectangle3
        x: 58
        y: 104
        width: 385
        height: 193
        color: "#00ffffff"
        border.color: "#ffffff"
    }
}
