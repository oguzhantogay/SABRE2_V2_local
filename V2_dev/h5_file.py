import os

os.environ["TF_CPP_MIN_LOG_LEVEL"]="3"

import h5py

class h5_Class:
    """ This class is for saving the temporary arrays to the h5 files."""

    def save_on_file(self, array_name, database_name, file_name = 'process.h5'):
        """ This function operates for saving the given numpy array to the file"""

        if os.path.exists(file_name):
            file_open = h5py.File(file_name, 'a')
        else:
            file_open = h5py.File(file_name, 'w')

        file_open.create_dataset(database_name, data=array_name)

        file_open.close()

    def update_array(self,  array_name, database_name, file_name = 'process.h5'):
        """ This function operates for updating the given numpy array on the file"""

        file_open = h5py.File(file_name, 'a')

        file_open.__delitem__(database_name)

        file_open.create_dataset(database_name, data= array_name)

        file_open.close()

    def delete_array(self, database_name, file_name = 'process.h5'):
        """This function is to delete the requested array"""

        file_open = h5py.File(file_name, 'a')

        file_open.__delitem__(database_name)

        file_open.close()





