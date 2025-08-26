from PySide6.QtCore import QObject, Property, Signal, Slot
import math

class Backend(QObject):
    resultChanged = Signal()

    def __init__(self, parent=None):
        super().__init__(parent)
        self._result = "Resultat"

    def getResult(self):
        return self._result

    def setResult(self, value):
        if value != self._result:
            self._result = value
            self.resultChanged.emit()

    result = Property(str, fget=getResult, fset=setResult, notify=resultChanged)

    #Hjælpefunktion til at lave float af tekstfelt
    def _to_float(self, s):
        try:
            return float(s.replace(",", "."))
        except Exception:
            return None

    @Slot(str, str, str)
    def calculate(self, a_str, b_str, c_str):
        a = self._to_float(a_str)
        b = self._to_float(b_str)
        c = self._to_float(c_str)

        if a is None or b is None or c is None:
            self.result = "Indtast venligst gyldige tal i felterne."
            return

        if a == 0:
            self.result = "a må ikke være 0 (ellers er det ikke en andengradsligning)."
            return

        #Diskriminant
        d = b**2 - 4*a*c

        if d > 0:
            x1 = (-b + math.sqrt(d)) / (2*a)
            x2 = (-b - math.sqrt(d)) / (2*a)
            self.result = f"To reelle løsninger:\n x₁ = {x1}\n x₂ = {x2}"
        elif d == 0:
            x = -b / (2*a)
            self.result = f"En dobbeltrod:\n x = {x}"
        else:
            self.result = "Ingen reelle løsninger (Δ < 0)."

    @Slot()
    def clear(self):
        self.result = "Resultat"