# Minimal Gomplate Test Template

This template project is intended for tesing `gomplate` for use with a GitHub Template.

## Requirements

The [gomplate](https://docs.gomplate.ca/installing/) CLI must be installed and available on your `PATH`.

For example, using `go install` to install `gomplate`:

```bash
go install github.com/hairyhenderson/gomplate/v3/cmd/gomplate@latest
```

Verify gomplate is successfully installed and available on your `PATH`:

```bash
$ gomplate --version
gomplate version 0.0.0
```

## Usage

1. Create a new repository in GitHub and select this template as the "Repository template".

2. After creating the new repository, clone it locally.

3. From the local repository root folder, create and switch to a new branch, for example `pr-init-template`:

   ```bash
   git switch -c pr-init-template
   ```

4. Modify the included `skeleton-data.yaml` input data file with the appropriate substitution
   values for the provided properties for your new project.

5. Run the following command to run gomplate, which will place the templatized
   folders and files into the `./out` directory.

   ```bash
   gomplate --verbose
   ```

6. Next, stash your input data file in case it is needed later to start over:

   ```bash
   git stash push -m "input data backup" -- skeleton-data.yaml
   ```

7. Replace the contents of the static template files with the templatized
   folders and files from the `./out` directory.

   ```bash
   ls -A | grep -xv "out" | grep -xv ".git" | xargs rm -rf && \
       mv -vf out/{.,}* . ; \
       rm -r out
   ```

   - If you need to start the templatization process over, reset the git index to origin/main.

     **NOTE**: Backup files if necessary first, this will delete **all** local changes.

     ```bash
     git reset --hard origin/main && git clean -dfx
     ```

     The input data file can then be recovered from the stash to start over with.

     ```bash
     git stash apply
     ```

8. When satisified with the results, commit, push, and create the first Pull Request!

   ```bash
   git add -A
   git status
   git commit -m "ci: initial templatization"
   git push -u origin pr-init-template
   ```
