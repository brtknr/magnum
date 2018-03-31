#!/bin/bash
#
# Copyright (c) 2016 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [ ${DIB_DEBUG_TRACE:-0} -gt 0 ]; then
    set -x
fi
set -eu
set -o pipefail

# check that image is valid
qemu-img check -q $1

# validate estimated size
FILESIZE=$(stat -c%s "$1")
MIN_SIZE=629145600 # 600MB

if [ $FILESIZE -lt $MIN_SIZE ] ; then
    echo "Error: generated image size is lower than expected."
    exit 1
fi
