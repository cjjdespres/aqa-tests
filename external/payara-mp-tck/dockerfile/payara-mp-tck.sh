#/bin/bash
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

source $(dirname "$0")/test_base_functions.sh
# Set up Java to be used by the payara test
echo_setup

TEST_OPTIONS=$1

cd ${PAYARA_HOME}/MicroProfile-TCK-Runners
mvn --batch-mode clean verify -Dpayara.version=5.184 $TEST_OPTIONS
test_exit_code=$?
find ./ -type d -name 'junitreports' -exec cp -r "{}" /testResults \;
exit $test_exit_code