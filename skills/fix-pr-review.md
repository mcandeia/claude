---
name: fix-pr-review
description: Fix code based on PR review comments
---

## Workflow

1. Read the review context provided in the TASK_CONTEXT environment variable or prompt
2. Checkout the existing PR branch
3. Understand each review comment and what changes are requested
4. **Before implementing anything**, check if the user is asking for proposals, options, or suggestions (e.g., "propose approaches", "what do you think?", "suggest alternatives"). If so, output `:::CLARIFICATION::: <your proposals>` and stop — do NOT implement anything.
5. If a review comment is genuinely ambiguous and you cannot determine the intended fix, output `:::CLARIFICATION::: <your question>` and stop.
6. Implement the requested fixes
7. Run any existing tests
8. Commit with a message like "address review feedback for PR #{PR_NUMBER}"
9. Push to the same branch (this updates the PR automatically)
10. Comment on the PR that review feedback has been addressed using `gh pr comment`
11. Output :::TASK_COMPLETE::: when done
