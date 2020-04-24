import os
import requests
import urllib.request


FILE_DOWNLOAD_URL = 'https://ucf2de894d9a247d9a42c4f9297e.dl.dropboxusercontent.com/cd/0/get/A2eeBjNIQ0mxn7ZVT7lFhGYT7RkzmnBQcZmrk16bckzudstwhx34ETCWD7kampPVeJhZOfWUM25-qsL8XSwoK9RisgGwTozZmnpwXJR8xzQbrnQpv5woeywfVrjKm38dVQ4/file?dl=1#'


class DownloadProgressBar(tqdm):
    def update_to(self, b=1, bsize=1, tsize=None):
        if tsize is not None:
            self.total = tsize
        self.update(b * bsize - self.n)


def download_url(url, output_path):
    print('Downloading oracle sqlplus package....')
    with DownloadProgressBar(unit='B', unit_scale=True,
                             miniters=1, desc=url.split('/')[-1]) as t:
        urllib.request.urlretrieve(
            FILE_DOWNLOAD_URL, filename=output_path, reporthook=t.update_to)


def script2():
    print('Configuring post install files...')
    os.system('./install_part2.sh')
    print('Done configuring post install files')

def scrip1():
    print('Configuring files..')
    os.system("./install_part1.sh")
    print('Done configuring files')


def make_exec():
    os.system('chmod +x ./install_part1.sh')
    os.system('chmod +x ./install_part2.sh')


def install_deb():
    print('Installing Package. This might take a while...')
    os.system('sudo dpkg -i ./oracle.deb')
    print('Dont installing package')


def download_deb():
    print('Starting Download')
    download_url(FILE_DOWNLOAD_URL, 'oracle.deb')
    print('Download finished')


def yes_or_no(str):
    print(str + '(y/n)')
    line = input()
    if(line == 'y'):
        return True
    else:
        return False


def install_packages():
    print('The script needs the following packages:')
    print('alien, libaio1, unixodbc ')
    os.system('sudo apt install alien libaio1 unixodbc')


def setup():
    install_packages()
    download_deb()
    make_exec()
    script1()
    install_deb()
    script2()

    print('\n\n================================')
    print('Script has finished installing Oracle SQL-Plus')
    print('You may now access SQL Plus from the command line using the command sqlplus')


if __name__ == '__main__':
    # make_exec()
    setup()
