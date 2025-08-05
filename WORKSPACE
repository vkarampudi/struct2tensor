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

# CPU kernels for struct2tensors.

workspace(name = "struct2tensor")

load("//tf:tf_configure.bzl", "tf_configure")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


tf_configure(name = "local_config_tf")

http_archive(
    name = "rules_proto",
    sha256 = "6fb6767d1bef535310547e03247f7518b03487740c11b6c6adb7952033fe1295",
    strip_prefix = "rules_proto-6.0.2",
    url = "https://github.com/bazelbuild/rules_proto/releases/download/6.0.2/rules_proto-6.0.2.tar.gz",
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies")

rules_proto_dependencies()

load("@rules_proto//proto:setup.bzl", "rules_proto_setup")

rules_proto_setup()

load("@rules_proto//proto:toolchains.bzl", "rules_proto_toolchains")

rules_proto_toolchains()

_PROTOBUF_COMMIT = "4.25.6"  # 4.25.6

http_archive(
    name = "com_google_protobuf",
    sha256 = "ff6e9c3db65f985461d200c96c771328b6186ee0b10bc7cb2bbc87cf02ebd864",
    strip_prefix = "protobuf-%s" % _PROTOBUF_COMMIT,
    urls = [
        "https://github.com/protocolbuffers/protobuf/archive/v4.25.6.zip",
    ],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()


#####################################################################################

# ===== TensorFlow dependency =====
#
# TensorFlow is imported here instead of in tf_serving_workspace() because
# existing automation scripts that bump the TF commit hash expect it here.
#
# To update TensorFlow to a new revision.
# 1. Update the _TENSORFLOW_GIT_COMMIT value below to include the new git hash.
#    To find it look for the commit which updated the version number:
#    https://github.com/tensorflow/tensorflow/blob/3e6e3ceeedb0dbf2961051fe22002c98a255a6b8/tensorflow/core/public/version.h#L24
# 2. Get the sha256 hash of the archive with a command such as...
#    curl -L https://github.com/tensorflow/tensorflow/archive/<_TENSORFLOW_GIT_COMMIT>.tar.gz | sha256sum
#    and update the 'sha256' arg with the result.
# 3. Request the new archive to be mirrored on mirror.bazel.build for more
#    reliable downloads.

_TENSORFLOW_GIT_COMMIT = "3c92ac03cab816044f7b18a86eb86aa01a294d95"  # tf 2.17.1
_TENSORFLOW_ARCHIVE_SHA256 = "317dd95c4830a408b14f3e802698eb68d70d81c7c7cfcd3d28b0ba023fe84a68"

http_archive(
    name = "org_tensorflow_no_deps",
    sha256 = _TENSORFLOW_ARCHIVE_SHA256,
    urls = [
        "https://github.com/tensorflow/tensorflow/archive/%s.tar.gz" % _TENSORFLOW_GIT_COMMIT,
    ],
    strip_prefix = "tensorflow-%s" % _TENSORFLOW_GIT_COMMIT,
)

load("//third_party:python_configure.bzl", "local_python_configure")
local_python_configure(name = "local_config_python")
local_python_configure(name = "local_execution_config_python")


# Please add all new struct2tensor dependencies in workspace.bzl.
load("//struct2tensor:workspace.bzl", "struct2tensor_workspace")
struct2tensor_workspace()

# Initialize TensorFlow's external dependencies.
# load("@org_tensorflow//tensorflow:workspace3.bzl", "tf_workspace3")
# tf_workspace3()
# load("@org_tensorflow//tensorflow:workspace2.bzl", "tf_workspace2")
# tf_workspace2()
# load("@org_tensorflow//tensorflow:workspace1.bzl", "tf_workspace1")
# tf_workspace1()
# load("@org_tensorflow//tensorflow:workspace0.bzl", "tf_workspace0")
# tf_workspace0()

# boost is required for @thrift
git_repository(
    name = "com_github_nelhage_rules_boost",
    commit = "ce0caa8aa9593cb8664d4b5448978fbb94acc8b9",
    remote = "https://github.com/nelhage/rules_boost",
)

load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
boost_deps()

# Initialize bazel package rules' external dependencies.
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")
rules_pkg_dependencies()

http_archive(
    name = "absl_py",
    sha256 = "8a3d0830e4eb4f66c4fa907c06edf6ce1c719ced811a12e26d9d3162f8471758",
    strip_prefix = "abseil-py-2.1.0",
    urls = ["https://github.com/abseil/abseil-py/archive/v2.1.0.tar.gz"],
    build_file = "//third_party:absl_py.BUILD",
)

# Specify the minimum required bazel version.
load("@bazel_skylib//lib:versions.bzl", "versions")
versions.check("6.5.0")

http_archive(
    name = "com_google_googletest",
    sha256 = "53de8c75150430c217550ec6bb413029300120407f2de02ea8e20e89675f5e94",
    strip_prefix = "googletest-912db742531bf82efb01194bc08140416e3b3467",
    urls = ["https://github.com/google/googletest/archive/912db742531bf82efb01194bc08140416e3b3467.tar.gz"],
)
