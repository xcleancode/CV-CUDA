#!/bin/bash -e

# SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [ $# != 1 ]; then
    echo "Invalid arguments"
    echo "Usage: $(basename "$0") <C data type header path>"
    exit 1
fi

dtype_header=$1
shift

sed -n 's@^#define NVCV_DATA_TYPE_\([0-9][^ ]\+\) \+NVCV_DETAIL.*@DEF_NUM(\1)@gp' $dtype_header
sed -n 's@^#define NVCV_DATA_TYPE_\([^0-9][^ ]\+\) \+NVCV_DETAIL.*@DEF(\1)@gp' $dtype_header
