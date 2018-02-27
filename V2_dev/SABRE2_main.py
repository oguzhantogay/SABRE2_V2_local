from SABRE2_main_subclass import *
from SABRE2_GUI import *             # replace Form1 the name of your generated file
import sys
import atexit
import os

# this is the part for user interface runnig
app = QApplication(sys.argv)

window = SABRE2_main_subclass(Ui_SABRE2_V3())
window.show()

os.environ["TF_CPP_MIN_LOG_LEVEL"]="3"
atexit.register(lambda : os.remove('process.h5'))

sys.exit(app.exec_())

