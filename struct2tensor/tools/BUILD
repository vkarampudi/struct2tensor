# Placeholder: load py_binary
# Placeholder: load py_library
# Placeholder: load py_test

# Copyright 2020 Google LLC
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
licenses(["notice"])

package(
    default_visibility = ["//struct2tensor:__subpackages__"],
)

py_library(
    name = "build_docs_lib",
    srcs = ["build_docs.py"],
    deps = [
        "//struct2tensor",
        "//struct2tensor:struct2tensor_expression_impl",
        "@absl_py//absl:app",
        "@pyyaml//:pyyaml",
        "@absl_py//absl/flags",
    ],
)

py_binary(
    name = "build_docs",
    srcs = ["build_docs.py"],
    deps = [
        ":build_docs_lib",
    ],
)
