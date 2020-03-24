from genie.utils.diff import Diff

diff output1 output2 --output diff

with open ('output1') as a:
    output = a.read()

with open ('output2') as b:
    output1 = b.read()

diff = Diff(output.info, output1.info)
diff.findDiff()
print(diff)