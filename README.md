# Virtual-Dev-Environments
scripts &amp; configs for starting up Windows VirtualBox environments with packer &amp; vagrant

# Introduction
I created this project because i wanted to try some Windows 10 / Visual Studio 2015 features on my Windows 7 Machine.  Also has an exercise to learn functionality of packer and vagrant.  This will build a personal development environment tailored to me, but it can be customized for your needs.  The source of most of this info is the [packer-windows](http://github.com/joefitzgerald/packer-windows) repo.  I have just stripped down most of it to pertain to Windows 10 and Virtual Box

# Techologies Used

- [Chocolatey](https://chocolatey.org/)
- [Packer](http://packer.io/)
- [Vagrant](http://vagrantup.com/)

# How To
Directions are assuming a Windows host environment and using VirtualBox for virtualization.  I have tried it successfully on Windows 7 and Windows 10 (Other environments are possible but I haven't personally done it.) All steps can be performed via command line, and assume you don't have any previous software installed.

# Steps
* Install [Chocolatey](http://chocolatey.org/).
* Install VirtualBox, Packer, and Vagrant.

````
choco install VirtualBox
choco install Packer
choco install Vagrant
````

* Clone this repo into a directory.
* Within that directory run packer to build a vagrant .box file. This step will download the Windows 10 Eval ISO from Microsoft, install Windows, install chocolately, a few dev tools (Including Visual Studio 2015 Community).  So it will take a while.

`````
packer build windows_10.json
`````
* This should have resulted in a .box file created meant to be used with vagrant.  Next, we need to add this box to vagrant's list so it can manage it for us.

`````
vagrant box add -name win10 windows_10_virtualbox.box
`````
* The next step is initialize the directory to be used with vagrant.
````
vagrant init win10
````
* Now, we are all ready to boot and use the VM!
````
vagrant up
````

It *SHOULD* be up and running at this point. If you would like to Remote into it, you can run the following command
````
vagrant rdp
````
The username and password will be `vagrant\vagrant` NOTE: IF you are a Windows 10 host you may need to specify `LocalAccount\vagrant`

# Customization

The easiest thing to customize on this is which software gets installed with the machine installation the `scripts/chocolately.bat` file contains all the packages that get installed by Chocolately when Packer builds the image.  I am copying some config files in the Packer provisioner, which you can change and/or replace with others that would suit your needs.

# Gotchas

I was getting some WinRM errors when running this at first, I was able to get around this by installing a plugin, so this command may need to be run before the vagrant up command if you get errors
````
vagrant plugin install winrm-fs
````



