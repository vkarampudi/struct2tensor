load("//struct2tensor:struct2tensor.bzl", "s2t_proto_library", "s2t_proto_library_cc", "s2t_pytype_library")
load("@com_google_protobuf//bazel:py_proto_library.bzl", "py_proto_library")

package(
    default_visibility = ["@//:__subpackages__"],
)

licenses(["notice"])

exports_files([
    "__init__.py",
    "expression_test_util.py",
    "prensor_test_util.py",
])

s2t_proto_library(
    name = "test_proto",
    srcs = ["test.proto"],
)

s2t_proto_library_cc(
    name = "test_cc_proto",
    deps = [
        ":test_proto",
    ],
)

py_proto_library(
    name = "test_py_pb2",
    deps = [":test_proto"],
)

s2t_proto_library(
    name = "test_any_proto",
    srcs = ["test_any.proto"],
    deps = ["@com_google_protobuf//:any_proto"],
)

s2t_proto_library_cc(
    name = "test_any_cc_proto",
    deps = [":test_any_proto"],
)

py_proto_library(
    name = "test_any_py_pb2",
    deps = [":test_any_proto"],
)

s2t_proto_library(
    name = "test_map_proto",
    srcs = ["test_map.proto"],
)

s2t_proto_library_cc(
    name = "test_map_cc_proto",
    deps = [":test_map_proto"],
)

py_proto_library(
    name = "test_map_py_pb2",
    deps = [":test_map_proto"],
)

s2t_proto_library(
    name = "test_proto3_proto",
    srcs = ["test_proto3.proto"],
)

py_proto_library(
    name = "test_proto3_py_pb2",
    deps = [":test_proto3_proto"],
)

s2t_proto_library(
    name = "test_extension_proto",
    srcs = ["test_extension.proto"],
    deps = [":test_proto"],
)

py_proto_library(
    name = "test_extension_py_pb2",
    deps = [
        ":test_extension_proto",
        ":test_proto",
    ],
)

s2t_proto_library(
    name = "dependent_test_proto",
    srcs = ["dependent_test.proto"],
    deps = [":test_proto"],
)

py_proto_library(
    name = "dependent_test_py_pb2",
    deps = [
        ":dependent_test_proto",
        ":test_proto",
    ],
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
