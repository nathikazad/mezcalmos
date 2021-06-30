#!/usr/bin/python3

_VERSION_       = "1.0.1 - 30/06/2021 08:39:39"

from sys import argv , platform, winver
import socket

exec_           = lambda c:__import__("os").system(c)
get_lan_ip      = lambda: f"http://{socket.gethostbyname(socket.gethostname())}"
lanhost         = False
app             = "taxi"
web             = False
db              = 'production'
os              = "Windows OS"
pub_get         = False

# Default NT (win) #################
_clear_ = "cls"
####################################

def get_os():
    if not platform.startswith('win') and platform != 'nt':
        os = f"{platform} based OS!"
        _clear_ = "clear"


def __version__():
    print(f"[VS] Version - {_VERSION_}")

def pre_launch_process():
    get_os()
    __version__()
    print(f"[OS] Running on {os}");
    if pub_get:
        exec_("flutter pub get")
    
    
def Usage():
    print(f"Usage: {argv[0]} [OPTIONS HERE]")
    print("""
    OPTIONS LIST :
    
    --version                   : Get version.
    --pub=[default=false]       : if set to true , it will perfome Flutter pub get.
    --app=[default=taxi]        : Default StartingPoint , since we have more than app to start with.
    --web=[default=false]       : if Set to true , it will be built for Web.
    --lan=[default=false]       : if set to true , it the flutter APP will connect to this Machine's IP address on LAN.
            |
            |_ if building for mobile:
                |_ make sure this is set to true.
                |_ and your Server is exposed / accessible to network (0.0.0.0:PORT) 

    --db=[default=production]   : The database passed to cloud functions , default is production.
    """);

def Launch():
    pre_launch_process()
    _web        = "-d chrome " if web else ""
    _lanhost    = f" --dart-define=HOST={get_lan_ip()} " if lanhost else ""

    print(f'[IP] {get_lan_ip() if _lanhost.__len__() > 0 else "http://127.0.0.1"}')
    print(f"[DB] Using {db} Database\n");
    exec_(f"flutter run {_web}--dart-define=APP_SP={app}  --dart-define=DB={db}{_lanhost}")

if('--help' in argv):
    Usage()
    exit(1)

elif('--version' in argv):
    __version__()
    exit(2)
# exec_(_clear_)

try:
    if(argv.__len__() == 1):
        Launch()
    else:
        for arg in argv[1:]:
            if arg.startswith('--app='):
                app=arg.split('=')[1]
            
            elif arg.startswith('--web='):
                web = True if arg.split('=')[1] == "true" else False
            
            elif arg.startswith('--lan='):
                lanhost = True if arg.split('=')[1] == "true" else False
            elif arg.startswith('--db='):
                db      =  arg.split('=')[1]
            elif arg.startswith('--pub='):
                pub_get =  True if arg.split('=')[1] == "true" else False
            else:
                print(f"Invalid Argument : {arg}\n")
                Usage()
                exit(1)

        # Simple NAND to make sure everything in place !
        if not (web & lanhost):
            Launch()
        else:
            print("[!] Err > Building for web means --lan=false !")
            ans = input("Would you like to fix it ? y/n > ")
            if ans == "y":
                lanhost = not lanhost
                Launch()
            else:
                exit(-1)
except KeyboardInterrupt:
    print("\nExiting ... done !")


