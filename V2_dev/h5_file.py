import h5py
import numpy as np

class h5_Class:
    """ This class is for saving the temporary arrays to the h5 files."""

    def generate_file(self, file_name = 'process.h5'):
        """ This function is to generate the h5 file at the beginning or any requested file"""
        file_open = h5py.File(file_name, 'w')

        check_array = np.zeros((1,1)) # to check whether all member cross-section props are defined.

        fixities_vals = np.zeros((1,12))

        added_node_information = np.zeros((1,2))

        added_node_information[0][0] = 1

        element_member = np.zeros((1,1))

        BNodevalue = np.zeros((1,1,1))

        SNodevalue = np.zeros((1,1,1))

        Massemble = np.zeros((1,1,1))

        table_prop =  np.zeros((1,14))

        fixities_vals =  np.zeros((1,1))

        shear_panel_values =  np.zeros((1,1))

        spring_values =  np.zeros((1,1))

        DUP1 = np.zeros((1,1,1))

        DUP2 = np.zeros((1,1,1))

        RNCc = np.zeros((1,1,1))

        PNC = np.zeros((1,1,1))

        PNC1 = np.zeros((1,1,1))

        PNC2 = np.zeros((1,1,1))

        file_open.create_dataset('check_array', data=check_array)

        file_open.create_dataset('fixities_vals', data=fixities_vals)

        file_open.create_dataset('shear_panel_values', data=shear_panel_values)

        file_open.create_dataset('spring_values', data=spring_values)

        file_open.create_dataset('added_node_information', data=added_node_information)

        file_open.create_dataset('element_member', data=element_member)

        file_open.create_dataset('BNodevalue', data=BNodevalue)

        file_open.create_dataset('SNodevalue', data=SNodevalue)

        file_open.create_dataset('Massemble', data=Massemble)

        file_open.create_dataset('table_prop', data=table_prop)

        file_open.create_dataset('DUP1', data=DUP1)

        file_open.create_dataset('DUP2', data=DUP2)

        file_open.create_dataset('RNCc', data=RNCc)

        file_open.create_dataset('PNC', data=PNC)

        file_open.create_dataset('PNC1', data=PNC1)

        file_open.create_dataset('PNC2', data=PNC2)

        file_open.close()

    def save_on_file(self, array_name, database_name, file_name = 'process.h5'):
        """ This function operates for saving the given numpy array to the file"""

        # print('save on file')

        file_open = h5py.File(file_name, 'a')

        if database_name in file_open.keys():
            # print('test 1')
            h5_Class.update_array(self, array_name, database_name)

        else:
            # print('test 2')
            file_open.create_dataset(database_name, data=array_name)

        file_open.close()

    def update_array(self,  array_name, database_name, file_name = 'process.h5'):
        """ This function operates for updating the given numpy array on the file"""
        # print('update_array')

        file_open = h5py.File(file_name, 'a')

        # print('database name = ', database_name)

        file_open.__delitem__(database_name)

        file_open.create_dataset(database_name, data= array_name)

        file_open.close()

    def delete_array(self, database_name, file_name = 'process.h5'):
        """This function is to delete the requested array"""

        # print('delete_array')

        file_open = h5py.File(file_name, 'a')

        file_open.__delitem__(database_name)

        file_open.close()

    def read_array(self, database_name, file_name = 'process.h5'):

        # print('read_array')

        file_read = h5py.File(file_name, 'r')

        array_name = file_read[database_name][:]

        file_read.close()

        return array_name




