#!/usr/bin/env python3

import os , json
from sys import argv
from enum import Enum

# GLOBAL CONSTANTS !
VERSION = "1.0.2"
XOR_VALUE = 100
CONFIG_FILE = "config.json"
ACTIVE_DEBUG = True
PRINTLN = lambda x : print(x) if ACTIVE_DEBUG else None
DEFAULT_APP = "TaxiApp"
POSSIBLE_PYMODES_LEN = 2

POSSIBLE_APPS = [
    'TaxiApp',
    'CustomerApp',
    'DeliveryApp'
]

POSSIBLE_DBS = [
    'test',
    'prod',
    'dev'
]

POSSIBLE_LMODES = [
    'stage',
    'dev',
    'prod'
]

class DW_EXIT_REASONS(Enum):
    NORMAL = 0
    WRONG_ARG = -1
    CONFIG_FILE_NOT_FOUND = -2
    APP_PATH_NOT_FOUND = -3
    APP_DB_NOT_FOUND = -4
    APP_LMODE_NOT_FOUND = -5
    WONG_BUILD_TYPE = -6
    CONF_FILE_PYMODES_LEN_WRONG = -7
    CONF_FILE_PYMODES_VALUES_WRONG = -8
    CONF_FILE_APP_VALUES_WRONG = -9
    CONF_FILE_APP_PATH_EMPTY = -10
    CONF_FILE_APP_DB_EMPTY = -11
    CONF_FILE_APP_LMODE_EMPTY = -12
    CONF_FILE_APPNAME_WRONG = -13
    CONF_FILE_DBNAME_WRONG = -14
    CONF_FILE_LMODENAME_WRONG = -15
    CONF_FILE_GIVEN_APP_PATH_NOT_FOUND = -16
    ROOT_MAIN_DART_FILE_NOT_FOUND = -17
    FLUTTER_HOOKS_LAUNCH_NOT_FOUND = -18
    HOOKS_BUILD_KEYS_INVALID = -19
    HOOKS_LAUNCH_KEYS_INVALID = -20
    RESOLVING_LAN_IP_FAILED = -21
    GOOGLE_SERVICES_JSON_NOT_IN_LAUNCHER_FILES = -22
    GOOGLE_SERVICES_JSON_NOT_IN_ANDROID_APP_FOLDER = -23
    PLIST_GOOGLE_SERVICES_JSON_NOT_IN_LAUNCHER_FILES = -24
    PLIST_GOOGLE_SERVICES_JSON_NOT_IN_IOS_APP_FOLDER = -25
    WRONG_GLOBALS_USED = -26

    REACH_THE_LAZY_SAAD = -10000

class Launcher:
    def __init__(self , user_args , conf) -> None:
        self.user_args = user_args
        self.conf = conf
        self.last_app = Config.chSum(user_args['app'])
        self.__launch__()
        try:
            PRINTLN(f"\n[~] Launching with : {user_args} \n\n")
            os.system(f'flutter run {self.flutter_setup}')
        except KeyboardInterrupt:
            print("Exiting the launcher .... bye bye!")
    
    def __f_checker__(self):
        if not os.path.exists('../lib/pre-main.dart'):
            exit(DW_EXIT_REASONS.ROOT_MAIN_DART_FILE_NOT_FOUND)


    def __patcher__(self):
        PRINTLN("[+] Patching ../lib/pre-main.dart !")
        f_root_main = open('../lib/pre-main.dart' , encoding='utf-8' , errors='ignore').read()
        f_root_main = f_root_main.replace(self.last_app , self.user_args['app'])

        # Writing new Valid App.
        open('../lib/pre-main.dart' , 'w+').write(f_root_main)
        PRINTLN("[+] Pacthed ../lib/pre-main.dart successfully !")
    
    def __patch_gs__(self):
        '''If its staging mode Patch the Gpoogle-services.json'''
        android_flutter_gs_path = '../android/app/google-services.json'
        ios_flutter_gs_path = '../ios/Runner/GoogleService-Info.plist'

        if self.user_args['lmode'] == 'stage':
            PRINTLN("[+] Launching on Staging mode - Patching gServices ...!")    
            # Android
            if not os.path.exists('staging.google-services.json'):
                exit(DW_EXIT_REASONS.GOOGLE_SERVICES_JSON_NOT_IN_LAUNCHER_FILES)
            if not os.path.exists(android_flutter_gs_path):
                exit(DW_EXIT_REASONS.GOOGLE_SERVICES_JSON_NOT_IN_ANDROID_APP_FOLDER)
            
            # ios

            if not os.path.exists('staging.GoogleService-Info.plist'):
                exit(DW_EXIT_REASONS.PLIST_GOOGLE_SERVICES_JSON_NOT_IN_LAUNCHER_FILES)
            if not os.path.exists(ios_flutter_gs_path):
                exit(DW_EXIT_REASONS.PLIST_GOOGLE_SERVICES_JSON_NOT_IN_IOS_APP_FOLDER)


            staging_client = json.loads(open('staging.google-services.json').read())
            del staging_client['client'][0]
            PRINTLN(f"[+] Applying Client's Package :{staging_client['client'][0]['client_info']['android_client_info']}")
            open(android_flutter_gs_path , 'w+').write(json.dumps(staging_client))
            open(ios_flutter_gs_path , 'w+').write(open('staging.GoogleService-Info.plist').read())

        # Prodyction Mode !
        elif self.user_args['lmode'] == 'prod':
            '''We will copy the prod plist and gms to android / ios folders !'''
             # Android
            if not os.path.exists('prod.google-services.json'):
                exit(DW_EXIT_REASONS.GOOGLE_SERVICES_JSON_NOT_IN_LAUNCHER_FILES)
            if not os.path.exists(android_flutter_gs_path):
                exit(DW_EXIT_REASONS.GOOGLE_SERVICES_JSON_NOT_IN_ANDROID_APP_FOLDER)
            
            # ios
            if not os.path.exists('prod.GoogleService-Info.plist'):
                exit(DW_EXIT_REASONS.PLIST_GOOGLE_SERVICES_JSON_NOT_IN_LAUNCHER_FILES)
            if not os.path.exists(ios_flutter_gs_path):
                exit(DW_EXIT_REASONS.PLIST_GOOGLE_SERVICES_JSON_NOT_IN_IOS_APP_FOLDER)

            prod_client = json.loads(open('prod.google-services.json').read())
            open(android_flutter_gs_path , 'w+').write(json.dumps(prod_client))
            open(ios_flutter_gs_path , 'w+').write(open('prod.GoogleService-Info.plist').read())
            PRINTLN("[+] Done Patching Prod clients !")
            
        else:
            PRINTLN("[+] Passed GS patching steps , since it's not staging mode !")
            
            
    def __set_flutter_args__(self):
        self.flutter_setup = f"--dart-define=APP_SP={self.user_args['app']} --dart-define=HOST={self.user_args['host']} --dart-define=LMODE={self.user_args['lmode']} --dart-define=DB={self.user_args['db']}"

    def __launch__(self):
        self.__f_checker__()
        if self.last_app != None:
            self.__patcher__()
        self.__patch_gs__()
        self.__set_flutter_args__()
        


class Builder:

    def __patcher__(self , key):
        if key in self.VALID_MAIN_KEYS:
            return self.user_args[key]

        else:
            PRINTLN(f'[!] flutter_hooks.build.keys::{key} not a valid key !')
            exit(DW_EXIT_REASONS.HOOKS_BUILD_KEYS_INVALID)

    def __init__(self , user_args , conf) -> None:
        print("[+] Please don't build anything yet , this will mess things up as long as the builder is not done !")
        exit(DW_EXIT_REASONS.REACH_THE_LAZY_SAAD)
        
        self.user_args = user_args
        self.conf = conf

        self.VALID_MAIN_KEYS = [

            'app',
            'host',
            'lmode',
            'db'

        ]

        PRINTLN(f"\n[~] Checking flutter app validity .")
        _path = conf[user_args['app']]['path']
        _root_main_dart  = os.path.join(_path , '../lib/main.dart')
        _root_main_dart_backup  = os.path.join(_path , '../lib/main.dart')+'.backup'

        if not os.path.exists(_path):
            exit(DW_EXIT_REASONS.CONF_FILE_GIVEN_APP_PATH_NOT_FOUND)

        if not os.path.exists(_root_main_dart):
            exit(DW_EXIT_REASONS.ROOT_MAIN_DART_FILE_NOT_FOUND)
        else:
            if not os.path.exists(_root_main_dart_backup):
                os.rename(_root_main_dart , _root_main_dart_backup)
                PRINTLN("[+] saved main.dart => main.dart.backup !")

        if not os.path.exists('flutter_hooks/build'):
            exit(DW_EXIT_REASONS.FLUTTER_HOOKS_LAUNCH_NOT_FOUND)
        
        keys_json = json.loads(open('flutter_hooks/build/keys.json').read())
        py_main_dart = open('flutter_hooks/build/main.dart').read()
        
        for k in keys_json:
            rep = self.__patcher__(k)
            if not rep == None: 
                py_main_dart = py_main_dart.replace(keys_json[k] , )
            else:
                PRINTLN(f"[!] {k} not in VALIDKEYS , reach saad out xD !")
                exit(DW_EXIT_REASONS.REACH_THE_LAZY_SAAD)
        
        if open(_root_main_dart_backup).read().startswith('//544D'):
            print("[!] WARNING - lib/main.dart.backup , starts with //544D which means it's generated by the builder !")

        ans = None
        while True:
            ans = input("\n\n[!] WARNING - Is the lib/main.dart.backup , the latest main.dart version ? y/n : ").lower()
            if ans == 'y':
                break
            elif ans == 'n':
                _  = input("\n[!] PS : This will remove the main.dart.backup and make main.dart as backup ! y/n : ").lower()
                if _ == 'y':
                    os.remove(_root_main_dart_backup)
                    os.rename(_root_main_dart , _root_main_dart_backup)
                    PRINTLN("[+] saved main.dart => main.dart.backup !")
                else: print("[+] Aborting ...")
            
        with open(_root_main_dart , 'w+') as mainDart:
            mainDart.write(py_main_dart)
            mainDart.close()

        # Now build !

        print(f"\n[~] Building with : {user_args}")



class Config:
    
    @staticmethod
    def chSum(app , isLaunch=True):
        last_ch_sum = "flutter_hooks/" + ("launch" if isLaunch else "build") + "/.chsum"
        f = open(last_ch_sum , 'r+').read().replace('\n' , '')
        if not f or f != app:
            PRINTLN(f"[+] Generating new checkSum for __app__[{app}]")
            fp = open(last_ch_sum , 'w+')
            fp.write(app)
            fp.close()
            # return last app
            return f
        else: 
            PRINTLN(f"[+] Detected Same checkSum for __app__[{app}] , Skipping Generation !")
            return None

    def __preinit__(self):
        if not os.path.exists(CONFIG_FILE):
            PRINTLN(f"[!] Configuration file {CONFIG_FILE} not found !")
            exit(DW_EXIT_REASONS.CONFIG_FILE_NOT_FOUND)
        else : 
            self.conf = json.loads(open(CONFIG_FILE).read())
            PRINTLN(f"[+] Loaded {CONFIG_FILE}")
        
        # check validity of build conf
        if self.conf.__len__() != POSSIBLE_PYMODES_LEN:
            exit(DW_EXIT_REASONS.CONF_FILE_PYMODES_LEN_WRONG)
        else:
            # we checkk the validity of the rest of confs !
            if 'build' not in self.conf.keys() or 'launch' not in self.conf.keys():
                exit(DW_EXIT_REASONS.CONF_FILE_PYMODES_VALUES_WRONG)

            # Build first !
            for k in self.conf['build']:
                _ = self.conf['build'][k]
                if 'database' not in _ or 'launchMode' not in _ or 'path' not in _:
                    exit(DW_EXIT_REASONS.CONF_FILE_APP_VALUES_WRONG)
                else:
                    # null checks 
                    if _['database'] == None or _['database'] == "":
                        exit(DW_EXIT_REASONS.CONF_FILE_APP_DB_EMPTY)
                    if _['path'] == None or _['path'] == "":
                        exit(DW_EXIT_REASONS.CONF_FILE_APP_PATH_EMPTY)
                    if _['launchMode'] == None or _['launchMode'] == "":
                        exit(DW_EXIT_REASONS.CONF_FILE_APP_LMODE_EMPTY)
                    
            PRINTLN("[+] Config file validated !")


    def __init__(self , args) -> None:
        self.args = args
        self.user_args = {}
        self.__preinit__()
        self.__checker__(args) # dict

        if self.user_args['pymode'] == "launch":
            # it's a launch operation !
            Launcher(self.user_args , self.conf['launch'])

        elif self.user_args['pymode'] == "build":
            # it's a build operation !
            Builder(self.user_args , self.conf['build'])
        else:
            self.__wrong_args__()

    def __wrong_args__(self):
        PRINTLN("[!] Wrong Arguments !")
        exit(DW_EXIT_REASONS.WRONG_ARG)

    def __get_arg_value__(self , txt):
        c = [x for x in self.args if txt in x]
        if len(c) == 0:
            return None
        elif len(c) > 1:
            self.__wrong_args__()
        else:
            _ = c[0].split('=')[-1]
            if _ == "" or _ == None:
                return None
            else :return _

    def __get_actual_lan_ip(self):
        try:
            import socket

            s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            s.connect(("8.8.8.8", 80))
            ip = s.getsockname()[0]
            PRINTLN(f"[+] Resolved Lan IP : {ip}")
            return ip

        except:
            PRINTLN("[+] Problem happend resolving LAN IP !")
            exit(DW_EXIT_REASONS.RESOLVING_LAN_IP_FAILED)

    def __checker__(self , args) -> None:
        # Checking pymode
        if '--build' in args:
            self.user_args['pymode'] = "build"
        elif '--launch' in args:
            self.user_args['pymode'] = "launch"
        else: self.user_args['pymode'] = "launch"
        
        # in case of a launch and run in lan :

        if self.user_args['pymode'] == "launch":
            self.user_args['host'] = "http://127.0.0.1" if '--lan' not in args else self.__get_actual_lan_ip()

        # Checking App
        _ = self.__get_arg_value__('app=')

        if _ :
            if _ not in POSSIBLE_APPS:
                PRINTLN(f'[!] app={_} : Error This app is wrong !')
                exit(DW_EXIT_REASONS.CONF_FILE_APPNAME_WRONG)
            self.user_args['app'] = _
        else:
            self.user_args['app'] = DEFAULT_APP

        # if using globals from json jump lmode and db checks
        _ = self.__get_arg_value__('-g=')
        if _:
            if _ not in POSSIBLE_LMODES:
                PRINTLN(f'[!] -g={_} : Invalid global keyword used !')
                exit(DW_EXIT_REASONS.WRONG_GLOBALS_USED)
            
            self.user_args['lmode'] = self.conf[self.user_args['pymode']]['globals'][_]['launchMode']
            self.user_args['db'] = self.conf[self.user_args['pymode']]['globals'][_]['database']

            # check if lmode was tampered
            if self.user_args['lmode'] not in POSSIBLE_LMODES:
                PRINTLN(f'[!] lmode={self.user_args["lmode"]} : Error This launch mode is wrong !')
                exit(DW_EXIT_REASONS.CONF_FILE_LMODENAME_WRONG)

            # check if db was tampered
            if self.user_args['db'] not in POSSIBLE_DBS:
                    PRINTLN(f'[!] db={self.user_args["db"]} : Error This Database mode is wrong !')
                    exit(DW_EXIT_REASONS.CONF_FILE_LMODENAME_WRONG)
        
            PRINTLN(f"[+] You are using globals::{_} with :")
            PRINTLN(f"\t\t|_ Lmode => {self.user_args['lmode']}")
            PRINTLN(f"\t\t|_ Database => {self.user_args['db']}")

        # Else get default lmode / db if not given by user.
        else:
            _ = self.__get_arg_value__('lmode=')
            if _:
                if _ not in POSSIBLE_LMODES:
                    PRINTLN(f'[!] lmode={_} : Error This launch mode is wrong !')
                    exit(DW_EXIT_REASONS.CONF_FILE_LMODENAME_WRONG)

                self.user_args['lmode'] = _
            else:
                self.user_args['lmode'] = self.conf[self.user_args['pymode']][self.user_args['app']]['launchMode']

            _ = self.__get_arg_value__('db=')
            if _:
                if _ not in POSSIBLE_DBS:
                    PRINTLN(f'[!] db={_} : Error This database is wrong !')
                    exit(DW_EXIT_REASONS.CONF_FILE_DBNAME_WRONG)
                self.user_args['db'] = _
            else:
                self.user_args['db'] = self.conf[self.user_args['pymode']][self.user_args['app']]['database']
                    

   

if __name__ == "__main__":
    Config(argv)
    exit(DW_EXIT_REASONS.NORMAL)
