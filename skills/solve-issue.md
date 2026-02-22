---
name: solve-issue
description: Solve a GitHub issue by implementing the requested changes
---

## Workflow

1. Read the issue context provided in the TASK_CONTEXT environment variable or prompt
2. Understand what needs to be done
3. Explore the codebase to understand the relevant code
4. **Before implementing anything**, check if the user is asking for proposals, options, or suggestions (e.g., "propose approaches", "what do you think?", "suggest alternatives"). If so, output `:::CLARIFICATION::: <your proposals>` and stop — do NOT implement anything.
5. If the requirements are genuinely ambiguous and you cannot make a reasonable decision, output `:::CLARIFICATION::: <your question>` and stop.
6. Implement the solution
7. Run any existing tests (`make test`, `npm test`, `go test ./...`, etc.)
8. Create a new branch: `claude/issue-{ISSUE_NUMBER}`
9. Commit your changes with a descriptive message referencing the issue
10. Push the branch and create a PR using `gh pr create`
11. Output :::PR_URL::: <url> with the PR URL
12. Output :::TASK_COMPLETE::: when done
