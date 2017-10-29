Import SABRE2_main_subclass

def update_joints_table(self, tableName):
    Joint_values = JointTable.tableValues(self, tableName)

    # print("main screen Joint values", Joint_values)
    return Joint_values


# Members tab, Member definition functions
def update_members_table(self, tableName, position):
    Members_values = DataCollection.update_table_values(self, tableName, position)
    print("main screen", Members_values)
    return Members_values


def AISC_update_fun(self, ui_layout, tableName):
    flag = LineChanges.sql_print(self, ui_layout, tableName)
    return flag


def update_members_copyfrom(self, lineName, position, tableName):
    copyfrom_value = DataCollection.update_lineedit_values(self, lineName)
    copyfrom_value = copyfrom_value - 1
    r = tableName.rowCount()
    try:
        if copyfrom_value <= r - 1:
            tableName.selectRow(copyfrom_value)
            DropDownActions.statusMessage(self, message="")
    except TypeError:
        DropDownActions.statusMessage(self, message="Row not defined")
    return copyfrom_value


def update_members_insertafter(self, lineName, position, tableName):
    r = tableName.rowCount()
    try:
        insertafter_values = DataCollection.update_lineedit_values(self, lineName)
        insertafter_values = insertafter_values - 1

        if insertafter_values <= r - 1:
            tableName.selectRow(insertafter_values)
            DropDownActions.statusMessage(self, message="")
        else:
            lineName.setText("")

    except TypeError:
        DropDownActions.statusMessage(self, message="Row not defined")
    return insertafter_values


# Table Values Update

def update_member_properties_table(self, tableName):
    prop_values = JointTable.tableValues(self, tableName)
    print("main screen Properties Table values", prop_values)
    return prop_values


def update_shear_panel_table(self, tableName, flag="not combo"):
    shear_values = Boundary_Conditions.shear_panel_values(self, tableName, flag)
    print("main screen Shear Table Values", shear_values)
    return shear_values


def update_ground_table(self, tableName, flag="not combo"):
    shear_values = Boundary_Conditions.ground_spring_values(self, tableName, flag)
    print("main screen Ground Table Values", shear_values)
    return shear_values


def update_torsional_release(self, tableName):
    torsional_values = Boundary_Conditions.release_tables_values(self, tableName)
    print("main screen Torsional Table Values", torsional_values)
    return torsional_values


def update_My_release(self, tableName):
    My_values = Boundary_Conditions.release_tables_values(self, tableName)
    print("main screen My Table Values", My_values)
    return My_values


def update_Mz_release(self, tableName):
    Mz_values = Boundary_Conditions.release_tables_values(self, tableName)
    print("main screen Mz Table Values", Mz_values)
    return Mz_values


def update_warping_release(self, tableName):
    warping_values = Boundary_Conditions.release_tables_values(self, tableName)
    print("main screen Warping Table Values", warping_values)
    return warping_values


def update_loading_types_conditions(self, tableName):
    [table_data, ID_data] = LoadingClass.defined_load_names(self, tableName)
    print("main screen load type IDs", ID_data)
    return ID_data


def update_uniform_data(self, tableName, combo_flag):
    [uniform_data_vals, SegmentNames] = uniform_load_def.uniform_data_table(self, tableName, combo_flag)
    print("main screen uniform load values", uniform_data_vals)
    return uniform_data_vals


def update_point_data(self, tableName, combo_flag):
    point_data_vals = point_load_def.point_data_table(self, tableName, combo_flag)
    print("main screen uniform load values", point_data_vals)
    return point_load_def