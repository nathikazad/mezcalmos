#!/usr/bin/python3


from os import error
from sys import argv , platform
import socket


class Launcher(object):
    def _get_actual_lan_ip(self):
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        return s.getsockname()[0]

    def __init__(self, *args):
        self.args               = args[0]
        self.VERSION            = "2021-07-19 16:32:03.708480"
        self._ip_dart_define    = "HOST"
        self._db_dart_define    = "DB"
        self._sp_dart_define    = "APP_SP"
        self._lmode_dart_define = "LMODE"
        self.build_output_dir   = '.launcher_output'

        self.__exec__           = lambda c:__import__("os").system(c)
        self.get_lan_ip         = lambda: f"http://{self._get_actual_lan_ip()}"
        self.lanhost            = False
        self.app                = "taxi"
        self.web                = False
        self.db                 = 'production'
        self.pub_get            = False
        self.launch_mode        = "dev"
        self.os                 = "Windows OS"
        self.isWin              = True
        self.ios_build_path     = ""
        self.dri_trav           = "\\"
        self.android_build_path = lambda : f"build{self.dri_trav}app{self.dri_trav}outputs{self.dri_trav}bundle{self.dri_trav}release{self.dri_trav}app-release.aab"

        self.__cmds__           = {
            
            "nt": {

                "clear"     : lambda : self.__exec__("cls"),
                "copy"      : lambda _from , to : (self.__exec__(f"copy {_from} {to}")),
            },

            "o": {
                
                "clear"     : lambda : self.__exec__("clear"),
                "copy"      : lambda _from , to : (self.exec_(f"cp {_from} {to}")),
            }

        }

        # Auto Launching
        self.Launch()


    def __errors_tracker__(self):
        if __import__('os').path.exists("errors_tracking"):
            import json as jsn
            import re
            solved = [ s_err_key for s_err_key in jsn.load(open("errors_tracking/solved.json" ,  encoding='utf-8', errors='ignore' ))['v1'] ]
            unsolved_errors = [ _l.replace(' ','').replace(':','').replace('>Error' , '').strip() for _l in open("errors_tracking/errors_log.txt" , encoding='utf-8', errors='ignore').readlines() if re.match(r'^(.|\>).{0,12}Error.{0,12}[0-9]+' , _l) and _l.replace(' ','').replace(':','').replace('>Error' , '').strip() not in solved]
            print("\n[ REMINDER ] There are unsolved Problems / Errors that might affect the application in Runtime!")
            print(f"\t|")
            print(f"\t|_ Errors IDs : {' - '.join(unsolved_errors)}")
            print("\t|_ Check errors_tracking/errors_log.txt for more\n\n")
            __import__('time').sleep(0.5)
            

    def __set_sys_cmd__(self):
        if self.isWin:
            self.cmds = self.__cmds__['nt']
        else:
            self.cmds = self.__cmds__['o']
            self.dri_trav = "/"


    def __get_os__(self):
        if not platform.startswith('win') and platform != 'nt':
            self.os     = f"{platform} based OS!"
            self.isWin  = False      
    
    def __version__(self):
        print(f"[VS] Version - {self.VERSION}")


    def __pre_launch_process__(self):
        self.__get_os__()
        self.__set_sys_cmd__()
        self.__version__()

        print(f"[OS] Running on {self.os}");
        if self.pub_get:
            self.exec_("flutter pub get")
    
    
    def usage(self):
        print(f"Usage: {self.args[0]} [OPTIONS HERE]")
        print("""
        OPTIONS LIST :
        
        --version                   : Get version.
        --release                   : Build release for Android / IOS (for now only appbundle supported)
        --release-stage             : Build a release version out of staging.
        --pub=[default=false]       : if set to true , it will perfome Flutter pub get.
        --app=[default=taxi]        : Default StartingPoint , since we have more than app to start with.
        --web=[default=false]       : if Set to true , it will be built for Web.
        --lan=[default=false]       : if set to true , it the flutter APP will connect to this Machine's IP address on LAN.
                |
                |_ if building for mobile:
                    |_ make sure this is set to true.
                    |_ and your Server is exposed / accessible to network (0.0.0.0:PORT) 

        --db=[default=production]   : The database passed to cloud functions , default is production.
        --lmode=[default=dev]        : can be > prod|stage
        """);

    def __get_release_files__(self , ios , android):
        if (ios or android) == False:
            print("[!] Error - Could not get the builds right :( ")
            exit(-1)

        if ios:
            self.cmds['copy'](self.ios_build_path , self.build_output_dir)
        if android:
            print("[+] Built the android Version successfully !")
            self.cmds['copy']( self.android_build_path(), self.build_output_dir)


    def Launch(self):
        try:

            self.__errors_tracker__()

            self.__pre_launch_process__()
            self.__checks__()
            _web        = "-d chrome " if self.web else ""
            _lanhost    = f" --dart-define={self._ip_dart_define}={self.get_lan_ip()} " if self.lanhost else ""
            # _lanhost    = f" --dart-define={self._ip_dart_define}=http://192.168.1.24 " if self.lanhost else ""
            __dec_ip__  =  self.get_lan_ip()

            if self.lanhost and not __dec_ip__.startswith('http://192'):
                raise Exception("[EXCEPTION] --lan is set to true , but got invalid LAN IP address !\n\t|_ Try to `vim /etc/hosts` and comment line : [127.0.0.1 `your_host_name`] ?")

            print(f'[IP] {self.get_lan_ip() if _lanhost.__len__() > 0 else "http://127.0.0.1"}')
            print(f"[DB] Using {self.db} Database");
            print(f"[LM] Launching on {self.launch_mode} Mode.\n");
            self.__exec__(f"flutter run {_web}--dart-define={self._sp_dart_define}={self.app} --dart-define={self._lmode_dart_define}={self.launch_mode} --dart-define={self._db_dart_define}={self.db}{_lanhost}")
        except KeyboardInterrupt:
            print("\nExiting ... done !")
        except Exception as ex:
            print(f"\n[!] Exception happend :  {ex.__str__()}" , end='')
            print(f"\n\t|__ Line :  {ex.__traceback__.tb_lineno} ", end='')
            self.TraceBack(ex.__traceback__.tb_next)
            print('\n')


    def TraceBack(self, tb_next):
        if tb_next:
            print(f"-> {tb_next.tb_lineno} ")
            return self.TraceBack(tb_next.tb_next)
        else:
            return ""

    def __checks__(self):
        if '--help' in self.args:
            self.usage()
            exit(1)

        elif '--version' in self.args:
            self.__version__()
            exit(2)

        elif '--release' in self.args:
            self.__exec__("flutter build appbundle")
            __android__ = False #__get_release_files__
            __ios__     = False 

            # Android
            if __import__('os').path.exists(self.android_build_path()):
                __android__ = True
            
            print("[-] Can't build IOS for now !")
            # IOS
            # if __import__('os').path.exists(self.ios_build_path):
            #     __ios__     = True 

            self.__get_release_files__(__ios__ , __android__)
            exit(-1)


        if(self.args.__len__() == 1):
            return 
        else:
            for arg in self.args[1:]:
                if arg.startswith('--app='):
                    self.app=arg.split('=')[1]
                elif arg.startswith('--web='):
                    self.web = True if arg.split('=')[1] == "true" else False
                elif arg.startswith('--lan='):
                    self.lanhost = True if arg.split('=')[1] == "true" else False
                elif arg.startswith('--db='):
                    self.db      =  arg.split('=')[1]
                elif arg.startswith('--pub='):
                    self.pub_get =  True if arg.split('=')[1] == "true" else False
                elif arg.startswith('--lmode='):
                    self.launch_mode = arg.split('=')[1]

                else:
                    print(f"Invalid Argument : {arg}\n")
                    self.usage()
                    exit(1)

            # Simple NAND to make sure everything in place !
            if not (self.web & self.lanhost):
                return
            else:
                print("[!] Err > Building for web means --lan=false !")
                ans = input("Would you like to fix it ? y/n > ")
                if ans == "y":
                    self.lanhost = not self.lanhost
                    return
                else:
                    exit(-1)


Launcher(argv)
