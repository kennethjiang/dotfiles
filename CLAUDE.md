# Global Claude Code Rules

## Git Commit Policy

**Never commit or revert commits without explicit user confirmation.**

When the user asks to commit changes:
1. Run `git status` and `git diff` to review the changes
2. Generate a proposed commit message
3. Present the commit message to the user and ask for confirmation
4. Only execute `git commit` after the user explicitly confirms

When the user asks to revert or amend commits:
1. Explain what will be reverted/amended
2. Ask for confirmation before executing any `git revert`, `git reset`, or `git commit --amend` commands
3. Only proceed after explicit user approval

This applies to all git operations that modify commit history.

## Submodule Policy

**Never commit or attempt to commit submodule updates.**

When `git status` shows modified submodules (e.g., `modified: some-submodule (new commits)`):
- Do not stage or commit the submodule change
- Do not include submodules when running `git add`
- Leave submodule management to the user

## Testing Principles

1. Always test your code change unless the change is not testable.

2. If the change is not testable, highlight the reason why it's not testable to get the user's attention.

3. By default, do end-to-end testing on everything that may potentially be impacted by your change on the local dev environment.

4. Search for how the dev environment should be started if it's not obvious.

5. Look for README files in the project for related info.

6. Check if the local dev is already running before you try to start it again.
