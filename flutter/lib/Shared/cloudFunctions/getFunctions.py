import os
import sys
import json

onlyFunctionImports = {}
fileImports = {}
functionNamesGroup1 = []
functionNamesGroup2 = {}
uniqueTypes = {}
models = {}

types = {"number": "num", "string": "String", "boolean": "bool"}

def searchForModel(search):  
  typeDictionary = {"values":{}}
  found = False
  for folder, dirs, files in os.walk("./"):
    for file in files:
      if file == '.DS_Store':
        continue
      fullpath = os.path.join(folder, file)
      with open(fullpath, 'r') as f:
        for line in f:
          if "enum "+search in line:
            typeDictionary["type"] = "enum"
            found = True
          if "interface "+search in line:
            typeDictionary["type"] = "interface"
            found = True
          if found:
            if ":" in line:
              v = line.split(":")
              typeDictionary["values"][v[0].strip()] = v[1].strip().replace(",","").replace(";","")                   
            if "=" in line:
              v = line.split("=")
              typeDictionary["values"][v[0].strip()] = v[1].strip().replace(",","").replace("\"","").replace(";","")                 
            if("}" in line):
              return typeDictionary
  print("🚫🚫🚫🚫🚫 model not found")
  print(search)
  print()
  sys.exit()

def getFileName(corresponding):
  pre = corresponding.split("(")[0]
  if "." in pre:
    return fileImports[pre.split(".")[0]]
  else:
    return onlyFunctionImports[pre]

def getArguments(corresponding):
  # print(corresponding)
  fileName = getFileName(corresponding)
  searchFor = corresponding.split("(")[0]+"("
  if "." in corresponding.split("(")[0]:
    searchFor = corresponding.split("(")[0].split(".")[1]+"("
  if "data" in corresponding:
    with open(fileName+".ts", 'r') as f:
      for line in f:
        if searchFor in line:
          interface = line.split(")")[0].split("(")[1].split(",")[1].split(":")[1].strip()
          with open(fileName+".ts", 'r') as f2:
            found = False
            arguments = {}
            for line2 in f2:
              if interface in line2 and "interface" in line2:
                found = True
              if found:
                if ":" in line2:
                  v = line2.split(":")
                  arguments[v[0].strip()] = v[1].strip().replace(",","").replace(";","")
                  uniqueTypes[v[1].strip().replace(",","").replace(";","")] = True
                if("}" in line2):
                  return arguments
          print("🚫🚫🚫🚫🚫 interface not found in file")
          print(interface)
          print(fileName)
          print()
          sys.exit()
    print("🚫🚫🚫🚫🚫 function not found in file")
    print(searchFor)
    print(fileName)
    print()
    sys.exit()

def getReturnType(corresponding):
  # print(corresponding)
  fileName = getFileName(corresponding)
  searchFor = corresponding.split("(")[0]+"("
  if "." in corresponding.split("(")[0]:
    searchFor = corresponding.split("(")[0].split(".")[1]+"("
  if "data" in corresponding:
    with open(fileName+".ts", 'r') as f:
      for line in f:
        if searchFor in line:
          returnType = line.split(")")[1].split("{")[0].strip()
          # @sanchit find return type checkoutResponse
          if returnType:
            returnType = returnType.split(":")[1].strip()
            if "Promise" in returnType:
              returnType = returnType.split("<")[1].split(">")[0]
            # print(returnType)
            if "void" in returnType:
              returnType = ""
            # returnType = "CheckoutResponse"
          if returnType:
            uniqueTypes[returnType] = True
            return returnType
          return None


def getCorrespondingFnName(functionGroupName, line, authenticated):
  functionName = line.strip().split(":")[0]
  fullFunctionName = functionGroupName+"-"+functionName
  functionNamesGroup2[fullFunctionName] = {}
  functionNamesGroup2[fullFunctionName]["authenticated"] = authenticated
  corresponding = line.split("=>")[1].strip()
  if corresponding[-1] == ",":
    corresponding = corresponding[:-2]
  # functionNamesGroup2[functionGroupName][functionName]["functionName"] = corresponding.split("(")[0][:-1]
  functionNamesGroup2[fullFunctionName]["arguments"] = getArguments(corresponding)
  functionNamesGroup2[fullFunctionName]["returnType"] = getReturnType(corresponding)
  # print(functionNamesGroup2[fullFunctionName]["returnType"])


def extractFunctionNamesGroupAsDictionary():
  for fn in functionNamesGroup1:
    functionGroupName = fn[fn.index("const")+5:fn.index("=")].strip()
    for line in fn.splitlines():
      if ":" in line:
        if "function" in line:
          getCorrespondingFnName(functionGroupName, line, False)
          # break
        if "authenticatedCall" in line:
          getCorrespondingFnName(functionGroupName, line, True)
    # break
    
exportConstStarted = False
exportConstValue = ""

def extractFunctionNamesGroupAsString(line):
  global exportConstStarted
  global exportConstValue
  if exportConstStarted == True:
    if "//" not in line:
      exportConstValue += line
    if "}" in line:
      exportConstStarted = False
      functionNamesGroup1.append(exportConstValue)
  if "export const" in line and "//" not in line:
    exportConstStarted = True
    exportConstValue = line   


# fills the following
#  onlyFunctionImports = {} like import { createNewRestaurant } from "./restaurant/createNewRestaurant";
# fileImports = {} import * as restaurantStatusChange from './restaurant/adminStatusChanges'
def extractImports(line):
  if "import" in line and "//" not in line:
    bits = line.split("from")
    bits2 = bits[0].split(' ')
    # print(bits2)
    if "{" in bits2:
      for x in bits2[bits2.index("{")+1:bits2.index("}")]:
        onlyFunctionImports[x.replace(",","")] = bits[-1].replace(";","").replace("\n","").replace("'","").replace("\"","").strip()
    if "as" in bits2:
      fileImports[bits2[-2]] = bits[-1].replace("\n","").replace("\n","").replace("'","").replace("\"","").strip()


def printDartFormatDeclaration(name, typ):
  nullable = ""
  if "?" in name:
    nullable = "?"

  prefix = typ
  if "null" in typ:
    nullable = "?"
    prefix = prefix.strip()[:-4].strip()[:-1].strip()
  if "undefined" in typ:
    nullable = "?"
    prefix = prefix.strip()[:-9].strip()[:-1].strip()
  if prefix in types:
    prefix = types[prefix]
  return "  "+prefix+nullable+" "+name.replace("?","")+";"

def printDartFormatClassInit(clas, instances):
  str = "  "+clas+"(";
  for i in instances:
    str += "this."+i.replace("?","")+", "
  return str[:-2]+");"

def printDartFormatEnum(key, values): 
  str = "enum "+key+" { "
  for v in values:
    str += v+", "
  str = str[:-2]+" }\n"

  converter = '''extension Parse####ToString on #### {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}'''
  converter = converter.replace("####",key)
  return str+converter+"\n\n"

def printDartFormatFunction(key, value):
  str = "  static Future<void> "+key.replace("-","_")+"(\n"
  if value["returnType"] != None:
    str = str.replace("void", value["returnType"])
  if value["arguments"] != None:
    str += "      {"
    for v in value["arguments"]:
      toAdd = '''required type name,
      '''
      if(v[-1] == "?"): 
        toAdd = toAdd.replace("required ","")
      toAdd = toAdd.replace("name", v.replace("?",""))
      prefix = value["arguments"][v]
      if prefix in types:
        prefix = types[prefix]
      if(v[-1] == "?"): 
        prefix += "?"
      if "Record" in prefix:
        prefix = prefix.replace("Record","Map")
        prefix = prefix.replace(" ",",")
        arr = prefix.split("<")[1].split(">")[0].split(",")
        if(arr[0] in types):
          prefix = prefix.replace(arr[0], types[arr[0]])
        if(arr[1] in types):
          prefix = prefix.replace(arr[1], types[arr[1]])

      toAdd = toAdd.replace("type", prefix)
      toAdd = toAdd.replace("JSON", "Map<String, dynamic>")
      str += toAdd
    str = str[:-8]+"}"
  str += "  ) async {\n"
  body = "    return "
  if value["returnType"] != None:
    body += value["returnType"]
    body += ".fromFirebaseFormattedJson("
  body += "await callCloudFunction("
  body +='''
      functionName: "fnxxx",
      parameters: <String, dynamic>{});
  }'''
  if value["returnType"] != None:
    body = body.replace("parameters: <String, dynamic>{});","parameters: <String, dynamic>{}));")
  body = body.replace("fnxxx", key)
  params = "<String, dynamic>{\n        "
  if value["arguments"] != None:
    for v1 in value["arguments"]:
      # v = v1.replace("?","")
      v = v1.replace("?","")
      if value["arguments"][v1] in models and models[value["arguments"][v1]]["type"] == "enum":
        p2 = "\""+v+"\""+":"+v+".toFirebaseFormatString(),"+"\n"+"        "
        if v1[-1] == "?":
          p2 = p2.replace(".toFir","?.toFir")
        params += p2
      elif value["arguments"][v1] in models and models[value["arguments"][v1]]["type"] == "interface":
        p2 = "\""+v+"\""+":"+v+".toFirebaseFormattedJson(),"+"\n"+"        "
        if v1[-1] == "?":
          p2 = p2.replace(".toFir","?.toFir")
        params += p2
      elif value["arguments"][v1] == "JSON":
        params += "\""+v+"\""+":json.encode("+v+"),"+"\n"+"        "
      else:
        params += "\""+v+"\""+":"+v+","+"\n"+"        "
      # params = params.replace("?","")
    body = body.replace("<String, dynamic>{}",params[:-2]+"}")

  return str+body+"\n\n"; 

def getModels():
  toWriteModel = ""
  for key in models:
    if models[key]["type"] == "interface":
      toWriteModel += "class "+key+" {"+"\n"
      for v in models[key]["values"]:
        toWriteModel +=  printDartFormatDeclaration(v, models[key]["values"][v])+"\n"
      toWriteModel += printDartFormatClassInit(key, models[key]["values"])+"\n"
      toWriteModel +=   '''Map<String, dynamic> toFirebaseFormattedJson() {
    return <String, dynamic>{
      '''
      for v in models[key]["values"]:
        toWriteModel +=  "\""+v.replace("?","")+"\": "+v.replace("?","")+",\n      "
      toWriteModel = toWriteModel[:-8]
      toWriteModel +=  "};\n  }\n"
      if "Response" in key:
        # print(key)
        toWriteModel += "factory "+key+".fromFirebaseFormattedJson(dynamic json) { "
        toWriteModel += "\n   return "+key+"("
        for v in models[key]["values"]:
          toWriteModel += '''json["'''+v+'''"], '''
        toWriteModel = toWriteModel[:-2]
        toWriteModel += ''');
  }'''
      ## @sanchit todo
      ## add Factory
  #       factory CheckoutResponse.fromFirebaseFormattedJson(dynamic json) {
  #   return CheckoutResponse(json["orderId"], json["nullableField"]);
  # }
      toWriteModel +=  "\n}\n\n"
    if models[key]["type"] == "enum":
      toWriteModel +=  printDartFormatEnum(key, models[key]["values"])
  return toWriteModel

def getIndex():
  toWriteIndex = '''import 'package:cloud_functions/cloud_functions.dart';
import 'dart:convert';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
class CloudFunctions {
  static Future<dynamic> callCloudFunction(
      {required String functionName, Map<String, dynamic>? parameters}) async {
    final Map<String, dynamic> finalParams = <String, dynamic>{
      'versionNumber': '0.0.0'
    };
    finalParams.addAll(parameters ?? <String, dynamic>{});
    final HttpsCallableResult<dynamic> response = await FirebaseFunctions.instance
        .httpsCallable(functionName)
        .call(finalParams);
    return response.data;
  }

'''
  


  for key in functionNamesGroup2:
    toWriteIndex += printDartFormatFunction(key, functionNamesGroup2[key])

  toWriteIndex += "}"
  return toWriteIndex


if __name__ == "__main__":
  os.chdir('../../../../functions/src')
  with open('./index.ts', 'r') as f:
    for line in f:
      extractImports(line)
      extractFunctionNamesGroupAsString(line)
  extractFunctionNamesGroupAsDictionary()
  uniqueTypes["AppType"] = True
  uniqueTypes["Language"] = True
  uniqueTypes["ServerResponseStatus"] = True

  for key in uniqueTypes:
    print(key)
    if key not in ["string", "number", "boolean", "JSON"] and "Record" not in key:
      models[key] = searchForModel(key)

  os.chdir('../../flutter/lib/Shared/cloudFunctions')

  f = open("index.dart", "w")
  f.write(getIndex())
  f.close()
  f = open("model.dart", "w")
  f.write(getModels())
  f.close()