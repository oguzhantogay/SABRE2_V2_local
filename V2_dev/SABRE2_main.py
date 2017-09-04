from PyQt4.QtGui import *
from SABRE2_main_subclass import *
from SABRE2_GUI import *             # replace Form1 the name of your generated file
import sys

# this is the part for user interface runnig
app = QApplication(sys.argv)

window = SABRE2_main_subclass(Ui_SABRE2_V3())
window.show()


sys.exit(app.exec_())
