from DataTable import DataTable

self.data_table = DataTable(self)
self.consumption_table = self.data_table.insert_row_cb(self.consumption_table, 0)
self.data_table.cb_index_changed_signal.connect(self.cb_index_changed_signal)

def cb_index_changed_signal(self, cb):
    print ("row: "+str(cb.row)+" column: "+str(cb.column)+" text: "+cb.currentText())
