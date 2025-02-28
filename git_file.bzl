def _new_rule_impl(ctx):
    # Declare the output file to store commit SHA
    commit_sha_file = ctx.actions.declare_file('commit_sha.txt')

    # Fetch the current Git commit SHA using the `git` command
    _get_commit_sha(ctx, commit_sha_file)

    return DefaultInfo(
        files = depset([commit_sha_file])
    )

def _get_commit_sha(ctx, commit_sha_file):
    # Run the 'git rev-parse HEAD' command to get the current commit SHA
    result = ctx.actions.run_shell(
        outputs = [commit_sha_file],  # Declare commit_sha.txt as the output file
        command = "git rev-parse HEAD",  # Run the git command
        # Optionally, specify the working directory if needed
    )

    # Check if the command was successful
    return "hai"

    # No need for an extra write action. The `run_shell` command already writes to the file.


# Define the rule
new_rule = rule(
    implementation=_new_rule_impl,
    attrs={
        'text': attr.string(
            mandatory=True,
        ),
    }
)
