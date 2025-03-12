Automated Check On Repo


What this command does:
This command, given a absolute path to a repo and time, will return for you a daily update on the specified repo at that time.



Why/When this command is useful:
Now, you could easily run git status but what if you are working on multiple repos at a time? (Usually applies to students taking multiple classes or SWE working on multiple projects for work) 



How you can use this command:

First give permission to run this shell script by doing chmod +x gitauto.sh.

Then, while gitauto.sh is in your current directory, run the following:
Conditions: Hours must be between 0-23 and minutes must be between 0-59

./gitauto.sh \<absolute\_path\_to\_repo> \<hours:minute>

Example:



