# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Bazel macros used in OSS."""

load("@com_google_protobuf//:protobuf.bzl", "py_proto_library")
load("@rules_cc//cc:defs.bzl", "cc_proto_library")

def s2t_pytype_library(
        name,
        srcs = [],
        deps = [],
        srcs_version = "PY3ONLY",
        testonly = False):
    native.py_library(name = name, srcs = srcs, deps = deps, testonly = testonly)

def s2t_proto_library(
        name,
        srcs = [],
        has_services = False,
        deps = [],
        visibility = None,
        testonly = 0,
        cc_grpc_version = None):
    """Opensource proto_library."""
    _ignore = [has_services]
    native.proto_library(
        name = name + "_proto",
        srcs = srcs,
        deps = deps,
        visibility = visibility,
        testonly = testonly,
    )

    use_grpc_plugin = None
    if cc_grpc_version:
        use_grpc_plugin = True

    cc_proto_library(
        name = name,
        deps = [":" + name + "_proto"],
        visibility = visibility,
        testonly = testonly,
    )

def s2t_proto_library_cc(
        name,
        srcs = [],
        has_services = False,
        deps = [],
        visibility = None,
        testonly = 0,
        cc_grpc_version = None):
    """Opensource cc_proto_library."""
    _ignore = [has_services]
    native.proto_library(
        name = name + "_proto",
        srcs = srcs,
        deps = deps,
        visibility = visibility,
        testonly = testonly,
    )

    use_grpc_plugin = None
    if cc_grpc_version:
        use_grpc_plugin = True
    cc_proto_library(
        name = name,
        deps = [":" + name + "_proto"],
        visibility = visibility,
        testonly = testonly,
    )

def s2t_proto_library_py(name, proto_library=None, srcs = [], deps = [], oss_deps = [], visibility = None, testonly = 0, api_version = None):
    """Opensource py_proto_library that creates a py_library."""
    _ignore = [api_version]
    py_proto_library(
        name = name + "_impl",
        srcs = srcs,
        deps = deps + ([proto_library] if proto_library else []),
        srcs_version = "PY3ONLY",
        py_libs = ["@com_google_protobuf//:well_known_types_py_pb2"],
        default_runtime = "@com_google_protobuf//:protobuf_python",
        protoc = "@com_google_protobuf//:protoc",
        visibility = ["//visibility:private"],
        testonly = testonly,
    )
    native.py_library(
        name = name,
        deps = [":" + name + "_impl"] + oss_deps,
        visibility = visibility,
        testonly = testonly,
    )

DYNAMIC_COPTS = [
    "-pthread",
]

DYNAMIC_DEPS = ["@local_config_tf//:libtensorflow_framework", "@local_config_tf//:tf_header_lib"]

def s2t_dynamic_binary(name, deps):
    """Creates a .so file intended for linking with tensorflow_framework.so."""
    native.cc_binary(
        name = name,
        copts = DYNAMIC_COPTS,
        linkshared = 1,
        deps = deps + DYNAMIC_DEPS,
    )

def s2t_dynamic_library(
        name,
        srcs,
        deps = None):
    """Creates a static library intended for linking with tensorflow_framework.so."""
    true_deps = [] if deps == None else deps
    native.cc_library(
        name = name,
        srcs = srcs,
        alwayslink = 1,
        copts = DYNAMIC_COPTS,
        deps = true_deps + DYNAMIC_DEPS,
    )

def s2t_gen_op_wrapper_py(
        name,
        out,
        static_library,
        dynamic_library,
        visibility = None):
    """Applies gen_op_wrapper_py externally."""
    native.py_library(
        name = name,
        srcs = ([
            out,
        ]),
        data = [
            dynamic_library,
        ],
        srcs_version = "PY3ONLY",
        visibility = visibility,
    )
