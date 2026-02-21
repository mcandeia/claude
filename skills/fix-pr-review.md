---
name: fix-pr-review
description: Fix code based on PR review comments
---

## Workflow

1. Read the review context provided in the TASK_CONTEXT environment variable or prompt
2. Checkout the existing PR branch
3. Understand each review comment and what changes are requested
4. Implement the requested fixes
5. Run any existing tests
6. Commit with a message like "address review feedback for PR #{PR_NUMBER}"
7. Push to the same branch (this updates the PR automatically)
8. Comment on the PR that review feedback has been addressed using `gh pr comment`
9. Output :::TASK_COMPLETE::: when done
