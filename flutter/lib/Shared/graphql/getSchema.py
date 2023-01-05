#!/usr/bin/env python3

from sys import argv
import os

#download

if argv.__len__() >= 2 and argv[1] == 'download':
  print("[~] Downloading new [schema.graphql] from localhost!")
  output = os.popen('npm list -g graphqurl').read()
  if 'graphqurl' not in output:
    print('graphqurl not installed')
    os.system('npm install -g graphqurl')
  else:
    print('graphqurl installed')
  if os.path.exists("schema.graphql"): 
    os.remove("schema.graphql")
  if os.path.exists("schema.graphql.dart"):
    os.remove("schema.graphql.dart")
  os.system('gq http://localhost:8080/v1/graphql -H "X-Hasura-Admin-Secret: myadminsecretkey" --introspect > schema.graphql')



os.system('flutter pub run build_runner build --delete-conflicting-outputs')

toBeReplaced = """class Input$jsonb_cast_exp {
  factory Input$jsonb_cast_exp({Input$String_comparison_exp? String}) =>
      Input$jsonb_cast_exp._({
        if (String != null) r'String': String,
      });

  Input$jsonb_cast_exp._(this._$data);

  factory Input$jsonb_cast_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('String')) {
      final l$String = data['String'];
      result$data['String'] = l$String == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$String as Map<String, dynamic>));
    }
    return Input$jsonb_cast_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$String_comparison_exp? get String =>
      (_$data['String'] as Input$String_comparison_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('String')) {
      final l$String = String;
      result$data['String'] = l$String?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$jsonb_cast_exp<Input$jsonb_cast_exp> get copyWith =>
      CopyWith$Input$jsonb_cast_exp(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$jsonb_cast_exp) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$String = String;
    final lOther$String = other.String;
    if (_$data.containsKey('String') != other._$data.containsKey('String')) {
      return false;
    }
    if (l$String != lOther$String) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$String = String;
    return Object.hashAll([_$data.containsKey('String') ? l$String : const {}]);
  }
}

abstract class CopyWith$Input$jsonb_cast_exp<TRes> {
  factory CopyWith$Input$jsonb_cast_exp(
    Input$jsonb_cast_exp instance,
    TRes Function(Input$jsonb_cast_exp) then,
  ) = _CopyWithImpl$Input$jsonb_cast_exp;

  factory CopyWith$Input$jsonb_cast_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$jsonb_cast_exp;

  TRes call({Input$String_comparison_exp? String});
  CopyWith$Input$String_comparison_exp<TRes> get String;
}

class _CopyWithImpl$Input$jsonb_cast_exp<TRes>
    implements CopyWith$Input$jsonb_cast_exp<TRes> {
  _CopyWithImpl$Input$jsonb_cast_exp(
    this._instance,
    this._then,
  );

  final Input$jsonb_cast_exp _instance;

  final TRes Function(Input$jsonb_cast_exp) _then;

  static const _undefined = {};

  TRes call({Object? String = _undefined}) => _then(Input$jsonb_cast_exp._({
        ..._instance._$data,
        if (String != _undefined)
          'String': (String as Input$String_comparison_exp?),
      }));
  CopyWith$Input$String_comparison_exp<TRes> get String {
    final local$String = _instance.String;
    return local$String == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$String, (e) => call(String: e));
  }
}

class _CopyWithStubImpl$Input$jsonb_cast_exp<TRes>
    implements CopyWith$Input$jsonb_cast_exp<TRes> {
  _CopyWithStubImpl$Input$jsonb_cast_exp(this._res);

  TRes _res;

  call({Input$String_comparison_exp? String}) => _res;
  CopyWith$Input$String_comparison_exp<TRes> get String =>
      CopyWith$Input$String_comparison_exp.stub(_res);
}"""
replaceWith = """class Input$jsonb_cast_exp {
  factory Input$jsonb_cast_exp({Input$String_comparison_exp? StringValue}) =>
      Input$jsonb_cast_exp._({
        if (StringValue != null) r'String': String,
      });

  Input$jsonb_cast_exp._(this._$data);

  factory Input$jsonb_cast_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('String')) {
      final l$String = data['String'];
      result$data['String'] = l$String == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$String as Map<String, dynamic>));
    }
    return Input$jsonb_cast_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$String_comparison_exp? get StringValue =>
      (_$data['String'] as Input$String_comparison_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('String')) {
      final l$String = StringValue;
      result$data['String'] = l$String?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$jsonb_cast_exp<Input$jsonb_cast_exp> get copyWith =>
      CopyWith$Input$jsonb_cast_exp(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$jsonb_cast_exp) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$String = StringValue;
    final lOther$String = other.StringValue;
    if (_$data.containsKey('String') != other._$data.containsKey('String')) {
      return false;
    }
    if (l$String != lOther$String) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$String = String;
    return Object.hashAll([_$data.containsKey('String') ? l$String : const {}]);
  }
}

abstract class CopyWith$Input$jsonb_cast_exp<TRes> {
  factory CopyWith$Input$jsonb_cast_exp(
    Input$jsonb_cast_exp instance,
    TRes Function(Input$jsonb_cast_exp) then,
  ) = _CopyWithImpl$Input$jsonb_cast_exp;

  factory CopyWith$Input$jsonb_cast_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$jsonb_cast_exp;

  TRes call({Input$String_comparison_exp? String});
  CopyWith$Input$String_comparison_exp<TRes> get String;
}

class _CopyWithImpl$Input$jsonb_cast_exp<TRes>
    implements CopyWith$Input$jsonb_cast_exp<TRes> {
  _CopyWithImpl$Input$jsonb_cast_exp(
    this._instance,
    this._then,
  );

  final Input$jsonb_cast_exp _instance;

  final TRes Function(Input$jsonb_cast_exp) _then;

  static const _undefined = {};

  TRes call({Object? String = _undefined}) => _then(Input$jsonb_cast_exp._({
        ..._instance._$data,
        if (String != _undefined)
          'String': (String as Input$String_comparison_exp?),
      }));
  CopyWith$Input$String_comparison_exp<TRes> get String {
    final local$String = _instance.StringValue;
    return local$String == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$String, (e) => call(String: e));
  }
}

class _CopyWithStubImpl$Input$jsonb_cast_exp<TRes>
    implements CopyWith$Input$jsonb_cast_exp<TRes> {
  _CopyWithStubImpl$Input$jsonb_cast_exp(this._res);

  TRes _res;

  call({Input$String_comparison_exp? String}) => _res;
  CopyWith$Input$String_comparison_exp<TRes> get String =>
      CopyWith$Input$String_comparison_exp.stub(_res);
}"""


fin = open("__generated/schema.graphql.dart", "rt")
data = fin.read()
data = data.replace(toBeReplaced, replaceWith)
fin.close()
fin = open("__generated/schema.graphql.dart", "wt")
fin.write(data)
fin.close()

import glob

firstToBeReplacedSubs = """FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),"""
firstReplaceWithSubs = ""
secondToBeReplacedSubs = "$__typename: (l$$__typename as String),"
secondReplaceWithSubs = """$__typename: ((l$$__typename ?? "none") as String),"""

for filename in filter(lambda p: "generated" in p and "schema" not in p, glob.iglob('./**/*.dart', recursive=True)):
  print(filename)
  fin = open(filename, "rt")
  data = fin.read()
  data = data.replace(firstToBeReplacedSubs, firstReplaceWithSubs)
  data = data.replace(secondToBeReplacedSubs, secondReplaceWithSubs)
  fin.close()
  fin = open(filename, "wt")
  fin.write(data)
  fin.close()
