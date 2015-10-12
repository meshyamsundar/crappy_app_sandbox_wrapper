#!/bin/python
import sys, os
import argparse
import subprocess
import plistlib

__author__ = 'Justin Barsketis'

attributes = {
    'long_name': "Create Crappy App",
    'name': "create_crappy_app",
    'version': "2.0.0",
}

# This class creates an application that mounts to a shadow drive
# allowing it to have admin permissions on the drive
# but not affect the rest of the computer
class createCrappyApp():

    def __init__(self, _app_name, _target_directory):
        self.r = _app_name

    # Create a sparse Disk image that the user will install the applicaiton to
    def createSparse(self, _app_name, size):

        # Create the sparse image using the hdiutil command
        hdiutil_command = [
            '/usr/bin/hdiutil',
            'create',
            '-size',
            '1g',
            '-fs',
            'HFS+J',
            '-type',
            'SPARSE',
            '-volname',
            _app_name,
            _app_name
        ]

        output = subprocess.check_output(
            hdiutil_command,
            stderr=subprocess.STDOUT
        ).strip('\n')
        print (output)

        # Mount the image
        hdiutil_attach = [
            '/usr/bin/hdiutil',
            'attach',
            _app_name + '.sparseimage'

        ]
        output = subprocess.check_output(
            hdiutil_attach,
            stderr=subprocess.STDOUT
        ).strip('\n')
        print (output)
        return output

    # Prompt the user to install to the mounted image
    # Waits for user to proceed with keyboard
    def waitForUserInstall(self, _app_name):
        print ("Use this time to install your application to /Volumes/" + _app_name)
        os.system('read -s -n 1 -p "Press any key to continue..."')
        print

        return

    # Once the applicaiton is installed, convert the sparse to dmg
    def convertToDmg(self, _app_name):

        #Unmount the sparse image
        hdiutil_detach = [
            '/usr/bin/hdiutil',
            'detach',
            '/Volumes/' + _app_name
        ]

        output = subprocess.check_output(
            hdiutil_detach,
            stderr=subprocess.STDOUT
        ).strip('\n')

        print (output)

        # Convert sparse to dmg using hdiutil
        hdiutil_convert = [
            '/usr/bin/hdiutil',
            'convert',
            _app_name + '.sparseimage',
            '-format',
            'UDRO',
            '-o',
            _app_name + '.dmg'
        ]

        output = subprocess.check_output(
            hdiutil_convert,
            stderr=subprocess.STDOUT
        ).strip('\n')

        print (output)

        #Delete the old sparse image, it is not needed
        output = subprocess.check_output(
            ['rm', _app_name + '.sparseimage'],
            stderr=subprocess.STDOUT
        ).strip('\n')

        print (output)

        return output

    # Moves the dmg and icon files from the root folder into the Template.app
    def moveDmgIcns(self, _app_name):
        print (_app_name + '.dmg', "Template.app/Contents/Resources/" + _app_name + ".dmg")
        os.rename(_app_name + '.dmg', "Template.app/Contents/Resources/" + _app_name + ".dmg")
        os.rename('default.icns', "Template.app/Contents/Resources/" + _app_name + ".icns")

    # Modify's select plist values, find key and access as an array if more values are needed
    def modifyInfoPlist(self, _app_name, _version):
        with open("Template.app/Contents/Info.plist", 'rb') as infoplist:
            plist = plistlib.readPlist(infoplist)
            plist["CFBundleIconFile"] = _app_name + ".icns"
            plist["CFBundleIdentifier"] = "edu.utah.scl." + _app_name
            plist["CFBundleName"] = _app_name
            plist["CFBundleShortVersionString"] = _version
            plistlib.writePlist(plist, "Template.app/Contents/info.plist")

    # Creates entire Template app
    def createTemplate(self, _app_name, _version, _target_directory):
        self.moveDmgIcns(_app_name)
        self.modifyInfoPlist(_app_name, _version)

        # Rename app from template to user specified
        os.rename("Template.app", _app_name + ".app")

        return

    def create(self, _app_name, _version, _size, _target_directory):
        self.createSparse(_app_name, _size)
        self.waitForUserInstall(_app_name)
        self.convertToDmg(_app_name)
        self.createTemplate(_app_name, _version, _target_directory)
        #Add segmentor for large files
        


    def run(self, _app_name):
        hdiutil_attach = [
            '/usr/bin/hdiutil',
            'attach',
            '-nobrowse',
            '-noautoopenro',
            '-noverify',
            '-mountroot',
            '/Volumes',
            '-shadow',
            '/tmp/' + _app_name + ".shadow",
            _app_name + ".app/Contents/Resources/" + _app_name + ".dmg"
        ]

        output = subprocess.check_output(
            hdiutil_attach,
            stderr=subprocess.STDOUT
        ).strip('\n')

        print (output)



        return



if __name__ == '__main__':
    creator = createCrappyApp("Battlenet", '/Application/Games/')
    creator.create('Battlenet', "1.3.2.6160", '5g', '/Application/Games/')
    #creator.run('battlenet')

#hdiutil attach -nobrowse -noautoopenro -noverify -mountroot /Volumes -shadow " & quoted form of shadowPath & " " & quoted form of imagePath