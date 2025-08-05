load("//struct2tensor:struct2tensor.bzl", "s2t_pytype_library")
load("@com_google_protobuf//:protobuf.bzl", "py_proto_library")
load("@rules_cc//cc:defs.bzl", "cc_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_python//python:defs.bzl", "py_library")

package(
    default_visibility = ["@//:__subpackages__"],
)

licenses(["notice"])

exports_files([
    "__init__.py",
    "expression_test_util.py",
    "prensor_test_util.py",
])

proto_library(
    name = "test_proto",
    srcs = ["test.proto"],
)

cc_proto_library(
    name = "test_cc_proto",
    deps = [":test_proto"],
)

py_proto_library(
    name = "test_py_pb2_impl",
    srcs = ["test.proto"],
    srcs_version = "PY3",
)

py_library(
    name = "test_py_pb2",
    deps = [":test_py_pb2_impl"],
)

proto_library(
    name = "test_any_proto",
    srcs = ["test_any.proto"],
    deps = ["@com_google_protobuf//:any_proto"],
)

cc_proto_library(
    name = "test_any_cc_proto",
    deps = [":test_any_proto"],
)

py_proto_library(
    name = "test_any_py_pb2_impl",
    srcs = ["test_any.proto"],
    srcs_version = "PY3",
)

py_library(
    name = "test_any_py_pb2",
    deps = [":test_any_py_pb2_impl"],
)

proto_library(
    name = "test_map_proto",
    srcs = ["test_map.proto"],
)

cc_proto_library(
    name = "test_map_cc_proto",
    deps = [":test_map_proto"],
)

py_proto_library(
    name = "test_map_py_pb2_impl",
    srcs = ["test_map.proto"],
    srcs_version = "PY3",
)

py_library(
    name = "test_map_py_pb2",
    deps = [":test_map_py_pb2_impl"],
)

proto_library(
    name = "test_proto3_proto",
    srcs = ["test_proto3.proto"],
)

py_proto_library(
    name = "test_proto3_py_pb2_impl",
    srcs = ["test_proto3.proto"],
    srcs_version = "PY3",
)

py_library(
    name = "test_proto3_py_pb2",
    deps = [":test_proto3_py_pb2_impl"],
)

proto_library(
    name = "test_extension_proto",
    srcs = ["test_extension.proto"],
    deps = [":test_proto"],
)

py_proto_library(
    name = "test_extension_py_pb2_impl",
    srcs = ["test_extension.proto"],
    deps = [
        ":test_py_pb2_impl",
    ],
    srcs_version = "PY3",
)

py_library(
    name = "test_extension_py_pb2",
    deps = [":test_extension_py_pb2_impl"],
)

proto_library(
    name = "dependent_test_proto",
    srcs = ["dependent_test.proto"],
    deps = [":test_proto"],
)

py_proto_library(
    name = "dependent_test_py_pb2_impl",
    srcs = ["dependent_test.proto"],
    deps = [
        ":test_py_pb2_impl",
    ],
    srcs_version = "PY3",
)

py_library(
    name = "dependent_test_py_pb2",
    deps = [":dependent_test_py_pb2_impl"],
)

s2t_pytype_library(
    name = "expression_test_util",
    testonly = 1,
    srcs = [
        "expression_test_util.py",
    ],
    deps = [
        "//struct2tensor:expression",
        "//struct2tensor:path",
    ],
)

s2t_pytype_library(
    name = "prensor_test_util",
    testonly = 1,
    srcs = [
        "prensor_test_util.py",
    ],
    deps = [
        "//struct2tensor:expression",
        "//struct2tensor:path",
    ],
)
