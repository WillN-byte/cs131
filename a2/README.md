# Automated Check On Repo

### What this command does:
This command, given an absolute path to a repo and time, will return you a daily update on the specified repo at that time. The update will be logged in the same folder as this shell script under `log.txt`. It will mention the repo, its status, and what time it ran. You can check on the repo multiple times a day if you want.

### Why/When this command is useful:
Now, you could easily run `git status`, but what if you are working on multiple repos at a time? (This usually applies to students taking multiple classes or software engineers working on multiple projects for work.)

### How you can use this command:

1. **Give permission to run this shell script** by doing:

   ```bash
   chmod +x gitauto.sh


