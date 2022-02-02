#!/usr/bin/env python3

import os , json
from sys import argv, stderr, platform
from enum import Enum
import subprocess as proc
from termcolor import colored

# LAST UPDATE INFOS : 
# ADDED A FIX FOR  warning: The iOS Simulator deployment target 'IPHONEOS_DEPLOYMENT_TARGET' is set to 8.0, but the range of supported deployment target versions is 9.0 to 14.5.99. (in target 'leveldb-library' from project 'Pods'


# GLOBAL CONSTANTS !
VERSION = "1.0.11"
XOR_VALUE = 100
CONFIG_FILE = "config.json"
ACTIVE_DEBUG = True
PRINTLN = lambda x : print(x) if ACTIVE_DEBUG else None

VALID_CONFIG_KEYS_LEN = 2
rm_lambda = lambda path : 'rm -rf {path}*'
# POSSIBLE_LMODES = [
#     'stage',
#     'dev',
#     'prod'
# ]

class OUTPUT_FILTERS(Enum):
    SHOW = 0
    HIDE = 1

class DW_EXIT_REASONS(Enum):
    NORMAL = 0
    WRONG_ARG = -1
    CONFIG_FILE_NOT_FOUND = -2
    APP_PATH_NOT_FOUND = -3
    APP_DB_NOT_FOUND = -4
    APP_LMODE_NOT_FOUND = -5
    WONG_BUILD_TYPE = -6
    CONF_FILE_KEYS_LEN_WRONG = -7
    CONF_FILE_KEYS_VALUES_WRONG = -8
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
    WRONG_ENV_USED = -26
    PLATFORM_NOT_SUPPORTED_YET = -27
    BUILDING_LMODE_DB_NOT_SUPPORTED_YET = -28
    WRONG_VERSION_GIVEN = -29
    PUBSPECT_YAML_NOT_FOUND = -30
    LOCAL_PROPERTIES_NOT_FOUND = -31
    FOUND_MULTI_VERSIONS_IN_PUBSPEC_YAML = -32
    FOUND_MULTI_VERSION_NAME_IN_LOCAL_PROPERTIES = -33
    FOUND_MULTI_VERSION_CODE_IN_LOCAL_PROPERTIES = -34
    LAUNCH_PROC_WITH_NONE_BINARY = -35
    FILTER_FILE_NOT_FOUND = -36
    FLUTTER_STDERR = -37
    NO_APP_SPECIFIED = -38

    REACH_THE_LAZY_SAAD = -10000

class Launcher:
    def __init__(self , user_args , conf) -> None:
        self.user_args = user_args
        self.conf = conf
        # self.last_app = Config.chSum(user_args['app'])
        self.__launch__()
        try:
            PRINTLN(f"\n[~] Launching with : {user_args} \n\n")
            f_args = self.flutter_setup.split(' ')
            ff = None
            fmd = OUTPUT_FILTERS.SHOW

            # filter file
            if 'filter' in self.user_args.keys():
                ff = self.user_args['filter']

                # filter mode
                if 'fmode' in self.user_args.keys():
                    if self.user_args['fmode'] == "hide":
                        fmd = OUTPUT_FILTERS.HIDE

            binary = ['flutter' , 'run', '-t', 'lib/'+user_args['app']+'/main.dart']
            binary.extend(f_args)

            Config.launch_flutter_app(binary=binary , filter_file=ff , filter_mode=fmd)
        except KeyboardInterrupt:
            print("Exiting the launcher .... bye bye!")
    
    # def __f_checker__(self):
    #     if not os.path.exists('flutter_hooks/pre-main'):
    #         PRINTLN("[!] Error - No pre-main file neither in launcher files or flutter files !")
    #         exit(DW_EXIT_REASONS.ROOT_MAIN_DART_FILE_NOT_FOUND)
        
    #     PRINTLN("[+] No ../lib/pre-main.dart found .. generating a new one !")
        
    #     prem = open('flutter_hooks/pre-main' , encoding='utf-8' , errors='ignore').read()
    #     open('../lib/pre-main.dart' , 'w+').write(prem) 

    def __patcher__(self):
        # PRINTLN("[+] Patching ../lib/pre-main.dart !")
        # f_root_main = open('../lib/pre-main.dart' , encoding='utf-8' , errors='ignore').read()
        self.user_args['lmode']
 
        # Writing new Valid App.
        # open('../lib/pre-main.dart' , 'w+').write(f_root_main)
        # PRINTLN("[+] Pacthed ../lib/pre-main.dart successfully !")

        # Writing Valid launcher.xml
        _launcherXmlFile = self.conf['settings']['launcher.xml']
        _outputAppName = self.conf['apps'][self.user_args['app']]['packages'][self.user_args['lmode']]['appName'];
        _appPackageName = self.conf['apps'][self.user_args['app']]['packages'][self.user_args['lmode']]['packageName'];

        PRINTLN(f"[+] Android:Label => {_outputAppName} .")
        PRINTLN(f"[+] Package:Name  => {_appPackageName} .")

        _launcherXml = f'''<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="appName">{_outputAppName}</string>
    <string name="packageName">{_appPackageName}</string>
</resources>'''
        
        open(_launcherXmlFile , 'w+').write(_launcherXml)
        PRINTLN(f"[+] Patched launcher.xml !")

        # writing Valid launcherPackage.properties
        _launcherPackagePropertiesFile = self.conf['settings']['launcherPackageProperties']
        _launcherPackageProperties = f"package.name={_appPackageName}"
        open(_launcherPackagePropertiesFile , 'w+').write(_launcherPackageProperties)
        PRINTLN(f"[+] Patched launcherPackage.properties !")
        
        # Android ----
        # Saad : Be careful while changing this guys.
        # Handling the kotlin - package importing problem !
        dot_separated_package_name = _appPackageName.split('.')
        project_kotlin_folder = "../android/app/src/main/kotlin/"
        main_activity_kt_path = project_kotlin_folder+'/'.join(dot_separated_package_name)+'/'+'MainActivity.kt'

        # if condition to pass this process!
        if not os.path.exists(os.path.dirname(main_activity_kt_path)):
            rm_lambda(project_kotlin_folder) # this will delete the tree starting with com folder.
            # then we create our own correct tree:
            os.makedirs(os.path.dirname(main_activity_kt_path), exist_ok=True)
            # then we write our correct Activity.kt
            _cloned = open('patches/android/MainActivity.kt').read().replace('<mez-package-name>', _appPackageName)
            open(main_activity_kt_path , 'w+').write(_cloned)
            PRINTLN(f"[+] Set up of : {main_activity_kt_path} .. done!")

        #  main ManifestXml:
        _project_main_manifest = "../android/app/src/main/AndroidManifest.xml"
        os.system('mv ../android/app/src/main/AndroidManifest.xml ../android/app/src/main/AndroidManifest.xml.backup')
        _cloned = open('patches/android/main/AndroidManifest.xml').read().replace('<mez-package-name>', _appPackageName)
        open(_project_main_manifest , 'w+').write(_cloned)

        # profile :
        _project_profile_manifest = "../android/app/src/profile/AndroidManifest.xml"
        if not os.path.exists(os.path.dirname(_project_profile_manifest)):
            os.mkdir(os.path.dirname(_project_profile_manifest))
        
        if os.path.exists(_project_profile_manifest):
            os.system('mv ../android/app/src/profile/AndroidManifest.xml ../android/app/src/profile/AndroidManifest.xml.backup')
        
        _cloned = open('patches/android/profile/AndroidManifest.xml').read().replace('<mez-package-name>', _appPackageName)
        open(_project_profile_manifest , 'w+').write(_cloned)


        # debug:
        _project_debug_manifest = "../android/app/src/debug/AndroidManifest.xml"
        
        if not os.path.exists(os.path.dirname(_project_debug_manifest)):
            os.mkdir(os.path.dirname(_project_debug_manifest))
        
        if os.path.exists(_project_debug_manifest):
            os.system('mv ../android/app/src/debug/AndroidManifest.xml ../android/app/src/debug/AndroidManifest.xml.backup')
        
        _cloned = open('patches/android/debug/AndroidManifest.xml').read().replace('<mez-package-name>', _appPackageName)
        open(_project_debug_manifest , 'w+').write(_cloned)
        
        # Done !
        PRINTLN("[+] Patched and Backed-up all ../android/app/src/<mode>/AndroidManifest.xml just in case ..!")


        # IOS ----
        # TODO : Handle Versioning !
        # Patching info.plist & project.pbxproj for IOS!
        _ios_app_folder_name = self.user_args["app"].lower().replace("app" , "")

        _project_pbxproj_path = "../ios/Runner.xcodeproj/project.pbxproj"
        _info_plist_path = "../ios/Runner/Info.plist"
        _cloned = open('patches/ios/project.pbxproj').read().replace('<mez-package>', _appPackageName).replace('<mez-app-type>' , _ios_app_folder_name)
        open(_project_pbxproj_path , 'w+').write(_cloned)
        PRINTLN(f"[+] Patched ios/project.pbxproj => {_appPackageName}")
        _cloned = open(f'patches/ios/{_ios_app_folder_name}/Info.plist').read().replace('<mez-output-name>', _outputAppName).replace('<mez-app-type>' , _ios_app_folder_name)
        open(_info_plist_path , 'w+').write(_cloned)
        PRINTLN(f"[+] Patched ios/Runner/Info.plist => {_outputAppName}!")
	    # Getting rid of 8.0
        if os.path.exists('../ios/Pods/Pods.xcodeproj/project.pbxproj'):
            _pods_xcodeproj_project_pbxproj = open('../ios/Pods/Pods.xcodeproj/project.pbxproj').read()
            open('../ios/Pods/Pods.xcodeproj/project.pbxproj', 'w+').write(_pods_xcodeproj_project_pbxproj.replace('IPHONEOS_DEPLOYMENT_TARGET = 8.0', 'IPHONEOS_DEPLOYMENT_TARGET = 9.0'))
            PRINTLN('[+] UPDATED IPHONEOS_DEPLOYMENT_TARGET => 9.0')
            
    def __patch_gs__(self):
        '''If its staging mode Patch the Gpoogle-services.json'''
        # Project's Services files
        android_flutter_gs_path = self.conf['settings']['appGoogleServices']
        ios_flutter_gs_path = self.conf['settings']['appAppleServices']
        # launcher Services files
        _launcher_google_services = self.conf['apps'][self.user_args['app']]['packages'][self.user_args['lmode']]['googe-service-file']
        _launcher_apple_services = self.conf['apps'][self.user_args['app']]['packages'][self.user_args['lmode']]['apple-service-file']
      
        copied_ios = False
        copied_android = False

        # Android
        if not os.path.exists(_launcher_google_services):
            exit(DW_EXIT_REASONS.GOOGLE_SERVICES_JSON_NOT_IN_LAUNCHER_FILES)
        if not os.path.exists(android_flutter_gs_path):
            # if not there we copy the one from launcher and save it under android_flutter_gs_path
            PRINTLN("[!] Generating google-services.json!")
            open(android_flutter_gs_path , 'w+').write(open(_launcher_google_services , encoding='utf-8' , errors='ignore').read())
            copied_android = True
        # ios
        if not os.path.exists(_launcher_apple_services):
            exit(DW_EXIT_REASONS.PLIST_GOOGLE_SERVICES_JSON_NOT_IN_LAUNCHER_FILES)
        if not os.path.exists(ios_flutter_gs_path):
            # exit(DW_EXIT_REASONS.PLIST_GOOGLE_SERVICES_JSON_NOT_IN_IOS_APP_FOLDER)
            PRINTLN("[!] Generating GoogleService-Info.plist !")
            open(ios_flutter_gs_path , 'w+').write(open(_launcher_apple_services, encoding='utf-8' , errors='ignore').read())
            copied_ios = True
        
        # loading up json_client
        json_client = json.loads(open(_launcher_google_services).read())
        
        # if - elif - else
        if self.user_args['lmode'] == 'stage':
            PRINTLN("[+] Launching on Staging mode - Patching gServices ...!")   
        
        PRINTLN(f"[+] Applying Client's Package :{json_client['client'][0]['client_info']['android_client_info']}")
        
        # Last phase , which is writing if everything is loaded correctly !
        if not copied_android:
            open(android_flutter_gs_path , 'w+').write(json.dumps(json_client))
        if not copied_ios:
            open(ios_flutter_gs_path , 'w+').write(open(_launcher_apple_services).read())


    def __set_flutter_args__(self):
        global _previewDartDefine
        if self.user_args['preview'] == True:
            _previewDartDefine = " --dart-define=PREVIEW=True"
        else:
            _previewDartDefine = ""



        self.flutter_setup = f"--dart-define=APP_SP={self.user_args['app']} --dart-define=HOST={self.user_args['host']} --dart-define=LMODE={self.user_args['lmode']}{_previewDartDefine}"
    
    def __build_temp(self):
        # TODO : Auto versioning checks.
        isVerbose = "--verbose" if self.user_args['verbose'] else ""
        if not self.user_args['lmode']:
            PRINTLN("In order to build you have to specify env=<stage, dev, prod>")
            exit(DW_EXIT_REASONS.WRONG_ENV_USED)
        elif not self.user_args['app'] :
            PRINTLN("In order to build you have to specify app=<appName>")
            exit(DW_EXIT_REASONS.NO_APP_SPECIFIED)

        if self.user_args['build'] == 'ios' :
            os.system(f'flutter build ipa --target lib/{self.user_args["app"]}/main.dart {isVerbose}')
        else:
            os.system(f'flutter build {self.user_args["build"]} -t lib/{self.user_args["app"]}/main.dart {isVerbose}')

    def __launch__(self):
        # self.__f_checker__()
        
        self.__patcher__()
        self.__patch_gs__()
        if 'build' in self.user_args.keys():
            PRINTLN(f"[+] Building the app::{self.user_args['build']} for you ...")
            self.__build_temp()
            exit(DW_EXIT_REASONS.NORMAL)

        self.__set_flutter_args__()
class Config:
    
    possible_args = ['--fix-pods', '--verbose' , 'help', 'app' , 'env' , 'version', 'filter', 'fmode', '--build', '--lan', '--preview' , '--set-version']
    def __help__(self):
        print(f""" 
        + app=<AppName>
        + env=<Environment>
        + filter=<FileName.filter>  : just pass the filter file name you created under output_filters.
        + fmode=<filter_mode> : Default is 'show' , can be 'hide' depend on how you want to use the filter file!
        + --build=<type> : to order the launcher to build where type is [apk, appbundle, ios] , requires app=<app> and env=<env>.
        + --lan : in case you want to launch to another device connected to the same network.
        + --preview : Passing this along , will result on launching the app in the device-preview for testing an try many resolutions.
        + --set-version=<version> : Used to set the project's version to a specific version , this will set the version and quit.
       	+ --fix-pods : Special cmd for MAC M1 , meant for fixing pod problems on IOS.
	+ help : show this help menu
     
        === only in build ===
        + version=<version> : example : 1.0.15+11

        PS : if an Error happend Send DW_EXIT_REASON.<NAME>.
        """)
    
    @staticmethod
    def launch_flutter_app(binary , filter_file=None, filter_mode=OUTPUT_FILTERS.SHOW):
        PRINTLN(f"\n[~] binary has : {binary} \n\n")
        ff = []
        start_filtering = 0
        if binary != None:
            if filter_file != None:
                if os.path.exists(f"output_filters/{filter_file}"):
                    ff = open(f"output_filters/{filter_file}").readlines()
                    PRINTLN(f"[+] Using {filter_mode} on {ff.__len__()} filters specified in => output_filters/{filter_file}")
                    with proc.Popen(binary, stderr=stderr , stdout=proc.PIPE, universal_newlines=True) as p:
                        for line in p.stdout:
                            if start_filtering >= 2:
                                if len(line) <= 2:
                                    print(line)
                                else:
                                    for f in ff:
                                        if f.strip() in line and filter_mode == OUTPUT_FILTERS.SHOW:
                                            print(line , end="")
                            else:

                                if "The Flutter DevTools debugger" in line:
                                    print(line)
                                    start_filtering += 1
                                else:
                                    if(start_filtering == 1):
                                        start_filtering += 1
                                    print(line , end="")
                else:
                    PRINTLN(f"[!] Error there is no such filter file in output_filters/{filter_file} !")
                    exit(DW_EXIT_REASONS.FILTER_FILE_NOT_FOUND)
            else:
                
                os.system(' '.join(binary))
        else:
            PRINTLN("[!] Error happend in calling launch_flutter_app with null binary :( ")
            exit(DW_EXIT_REASONS.LAUNCH_PROC_WITH_NONE_BINARY)

    # @staticmethod
    # def chSum(app , isLaunch=True):
    #     last_ch_sum = "flutter_hooks/" + ("launch" if isLaunch else "build") + "/.chsum"
    #     f = open(last_ch_sum , 'r+').read().replace('\n' , '')
        
    #     PRINTLN(f"[+] Generating new checkSum for __app__[{app}]")
    #     fp = open(last_ch_sum , 'w+')
    #     fp.write(app)
    #     fp.close()
    #     # return last app
    #     return f

        # last_ch_sum = "flutter_hooks/" + ("launch" if isLaunch else "build") + "/.chsum"
        # f = open(last_ch_sum , 'r+').read().replace('\n' , '')
        # if not f or f != app:
        #     PRINTLN(f"[+] Generating new checkSum for __app__[{app}]")
        #     fp = open(last_ch_sum , 'w+')
        #     fp.write(app)
        #     fp.close()
        #     # return last app
        #     return f
        # else: 
        #     PRINTLN(f"[+] Detected Same checkSum for __app__[{app}] , Skipping Generation !")
        #     return None

    def __preinit__(self):
        if not os.path.exists(CONFIG_FILE):
            PRINTLN(f"[!] Configuration file {CONFIG_FILE} not found !")
            exit(DW_EXIT_REASONS.CONFIG_FILE_NOT_FOUND)
        else : 
            self.conf = json.loads(open(CONFIG_FILE).read())
            PRINTLN(f"[+] Loaded {CONFIG_FILE}")
        
        # check validity of build conf
        if self.conf.__len__() != VALID_CONFIG_KEYS_LEN:
            exit(DW_EXIT_REASONS.CONF_FILE_KEYS_LEN_WRONG)
        else:
            # we checkk the validity of the rest of confs !
            if 'settings' not in self.conf.keys() or 'apps' not in self.conf.keys():
                exit(DW_EXIT_REASONS.CONF_FILE_KEYS_VALUES_WRONG)

            # # Build first !
            # for k in self.conf['build']:
            #     _ = self.conf['build'][k]
            #     if 'database' not in _ or 'launchMode' not in _ or 'path' not in _:
            #         exit(DW_EXIT_REASONS.CONF_FILE_APP_VALUES_WRONG)
            #     else:
            #         # null checks 
            #         if _['database'] == None or _['database'] == "":
            #             exit(DW_EXIT_REASONS.CONF_FILE_APP_DB_EMPTY)
            #         if _['path'] == None or _['path'] == "":
            #             exit(DW_EXIT_REASONS.CONF_FILE_APP_PATH_EMPTY)
            #         if _['launchMode'] == None or _['launchMode'] == "":
            #             exit(DW_EXIT_REASONS.CONF_FILE_APP_LMODE_EMPTY)
                    
            # PRINTLN("[+] Config file validated !")
    

    def __patch_version__(self, v):
        '''v=Version , Patch the version!'''
        PRINTLN("------------------- [ VERSION PATCHING ] -------------------")
        __v = v.split('+')

        import re
        if re.match(r'^([1-9]+)\.[0-9]+\.[0-9]+\+[1-9]+$' , v) == None and __v.__len__() != 2:
            PRINTLN(f"[!] Error -> Incorrect Version {v} , type launcher.py help!")
            exit(DW_EXIT_REASONS.WRONG_VERSION_GIVEN)
        pubspec = self.conf['settings']['pubspec.yaml']
        localProperties = self.conf['settings']['local.properties']
        if not os.path.exists(pubspec):
            PRINTLN(f'[!] config.json::{pubspec} not found !')
            exit(DW_EXIT_REASONS.PUBSPECT_YAML_NOT_FOUND)
        if not os.path.exists(localProperties):
            PRINTLN(f'[!] config.json::{localProperties} not found !')
            exit(DW_EXIT_REASONS.LOCAL_PROPERTIES_NOT_FOUND)
        
        _pubspec = open(pubspec , errors='ignore' , encoding='utf-8').readlines()
        _localProperties = open(localProperties , errors='ignore' , encoding='utf-8').readlines()

        # pubspect regex check:
        # ex : version: 1.0.4+8

        _res = [i for i,line in enumerate(_pubspec) if re.match(r'version {0,}: {0,}[0-9]+\.[0-9]+\.[0-9]+\+[0-9]+' , line ) != None]
        if _res.__len__() > 1:
            PRINTLN(f"[?] Found multi version ddffinition in {pubspec} at lines : {[x for x in _res]} ")
            exit(DW_EXIT_REASONS.FOUND_MULTI_VERSIONS_IN_PUBSPEC_YAML)

        
        _res  = _res[0]
        print(f"[+] pubspec.yaml :\n\t|_ old_version = {_pubspec[_res].strip()}\n\t|_ new_applied_version = {v}")
        _pubspec[_res] = f"version: {v}\n"
        open(pubspec , 'w+').write(''.join(_pubspec))
        PRINTLN("[+] Checked and Patched pubspec.yaml successfully !")

        # local.properties regex check:
        # ex : 
        # flutter.versionName=1.0.4
        # flutter.versionCode=8

        _versionName = [i for i,line in enumerate(_localProperties) if re.match(r' {0,}flutter\.versionName {0,}= {0,}[0-9]+\.[0-9]+\.[0-9]+' , line ) != None]
        _versionCode = [i for i,line in enumerate(_localProperties) if re.match(r' {0,}flutter\.versionCode {0,}= {0,}[0-9]+' , line ) != None]
        

        if _versionName.__len__() > 1 :
            PRINTLN(f"[?] Found multi version ddffinition in {_localProperties} at lines : {[x for x in _versionName]} ")
            exit(DW_EXIT_REASONS.FOUND_MULTI_VERSION_NAME_IN_LOCAL_PROPERTIES)
        if _versionCode.__len__() > 1 :
            PRINTLN(f"[?] Found multi version ddffinition in {_localProperties} at lines : {[x for x in _versionCode]} ")
            exit(DW_EXIT_REASONS.FOUND_MULTI_VERSION_CODE_IN_LOCAL_PROPERTIES)

        _versionName  = _versionName[0]
        _versionCode  = _versionCode[0]

        print(f"[+] local.properties :\n\t|_ old_version :\n\t|\t|__ {_localProperties[_versionName].strip()}\n\t|\t|__ {_localProperties[_versionCode].strip()}\n\t|_ new_applied_version = {v}")
        
        _localProperties[_versionName] = f"flutter.versionName={__v[0]}\n"
        _localProperties[_versionCode] = f"flutter.versionCode={__v[-1]}\n"
        
        open(localProperties , 'w+').write(''.join(_localProperties))
        PRINTLN("[+] Checked and Patched local.properties successfully !")

        PRINTLN("------------------- [ VERSION PATCHING] -------------------")

    def __check_args_validity__(self):
        try:
            for a in self.args[1:] :
                _a = a.split('=')[0]
                if _a not in self.possible_args:
                    PRINTLN(f"[!] Error : Wrong Argument was passed < {_a} >.\n")
                    exit(DW_EXIT_REASONS.WRONG_ARG)
        except Exception as e:
            PRINTLN(e)

        
    def __init__(self , args) -> None:
        print(f"\n- MezLauncher v{VERSION}\n")
        global rm_lambda
        if platform.startswith('win'):
            # cuz CMD is dumb xd
            rm_lambda = lambda path : f'del {path}'# && rd {path}

        self.args = args
        self.__check_args_validity__()
        
        if 'help' in args:
            self.__help__()
            exit(DW_EXIT_REASONS.NORMAL)
        
        
            
        self.user_args = {}
        self.__preinit__()
        self.__checker__(args) # dict

        if self.user_args['pymode'] == "launch":
            # it's a launch operation !
            Launcher(self.user_args , self.conf)

        # elif self.user_args['pymode'] == "build":
        #     # it's a build operation !
        #     Builder(self.user_args , self.conf['build'])
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
        _ = self.__get_arg_value__('--set-version=')
        if _:
            self.__patch_version__(_)
            exit(DW_EXIT_REASONS.NORMAL)
                # Cmd to fix Pods Problems
        _ = self.__get_arg_value__('--fix-pods')
        if _:
            if input('This is only for MAC M1 chips ! Continue : y/n ?') == 'y':
                print("[+] Clearing cache and Removing lock files ..")
                os.system('rm -rf ../ios/Pods & rm ../ios/Podfile.lock & rm -rf ../ios/.symlinks & rm ../ios/Flutter/Flutter.podspec & rm ../pubspec.lock')
                if not os.path.exists('../ios/Podfile'):
                    os.system('flutter pub get')
                
                pod_lines =  open('../ios/Podfile' , 'r').readlines()
                patch_line_index = None
                print("[+] Checking Podfile ..")

                for index , line in enumerate(pod_lines):
                    #print(line)
                    if 'platform :ios,' in line:
                        patch_line_index = index
                        #exit()
                # min required now is 10.0
                if patch_line_index != None:
                    print("[+] Fixing Podfile ..")
                    pod_lines[patch_line_index] = "platform :ios, '13.0'"
                open('../ios/Podfile' , 'w+').write('\n'.join(pod_lines))    
                print("[+] Installing Pods ..")
                os.system('cd .. && flutter pub get && cd ios && arch -x86_64 pod install && cd ../launcher')
            print("\n+ Done !")
            exit(DW_EXIT_REASONS.NORMAL)

	# Checking pymode
        if '--build' in args:
            self.user_args['pymode'] = "build"
        else: self.user_args['pymode'] = "launch"
        
        _ = self.__get_arg_value__('filter=')
        _fm = self.__get_arg_value__('fmode=')
        if _:
            self.user_args['filter'] = _
            if _fm :
                self.user_args['fmode']  = _fm
        else:
            self.user_args['filter'] = "mez_dbg_print.filter"
        
        # if launch with verbose
        if '--verbose' in args:
            self.user_args['verbose'] = True
        else : 
            self.user_args['verbose'] = False

        # preview mode !
        if '--preview' in args:
            self.user_args['preview'] = True
        else :
            self.user_args['preview'] = False

        # in case of a launch and run in lan :
        if self.user_args['pymode'] == "launch":
            self.user_args['host'] = "http://"+("127.0.0.1" if '--lan' not in args else self.__get_actual_lan_ip())

        # Checking App
        _ = self.__get_arg_value__('app=')

        if _ :
            if _ not in self.conf['apps'].keys():
                PRINTLN(self.conf['apps'].keys())
                PRINTLN(f'[!] app={_} : Error This app is wrong !')
                exit(DW_EXIT_REASONS.CONF_FILE_APPNAME_WRONG)
            self.user_args['app'] = _
        else:
           PRINTLN("No app specified !")
           exit(DW_EXIT_REASONS.NO_APP_SPECIFIED)

        # if using globals from json jump lmode and db checks
        _ = self.__get_arg_value__('env=')
        if _ not in self.conf['settings']['envs'].keys():
            PRINTLN(f'[!] env={_} : Invalid environment used !')
            exit(DW_EXIT_REASONS.WRONG_ENV_USED)

        self.user_args['lmode'] = self.__get_arg_value__('env=')
        # if _:
        #     if _ not in self.conf['settings']['envs'].keys():
        #         PRINTLN(f'[!] env={_} : Invalid environment used !')
        #         exit(DW_EXIT_REASONS.WRONG_ENV_USED)

        #      = self.conf['settings']['envs'][_]['lmode']

        #     # check if lmode was tampered
        #     if self.user_args['lmode'] not in POSSIBLE_LMODES:
        #         PRINTLN(f'[!] lmode={self.user_args["lmode"]} : Error This launch mode is wrong !')
        #         exit(DW_EXIT_REASONS.CONF_FILE_LMODENAME_WRONG)

        
        #     PRINTLN(f"[+] You are using globals::{_} with :")
        #     PRINTLN(f"\t\t|_ Lmode => {self.user_args['lmode']}")

        # Else get default lmode / db if not given by user.
        # else:
        #     self.user_args['lmode'] = DEFAULTS['LMODE']
            # _ = self.__get_arg_value__('lmode=')
            # if _:
            #     if _ not in POSSIBLE_LMODES:
            #         PRINTLN(f'[!] lmode={_} : Error This launch mode is wrong !')
            #         exit(DW_EXIT_REASONS.CONF_FILE_LMODENAME_WRONG)

            #     self.user_args['lmode'] = _
            # else:
            #     self.user_args['lmode'] = self.conf[self.user_args['pymode']][self.user_args['app']]['launchMode']

            # _ = self.__get_arg_value__('db=')
            # if _:
            #     if _ not in POSSIBLE_DBS:
            #         PRINTLN(f'[!] db={_} : Error This database is wrong !')
            #         exit(DW_EXIT_REASONS.CONF_FILE_DBNAME_WRONG)
            #     self.user_args['db'] = _
            # else:
            #     self.user_args['db'] = self.conf[self.user_args['pymode']][self.user_args['app']]['database']
        
        # THIS IS LAUNCHER BASED BUILD
        # TODO : Implement that using class:Builder
        _ = self.__get_arg_value__('--build=')
        if _:
            if str(_).lower() not in ['apk' , 'appbundle' , 'ios']:
                PRINTLN(f'[!] --build={_} : Error Platform unsupported yet!')
                exit(DW_EXIT_REASONS.PLATFORM_NOT_SUPPORTED_YET)

            # this is to force building with the  lmode::stage & db::test cuz that's the defaultValue Sat in flutterApp
            # This is why i marked TODO above.

            # if self.user_args['lmode'] != 'stage' and self.user_args['db'] != 'test':
            #     PRINTLN(f'[!] --build={_} : Error - One of Lmode::{self.user_args["lmode"]} | Db::{self.user_args["db"] } not supported yet!')
            #     exit(DW_EXIT_REASONS.BUILDING_LMODE_DB_NOT_SUPPORTED_YET)
            # r = input("[!] Did you change the defaultLaunchMode and defaultDb in global.dart to the right ones ? y/n : ")
            # if r.lower() != 'y':
            #     exit(DW_EXIT_REASONS.NORMAL)

            v_ = self.__get_arg_value__('version=')
            if v_:
                self.__patch_version__(v_)

            self.user_args['build'] = _

   

if __name__ == "__main__":
    Config(argv)
    exit(DW_EXIT_REASONS.NORMAL)
