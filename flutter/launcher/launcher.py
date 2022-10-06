#!/usr/bin/env python3

from ast import Str
from dataclasses import replace
import os , json
from sys import argv, stderr, platform
from enum import Enum
import subprocess as proc
import sys
from time import sleep
# from turtle import goto
from typing import Type
 
# GLOBAL CONSTANTS !
VERSION = "1.1.14"
XOR_VALUE = 100
CONFIG_FILE = "config.json"
ACTIVE_DEBUG = True
PRINTLN = lambda x,end='\n' : print(x , end=end) if ACTIVE_DEBUG else None

VALID_CONFIG_KEYS_LEN = 2
rm_lambda = lambda path : f'rm -rf {path}*'


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
    INVALID_PERMISSION_LEN_OR_NULL = -39
    ENV_VAR_NOT_FOUND = -40
    REACH_THE_LAZY_SAAD = -10000

class Launcher:
    def __init__(self , user_args , conf , isWindows=False) -> None:
        self.user_args = user_args
        self.conf = conf
        self.isWin = isWindows
        self.pathname_separator = '/' if not self.isWin else '\\'
        # self.last_app = Config.chSum(user_args['app'])
        try:
            self.__launch__()
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

            binary = ['flutter.bat' if self.isWin else 'flutter' , 'run', '-t', 'lib/'+user_args['app']+'/main.dart']
            binary.extend(f_args)

            Config.launch_flutter_app(binary=binary , filter_file=ff , filter_mode=fmd)
        except KeyboardInterrupt:
            PRINTLN("\n\nExiting the launcher .... bye bye!")
    
   
    def __set_up_icons(self):

        _userArgsAppName = self.user_args["app"].lower().replace("app" , "")
        _userArgsEnvName = self.user_args["lmode"].lower()
        if _userArgsEnvName != "prod":
            _userArgsEnvName = "stage-dev"

        _androidLauncherPath = f'assets/{_userArgsAppName}/icons/{_userArgsEnvName}/android'
        _iosLauncherPath = f'assets/{_userArgsAppName}/icons/{_userArgsEnvName}/ios'
        #   1. setting flutter projects assets icons --------------------------------------------------------------

        PRINTLN("[~] Setting flutter - assets/icons ...")

        _project_icons_path = '..|assets|icons|'.replace('|' , self.pathname_separator)
        if not os.path.exists(_project_icons_path):
            os.system(f'mkdir {_project_icons_path}')

       
        # Android first:
        originalAndroidIconsBytes = open(f'{_androidLauncherPath}/android.png' , 'rb').read()
        originalPlayStoreBytes = open(f'{_androidLauncherPath}/playstore.png' , 'rb').read()
        open(f'{_project_icons_path}android.png' , 'wb+').write(originalAndroidIconsBytes)
        open(f'{_project_icons_path}playstore.png' , 'wb+').write(originalPlayStoreBytes)
        PRINTLN(f"\t- [-] Android:{_userArgsAppName} => Setting up assets/icons Done.")
        # Then iOS :
        originalIosIconsBytes = open(f'{_iosLauncherPath}/ios.png' , 'rb').read()
        originalAppStoreBytes = open(f'{_iosLauncherPath}/appstore.png' , 'rb').read()
        open(f'{_project_icons_path}ios.png' , 'wb+').write(originalIosIconsBytes)
        open(f'{_project_icons_path}appstore.png' , 'wb+').write(originalAppStoreBytes)

        PRINTLN(f"\t- [-] iOS:{_userArgsAppName} => Setting up assets/icons Done.")

        #   2. setting mipmaps for Android in android/app/src/main/res --------------------------------------------
        
        PRINTLN("[~] Setting Android's mipmaps - android/app/src/main/res ...")
        _project_mipmaps_dir = '..|android|app|src|main|res|'.replace('|' , self.pathname_separator)

        
        rm_lambda(_project_mipmaps_dir+"mipmap") # -> this Executes : rm -rf android/app/src/main/res/mipmap*
        os.system(f'cp -r {_androidLauncherPath}/mipmaps/* {_project_mipmaps_dir}') # Copies all the mipmaps to the original android/ folder

        PRINTLN(f"\t- [-] Android:{_userArgsAppName} => Setting up android/app/src/main/res/mipmap* Done.")

        #   3. setting up appIconSet for iOS in flutter/ios/Runner/Assets.xcassets/AppIcon.appiconset  -----------

        PRINTLN("[~] Setting iOS's appIconSet - flutter/ios/Runner/Assets/xcassets/AppIcon.appiconset ...")

        _project_app_icon_set_dir = '..|ios|Runner|Assets.xcassets|'.replace('|' , self.pathname_separator)
        rm_lambda(_project_app_icon_set_dir+"AppIcon") # -> this Executes : rm -rf flutter/ios/Runner/Assets/xcassets/AppIcon*
        rm_lambda(_project_app_icon_set_dir+"Contents.json")
        os.system(f'cp -r {_iosLauncherPath}/AppIcon.appiconset {_project_app_icon_set_dir}') # Copies the app's IconSet to the original ios/ folder

        PRINTLN(f"\t- [-] iOS:{_userArgsAppName} => Setting up flutter/ios/Runner/Assets/xcassets/AppIcon.appiconset Done.")

    def __patcher__(self):
      
        # Patching Android - Ios icons:
        self.__set_up_icons()

        # Writing Valid launcher.xml
        _launcherXmlFile = self.conf['settings']['launcher.xml']
        _outputAppName = self.conf['apps'][self.user_args["app"]]['packages'][self.user_args['lmode']]['appName'];
        _appPackageName = self.conf['apps'][self.user_args["app"]]['packages'][self.user_args['lmode']]['packageName'];

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

        # if there is no existing ktMainActivity dir, we make it.
        if not os.path.exists(os.path.dirname(main_activity_kt_path)):
            rm_lambda(project_kotlin_folder) # this will delete the tree starting with com folder.
            # then we create our own correct tree:
            os.makedirs(os.path.dirname(main_activity_kt_path), exist_ok=True)
       
        # Get if there is any extra imports / superClasses for the specific app we're running:
        _main_activity_kt_cfg = self.conf['apps'][self.user_args["app"]].get("MainActivityKt")
        _super_class = "FlutterActivity"
        global _kt_imports
        _kt_imports = []
        if _main_activity_kt_cfg != None:
            _super_class = _main_activity_kt_cfg['super']
            _tmp_imps = _main_activity_kt_cfg.get('imports')
            if _tmp_imps != None:
                _kt_imports = _tmp_imps

        # then we write our correct Activity.kt
        _cloned = open('patches/android/MainActivity.kt').read().replace('<mez-package-name>', _appPackageName).replace('<kt_imports>', '\n'.join(_kt_imports)).replace('<kt_super>', _super_class)
        open(main_activity_kt_path , 'w+').write(_cloned)
        PRINTLN(f"[+] Set up of : {main_activity_kt_path} .. done!")
        
        # Manifest Permissions
        # Shared Permissions are already stored in self.conf['gen::permissions'] as String

        _app_specific_permissions = self.conf['apps'][self.user_args['app']].get('appPermissions')
        if _app_specific_permissions:
            PRINTLN(f"[~] Validating {self.user_args['app']} Permissions ... ")
            self.conf['gen::permissions'] += Config.validate_manifest_permissions(_app_specific_permissions)

        #  main ManifestXml:
        _project_main_manifest = "..|android|app|src|main|AndroidManifest.xml".replace('|' , self.pathname_separator)
        if not os.path.exists(os.path.dirname(_project_main_manifest)):
            os.system(f'mkdir {os.path.dirname(_project_main_manifest)}')
        
        if os.path.exists(_project_main_manifest):
            os.system(f'{"mv" if not self.isWin else "move"} ..|android|app|src|main|AndroidManifest.xml ..|android|app|src|main|AndroidManifest.xml.backup'.replace('|' , self.pathname_separator))

        _cloned = open('patches/android/main/AndroidManifest.xml').read().replace('<mez-package-name>', _appPackageName).replace('<mez-permissions>' , self.conf['gen::permissions'])
        open(_project_main_manifest , 'w+').write(_cloned)

        # profile :
        _project_profile_manifest = "..|android|app|src|profile|AndroidManifest.xml".replace('|' , self.pathname_separator)
        if not os.path.exists(os.path.dirname(_project_profile_manifest)):
            os.system(f'mkdir {os.path.dirname(_project_profile_manifest)}')
        
        if os.path.exists(_project_profile_manifest):
            os.system(f'{"mv" if not self.isWin else "move"} ..|android|app|src|profile|AndroidManifest.xml ..|android|app|src|profile|AndroidManifest.xml.backup'.replace('|' , self.pathname_separator))
        
        _cloned = open('patches/android/profile/AndroidManifest.xml').read().replace('<mez-package-name>', _appPackageName).replace('<mez-permissions>' , self.conf['gen::permissions'])
        open(_project_profile_manifest , 'w+').write(_cloned)


        # debug:
        _project_debug_manifest = "..|android|app|src|debug|AndroidManifest.xml".replace('|' , self.pathname_separator)
        
        if not os.path.exists(os.path.dirname(_project_debug_manifest)):
            os.system(f'mkdir {os.path.dirname(_project_debug_manifest)}')
        
        if os.path.exists(_project_debug_manifest):
            os.system(f'{"mv" if not self.isWin else "move"} ..|android|app|src|debug|AndroidManifest.xml ..|android|app|src|debug|AndroidManifest.xml.backup'.replace('|' , self.pathname_separator))
        
        _cloned = open('patches/android/debug/AndroidManifest.xml').read().replace('<mez-package-name>', _appPackageName).replace('<mez-permissions>' , self.conf['gen::permissions'])
        open(_project_debug_manifest , 'w+').write(_cloned)
        
        # Done !
        PRINTLN("[+] Patched and Backed-up all ../android/app/src/<mode>/AndroidManifest.xml just in case ..!")


        # IOS ----
        # TODO : Handle Versioning !
        # Patching info.plist & project.pbxproj for IOS!
        _ios_app_folder_name = self.user_args["app"].lower().replace("app" , "")

        _project_pbxproj_path = "../ios/Runner.xcodeproj/project.pbxproj"
        _info_plist_path = "../ios/Runner/Info.plist"
        
        # <mez-app-type> -> replaces project.pbxproj 's Icon Set
        _cloned = open('patches/ios/project.pbxproj').read()
        _cloned = _cloned.replace('<mez-package>', _appPackageName) #.replace('<mez-app-type>' , _ios_app_folder_name)
        # Safe check for launching.
        if not self.user_args.get('version_name'):
            self.user_args['version_name'] = '1.0.1'
        if not self.user_args.get('version_code'):
            self.user_args['version_code'] = '1'

        if not '--pipeline' in argv:
            self.user_args['pipeline'] = False
            _continue = input(f"[~] Please Confirm Launching/building with version {self.user_args['version_name']}+{self.user_args['version_code']} ?")
        if not (_continue.__len__() == 0 or _continue.lower() == "y" or _continue.lower() == "yes"):
            exit(DW_EXIT_REASONS.WRONG_VERSION_GIVEN)
        else:
            self.user_args['pipeline'] = True

        # patching versions in project.pbxproj
        if self.user_args['version_code'] and self.user_args['version_name']:
            _cloned = _cloned.replace('<mez-version-name>' , self.user_args['version_name']).replace('<mez-version-code>' , self.user_args['version_code'])
        else:
            PRINTLN("[!] When running --build=ios , Specify the version=x.x.x+x please !")
            exit(DW_EXIT_REASONS.WRONG_VERSION_GIVEN)

        open(_project_pbxproj_path , 'w+').write(_cloned)
        PRINTLN(f"[+]  Patched ios/project.pbxproj => {_appPackageName}")
        _cloned = open(f'patches/ios/{_ios_app_folder_name}/Info.plist')\
        .read()\
        .replace('<mez-output-name>', _outputAppName)\
        .replace('<mez-app-type>' , _ios_app_folder_name)\
        .replace('<mez-fb-client-token>' , Config.fromEnv('FB_CLIENT_TOKEN'))

        open(_info_plist_path , 'w+').write(_cloned)
        PRINTLN(f"[+] Patched ios/Runner/Info.plist => {_outputAppName}!")
	    # Getting rid of 8.0
        if os.path.exists('../ios/Pods/Pods.xcodeproj/project.pbxproj'):
            _pods_xcodeproj_project_pbxproj = open('../ios/Pods/Pods.xcodeproj/project.pbxproj').read()
            open('../ios/Pods/Pods.xcodeproj/project.pbxproj', 'w+').write(_pods_xcodeproj_project_pbxproj.replace('IPHONEOS_DEPLOYMENT_TARGET = 8.0', 'IPHONEOS_DEPLOYMENT_TARGET = 12.0'))
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
        isVerbose = " --verbose " if self.user_args['verbose'] else ""
        
        if not self.user_args['lmode']:
            PRINTLN("In order to build you have to specify env=<stage, dev, prod>")
            exit(DW_EXIT_REASONS.WRONG_ENV_USED)
        elif not self.user_args['app'] :
            PRINTLN("In order to build you have to specify app=<appName>")
            exit(DW_EXIT_REASONS.NO_APP_SPECIFIED)

        if self.user_args['build'] == 'ios' :
            ios_export_options_plist_path = "patches/ios/ExportOptions.plist"
            ios_export_options_plist_arg = f" --export-options-plist='{os.path.abspath(ios_export_options_plist_path)}'" if os.path.exists(ios_export_options_plist_path) else ""
            if ios_export_options_plist_arg == "":
                PRINTLN("[+] Detected a first time xcarchive build , thus can't generate an ipa file you either wait for the build to finish and relaunch or do it from xcode once build is done !")
            else:
                PRINTLN("[+] Generating .ipa from xcarchive file for you ..")
            os.system(f'flutter build ipa --target lib/{self.user_args["app"]}/main.dart{ios_export_options_plist_arg}{isVerbose}')
        else:
            is_apk = self.user_args["build"] == 'apk'
            cmd_build = f'flutter build {self.user_args["build"]} -t lib/{self.user_args["app"]}/main.dart {isVerbose}{"--split-per-abi"if is_apk else""}'
            if is_apk:
                PRINTLN(f"[⚒️] Building : app-armeabi-v7a-release.apk ...")
            os.system(cmd_build)

    def __launch__(self):
        # self.__f_checker__()
        
        self.__patcher__()
        self.__patch_gs__()
        if self.user_args['pipeline'] == True:
            PRINTLN(f"[ PIPELINE ] All the necessary patching is done, quitting now with 0...")
            quit(code=0)

        if 'build' in self.user_args.keys():
            PRINTLN(f"[+] Building the app::{self.user_args['build']} for you ...")
            self.__build_temp()
            exit(DW_EXIT_REASONS.NORMAL)

        self.__set_flutter_args__()
class Config:
    
    possible_args = ['--pipeline','--upgrade-env', '--fix-pods', '--verbose' , 'help', 'app' , 'env' , 'version', 'filter', 'fmode', '--build', '--lan', '--preview' , '--set-version']
    def __help__(self):
        print(f""" 
        + app=<AppName>
        + env=<Environment>
        + filter=<FileName.filter>  : just pass the filter file name you created under output_filters.
        + fmode=<filter_mode> : Default is 'show' , can be 'hide' depend on how you want to use the filter file!
        + --build=<type> : to order the launcher to build where type is [apk, appbundle, ios] , requires app=<app> and env=<env>.
        + --lan : in case you want to launch to another device connected to the same network.
        + --preview : Passing this along , will result on launching the app in the device-preview for testing an try many resolutions.
        + version=<version> : Used to set the project's version to a specific version.
       	+ --fix-pods : Special cmd for MAC M1 , meant for fixing pod problems on IOS.
        + --upgrade-env : Upgrading the flutter environment while also fixing plugings in iOS part.
	    + help : show this help menu
     

        PS : if an Error happend Send DW_EXIT_REASON.<NAME>.
        """)
    

    @staticmethod
    def fromEnv(env_var_name: str) -> str:
        import re
        try:
            assert(os.path.exists('.env'))
            var =  re.match(r'^('+ re.escape(env_var_name)+'{0,}\=)[^\n]+\n*' , open('.env').read())
            assert(var != None)
            return ''.join(var.group(0).split('=')[1:])
           
        except AssertionError as ae:
            PRINTLN(f"[!] launcher/.env does not exists or the variable {env_var_name} is not defined in launcher/.env !")
            exit(DW_EXIT_REASONS.ENV_VAR_NOT_FOUND)

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

    @staticmethod
    def validate_manifest_permissions(permissionsList) -> Str:
        _permissionsString = ''
        for shPerm in permissionsList:
            _shSplitted = shPerm.split('\'')
            if shPerm and _shSplitted.__len__() >= 3:
                PRINTLN(f"\t- [-] {_shSplitted[1]}")
                _permissionsString += shPerm+'\n'
            else :
                PRINTLN(f"\t- [x] {shPerm}")
                exit(DW_EXIT_REASONS.INVALID_PERMISSION_LEN_OR_NULL)
        return _permissionsString

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
            
            _shared_permissions = self.conf['settings'].get('sharedPermissions')
            if not _shared_permissions:
                PRINTLN("[!] WARNING : No permissions were found at conf.settings.sharedPermissions.")
                self.conf['gen::permissions'] = ''
            else:
                PRINTLN("[~] Validating shared Permissions ... ")
                self.conf['gen::permissions'] = Config.validate_manifest_permissions(_shared_permissions)

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

        _strippedLocalProps = ''.join(_localProperties).replace('\n','')
        if 'flutter.versionName' not in _strippedLocalProps:
            open(localProperties, 'a').write('flutter.versionName=1.0.0\n')
        if 'flutter.versionCode' not in _strippedLocalProps:
            open(localProperties, 'a').write('flutter.versionCode=1\n')
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

        # these are used later in Launcher for building IOS:IPA
        self.user_args['version_name'] = __v[0]
        self.user_args['version_code'] = __v[-1]


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
        global is_windows
        if platform.startswith('win'):
            is_windows = True
            # cuz CMD is dumb xd
            rm_lambda = lambda path : f'del {path}'# && rd {path}
        else:
            is_windows = False

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
            Launcher(self.user_args , self.conf , is_windows)

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
	# We have to add SKSL check here , if it is launched with sksl then generate sksl with a custom name and then auto build it if --build has beem passed down within Launcher Args.

    def __checker__(self , args) -> None:
        
        _ = self.__get_arg_value__('version=')
        if _:
            self.__patch_version__(_)
            #exit(DW_EXIT_REASONS.NORMAL)
                # Cmd to fix Pods Problems
        _ = self.__get_arg_value__('--upgrade-env')
        if _:
            os.system('flutter --version')
            if input("[?] Running this will upgrade flutter env and fix plugins related problems : y/n ?").lower() == 'y':
                os.system('rm -rf ~/Library/Developer/Xcode/DerivedData/* && flutter upgrade --force && flutter pub upgrade && flutter pub upgrade --major-versions && flutter clean && python3 launcher.py --fix-pods')
            exit(DW_EXIT_REASONS.NORMAL)

        _ = self.__get_arg_value__('--fix-pods')
        if _:
            if input('[?] This is only for MAC M1 chips ! Continue : y/n ?').lower() == 'y':
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
                    pod_lines[patch_line_index] = "platform :ios, '12.0'"
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

        # THIS IS LAUNCHER BASED BUILD
        # TODO : Implement that using class:Builder
        _ = self.__get_arg_value__('--build=')
        if _:
            if str(_).lower() not in ['apk' , 'appbundle' , 'ios']:
                PRINTLN(f'[!] --build={_} : Error Platform unsupported yet!')
                exit(DW_EXIT_REASONS.PLATFORM_NOT_SUPPORTED_YET)

            # v_ = self.__get_arg_value__('version=')
            # if v_:
            #     self.__patch_version__(v_)

            self.user_args['build'] = _

        # check if same action as last one :
        # from hashlib import md5
        # currentBuild = md5(''.join(args[1:]).encode('utf-8')).hexdigest()
        # lastBuild  = open('.checksum', 'r+').read().strip()
        # if lastBuild == currentBuild:
        #     PRINTLN(f"[+] Same build chsum <{currentBuild}> going straight forward to launch/build.")
        #     self.user_args['same_build'] = True
        # else:
        #     self.user_args['same_build'] = False
        #     open('.checksum', 'w+').write(currentBuild)

if __name__ == "__main__":
    # if 'offers' in argv:
    #     simulate_counter_offers(
    #         orderId= "-N8l0HFq5ygDPouwbaDj",
    #         customerId= "tSG0eSFZNGNA7grjBPFEBbpYwjE3"
    #     )
    #     exit(0)
    # if 'drive' in argv:
    #     # Taxi called from : 
    #     # Customer's destination To :
    #     simulateDriverMovements( 
    #         customerId="tSG0eSFZNGNA7grjBPFEBbpYwjE3", # Montassar's customer id
    #         orderId="-N8_J16QRVKzS9rnI4DH", # taxi order id
    #         orderType="taxi",
    #         driverId="oAxB9JquC1S7zQyRUuZF2gI1suL2", # driverId
    #         driverType="driver",
    #         # start="15.866373,-97.068697",
    #         end="15.835721354763855,-97.04348623752594",
    #         # 19.38003452020731 | -98.96333869546652
    #         # destination : 15.835502076340775,-97.04348623752594
    #         start="15.83476,-97.04242",
    #         # end="15.865125366502896,-97.05751821398735",
    #         duration_sec=120
    #     )
    Config(argv)
    exit(DW_EXIT_REASONS.NORMAL)