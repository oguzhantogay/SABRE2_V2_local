import os

os.environ["TF_CPP_MIN_LOG_LEVEL"]="3"

import h5py

class h5_Class:
    """ This class is for saving the temporary arrays to the h5 files."""

    def save_on_file(self, array_name, database_name, file_name = 'process.h5'):
        """ This function operates for saving the given numpy array to the file"""

        print('save on file')

        if os.path.exists(file_name):
            file_open = h5py.File(file_name, 'a')
        else:
            file_open = h5py.File(file_name, 'w')

        if database_name in file_open.keys():
            print('test 1')
            self.update_array(array_name, database_name)

            file_open.close()
        else:

            print('test 2')
            file_open.create_dataset(database_name, data=array_name)

            file_open.close()

    def update_array(self,  array_name, database_name, file_name = 'process.h5'):
        """ This function operates for updating the given numpy array on the file"""
        print('update_array')

        file_open = h5py.File(file_name, 'a')

        file_open.__delitem__(database_name)

        file_open.create_dataset(database_name, data= array_name)

        file_open.close()

    def delete_array(self, database_name, file_name = 'process.h5'):
        """This function is to delete the requested array"""

        print('delete_array')

        file_open = h5py.File(file_name, 'a')

        file_open.__delitem__(database_name)

        file_open.close()

    def read_array(self, database_name, file_name = 'process.h5'):

        print('read_array')

        file_read = h5py.File(file_name, 'r')

        array_name = file_read[database_name][:]

        file_read.close()

        return array_name




