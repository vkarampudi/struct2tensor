load("//struct2tensor:struct2tensor.bzl", "s2t_proto_library", "s2t_proto_library_cc")

package(
    default_visibility = ["@//:__subpackages__"],
)

licenses(["notice"])

s2t_proto_library(
    name = "query_metadata_proto",
    srcs = ["query_metadata.proto"],
    deps = ["@com_github_tensorflow_metadata//tensorflow_metadata/proto/v0:cc_metadata_v0_proto_cc"],
)

s2t_proto_library_cc(
    name = "query_metadata_cc_proto",
    deps = [":query_metadata_proto"],
)

load("@com_google_protobuf//bazel:py_proto_library.bzl", "py_proto_library")

py_proto_library(
    name = "query_metadata_py_pb2",
    deps = [
        ":query_metadata_proto",
        "@com_github_tensorflow_metadata//tensorflow_metadata/proto/v0:metadata_v0_proto_py_pb2",
    ],
)
