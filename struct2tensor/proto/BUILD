load("//struct2tensor:struct2tensor.bzl", "s2t_proto_library_py")
load("@rules_cc//cc:defs.bzl", "cc_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")

package(
    default_visibility = ["@//:__subpackages__"],
)

licenses(["notice"])

proto_library(
    name = "query_metadata_proto",
    srcs = ["query_metadata.proto"],
    deps = ["@com_github_tensorflow_metadata//tensorflow_metadata/proto/v0:metadata_v0_proto"],
)

cc_proto_library(
    name = "query_metadata_cc_proto",
    deps = [":query_metadata_proto"],
)

s2t_proto_library_py(
    name = "query_metadata_py_pb2",
    srcs = ["query_metadata.proto"],
)

s2t_proto_library_py(
    name = "metadata_v0_py_lib",
    proto_library = "@com_github_tensorflow_metadata//tensorflow_metadata/proto/v0:metadata_v0_proto",
)
