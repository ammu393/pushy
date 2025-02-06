# pushy

Early versions of git were written in shell, hence to better understand git and shell programming to a more exetensive level, this project makes use of shell programming to mimic core sematics of popular control system Git. A total of 10 git commands are written in shell, and can be extended to use more git commands and workflow in the future.

### pushy-init
- creates an empty repository: a directory named .pushy is initialised to store the repository, and produces an error message if already created

### pushy-add
- adds contents of one or more files to 'index', before it is found in the main repository.

### pushy-commit 
- [-m]: -m option, saves a copy of all files in index to the repository, with a message to indicate this. Commits are numbered sequentially here unlike hashes in git (e.g. pushy-commit -m message)
- [-a]:  -a option, which causes all files already in the index to have their contents from the current directory added to the index before the commit (pushy-commit [-a] -m message)

### pushy-log
- The pushy-log command prints a line for every commit made to the repository. Each line should contain the commit number and the commit message.

### pushy-show
- The pushy-show should print the contents of the specified filename as of the specified commit.
If commit is omitted, the contents of the file in the index should be printed

### pushy-rm 
- pushy-rm [--force] [--cached] filenames...
- pushy-rm removes a file from the index, or, from the current directory and the index.
- If the --cached option is specified, the file is removed only from the index, and not from the current directory.
- like Git, push-rm will also include an error before deletion. The --force option overrides this, and will carry out the removal even if the user will lose work.

### pushy-status
- pushy-status shows the status of files in the current directory, the index, and the repository.

### pushy-branch
- pushy-branch [-d] [branch-name]
- pushy-branch either creates a branch, deletes a branch, or lists current branch names.If branch-name is omitted, the names of all branches are listed.
If branch-name is specified, then a branch with that name is created or deleted,
depending on whether the -d option is specified.

### pushy-checkout
- pushy-checkout switches branches.
- unlike Git, you can not specify a commit or a file: you can only specify a branch.