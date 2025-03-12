Automated Check On Repo


What this command does:
This command, given an absolute path to a repo and time, will return you a daily update on the specified repo at that time. The update will be logged in the same folder as this shell script under log.txt. It will mention the repo, its status, and what time it ran. You can check on the repo multiple times a day if you want.



Why/When this command is useful:
Now, you could easily run git status, but what if you are working on multiple repos at a time? (This usually applies to students taking multiple classes or SWE working on multiple projects for work.) 



How you can use this command:

First, give permission to run this shell script by doing chmod +x gitauto.sh.

Then, while gitauto.sh is in your current directory, run the following:
Conditions: Hours must be between 0 and 23, and minutes must be between 0 and 59

./gitauto.sh \<absolute\_path\_to\_repo> \<hours:minute>

Example:
./gitauto.sh ~/cs131 19:31
Cron job has been scheduled to check the repository at 19:31.

cat log.txt
No uncommitted changes in /home/william_ngo/cs131 on Wed Mar 12 02\:30:18 UTC 2025.


