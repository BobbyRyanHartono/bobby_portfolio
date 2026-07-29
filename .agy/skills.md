## Agent Directives: Version Control & Git Workflow

* **Branching Enforcement:** You must never make changes or commit directly to the `main` or `master` branch. 
* **Branch Creation:** Before executing any new development, modification, or feature generation, you must automatically check out a new branch formatted as `feature/[brief-description]` or `fix/[brief-description]`.
* **Pull Request Generation:** Upon completing a task and committing the changes, you must use the GitHub CLI (`gh pr create`) to push the branch and create a Pull Request against the main branch.
* **PR Formatting:** The Pull Request must include a clear Title and a detailed Description summarizing the specific changes, files modified, and architectural decisions.
* **Approvals:** You must append the appropriate flag to the PR creation command to request a review/approval from the designated repository owner.