---
name: solve-issue
description: Solve a GitHub issue by implementing the requested changes
---

## Workflow

1. Read the issue context provided in the TASK_CONTEXT environment variable or prompt
2. Understand what needs to be done
3. Explore the codebase to understand the relevant code
4. Implement the solution
5. Run any existing tests (`make test`, `npm test`, `go test ./...`, etc.)
6. Create a new branch: `claude/issue-{ISSUE_NUMBER}`
7. Commit your changes with a descriptive message referencing the issue
8. Push the branch and create a PR using `gh pr create`
9. Output :::PR_URL::: <url> with the PR URL
10. Output :::TASK_COMPLETE::: when done
