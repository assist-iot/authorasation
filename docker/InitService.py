#!/usr/bin/python3
# -*- coding: utf-8 -*-
'''
Created:>  Martes 11 de Octubre 2022
Updated:>  Miercoles 12 de Octubre 2022
@author: urantialife # Josue Moret Ruiz
'''
from time import sleep
from os.path import exists
from sys import argv, executable 
from os import getcwd, chdir, system as sis
from subprocess import check_call, DEVNULL
from subprocess import getoutput as out
from pkg_resources import working_set

def CheckInstall():
    try:
        sis('sudo apt-get -qq -y  install python3-pip python3-dev > /dev/null')
    except:
        pass
    required = {'termcolor', 'tqdm', 'colorama'}
    installed = {pkg.key for pkg in working_set}
    missing = required - installed
    if missing:
        python = executable
        check_call([python, '-m', 'pip3', 'install', *missing], stdout=DEVNULL)

try:
    CheckInstall()
except:
    pass

from tqdm import tqdm
from termcolor import cprint as pint
import colorama



files = ['authz', 'pdp']
curdir = getcwd()
process = ['start', 'stop']
authzdatadir = "%s/%s/vol/authzdb/datadir"%(curdir, files[0])
pdpdatadir = "%s/%s/vol/pdpdb/datadir"%(curdir, files[1])

def Existence():
    return exists(authzdatadir)


def Owner():
    pass

def Printer(message, colors, on_it=None, attrs=['bold']):
    colorama.deinit()
    colorama.init(strip=False)
    if on_it is not None:
        pint(message, colors, on_it, attrs=attrs)
    elif on_it is None:
        pint(message, colors, attrs=attrs)

def Bar():
    Printer("Loading data...", "yellow", "on_blue")
    bar=tqdm(range(100), bar_format="{percentage:3.0f}% |{bar}| {elapsed}/{remaining}")
    for a in bar:
        sleep(0.5)

def FastBar():
    Printer("Creating database...", "yellow", "on_blue")
    bar=tqdm(range(100), bar_format="{percentage:3.0f}% |{bar}| {elapsed}/{remaining}")
    for a in bar:
        sleep(0.2)

def CheckingDB():
    okmsg = "[Note] [Entrypoint]: MySQL init process done. Ready for start up."
    okmsg1 ="[Server] /usr/sbin/mysqld: ready for connections"
    data_images = ' '.join(out("docker ps | awk '{print $1,$2}'").split(' ')).split('\n')[1:]
    data_images = {a.split(' ')[1]:a.split(' ')[0] for a in data_images}
    while True:
        checkout = out("docker logs %s" %(data_images["authz_database"]))
        if okmsg in checkout:
            Printer("Database is Created, Up and Running!", "green")
            Printer(okmsg, "green")
            Printer("\nAuthz Server is Up", "green")
            break
        elif okmsg1 in checkout:
            Printer("Database is Created, Up and Running!", "green")
            Printer(okmsg1, "green")
            Printer("\nAuthz Server is Up", "green")
            break
        else:
            FastBar()
            Bar()
            continue


def Permit():
    Printer("Checking Permissions Authz Server DB!", "yellow")
    if Existence() == True:
        chdir(curdir)
        sis("sudo chmod -R 777 %s"%(authzdatadir))
    elif Existence() == False:
        chdir(curdir)
        try:
            chdir("%s/%s/vol/authzdb"%(curdir, files[0]))
            sis("sudo mkdir %s"%(authzdatadir))
        except:
            sis("sudo mkdir -p %s"%(authzdatadir))        
        sis("sudo chmod -R 777 %s"%(authzdatadir))
        sis("sudo chown -R root:root %s"%(authzdatadir))


def Start(build=None):
    Permit()
    Printer("Starting Authz Server", "green")
    chdir("%s/%s" %(curdir, files[0]))
    if build == True:
        Printer("Building from Source Authz Server", "yellow", "on_blue")
        sis("docker-compose up -d --build --force-recreate")
        CheckingDB()
    elif build == None:
        sis("docker-compose up -d")
        CheckingDB()


def Stop():
    Printer("Stopping Authz Server", "red")
    chdir("%s/%s" %(curdir, files[0]))
    sis("docker-compose down")
    Printer("\nAuthz Server is Down", "red")


def Procs():
    sis("docker-compose -f authz/docker-compose.yml ps")


def Logs():
    sis("docker-compose -f authz/docker-compose.yml logs")


def Help():
    sis("clear")
    Printer('''
        HELP

        Inicialization services for Authorization Server

        OPTIONS FLAGS:

        * start
            Starting the authorization server.

            * -b
                Building from source the Authorization Server and starting all services. 
        
        * stop
            Stopping the authorization server.
        
        * -l
            Showing the authorization server logs.
        
        * -s
            Showing the authorization services running.

        * -h
            Showing the help.


        EXAMPLE WITH OPTIONS FLAGS USSAGE:

        * python3 InitService.py start

        * ./InitService start


        * python3 InitService.py start -b

        * ./InitService start -b


        * python3 InitService.py stop

        * ./InitService stop


        * python3 InitService.py -l

        * ./InitService -l


        * python3 InitService.py -s

        * ./InitService.py -s

    ''', "cyan")


def main(*args):
    args = [a[0:] for a in args][0]
    if len(args) == 1:
        if args[0] == '-l':
            Logs()
        elif args[0] == '-s':
            Procs()
        elif args[0] == 'start':
            Start()
        elif args[0] == 'stop':
            Stop()
    elif len(args) == 2:
        if args[0] == 'start':
            if args[1] == '-b':
                Start(build=True)
        elif args[0] == 'stop':
            Stop()
        

if __name__ == "__main__":
    arguments = argv[1:]
    if '-h' in arguments or len(arguments) == 0:
        Help()
    main(arguments)
