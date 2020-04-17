# Example
# -------
#
#   Demonstration of Genie Robot Framework Keywords

** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot
Library        genie.libs.robot.GenieRobotApis

*** Variables ***
# Defining variables that can be used elsewhere in the test data.
# Can also be driven as dash argument at runtime
${testbed}     robot/tb.yaml
${trigger_datafile}     /home/dale/code/my-pyats-env/lib/python3.6/site-packages/genie/libs/sdk/genie_yamls/ios/trigger_datafile_ios.yaml
${verification_datafile}     /home/dale/code/my-pyats-env/lib/python3.6/site-packages/genie/libs/sdk/genie_yamls/ios/verification_datafile_ios.yaml

*** Test Cases ***
# Creating test cases from available keywords.

Connect
    use genie testbed "${testbed}"
    connect to devices "Boulder1"

parser show version
    ${output}=    parse "show version" on device "Boulder1"

Learn bgp
    ${output}=    learn "bgp" on device "Boulder1"

verify Bgp before trigger
    run verification "Verify_BgpAllNexthopDatabase" on device "Boulder1"

Trigger sleep
    run trigger "TriggerSleep" on device "DACONO" using alias "cli"

verify Bgp after trigger
    run verification "Verify_BgpAllNexthopDatabase" on device "Boulder1"

verify bgp count
    verify count "1" "bgp neighbors" on device "Boulder1"

verify bgp routes
    verify count "1" "bgp routes" on device "Boulder1"
