    def update_values(self, tableName, numberRow, numberCol, val1, position, row_count=0, flag_combo=0):
        col = 0
        row = 0
        row_check = 1
        print("testout")
        if row == -1:
            pass
        elif flag_combo == 0:
            print("test")
            try:
                if row_check == 1:
                    val1[col] = [float(tableName.item(row, col).text())]
                    DropDownActions.statusMessage(self, message="")
                    print("test")
                else:
                    print("test")
                    val1[row][col] = [float(tableName.item(row, col).text())]
                    DropDownActions.statusMessage(self, message="")
            except ValueError:
                tableName.clearSelection()
                tableName.item(row, col).setText("")
                DropDownActions.statusMessage(self, message="Please enter only numbers!")
        else:
            row_check = tableName.rowCount()
            value_combo = tableName.cellWidget(0, position).currentIndex()
            if row_check == 1:
                print("test")
                val1[position] = [value_combo]
                DropDownActions.statusMessage(self, message="")
            else:
                print("test")
                val1[row_count][position] = [value_combo]
                DropDownActions.statusMessage(self, message="")
                # update_flag = 1
        return val1
