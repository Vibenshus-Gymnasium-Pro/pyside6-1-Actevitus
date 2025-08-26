import os
import sys
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterType
from PySide6.QtCore import QUrl
from backend import Backend

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    # Register our type as module "Calculator" v1.0, type name "Backend"
    qmlRegisterType(Backend, "Calculator", 1, 0, "Backend")

    engine = QQmlApplicationEngine()

    qml_path = os.path.join(os.path.dirname(__file__), "Main.ui.qml")
    engine.load(QUrl.fromLocalFile(qml_path))

    if not engine.rootObjects():
        print(f"Failed to load QML: {qml_path}")
        sys.exit(1)

    sys.exit(app.exec())