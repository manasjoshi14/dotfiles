---
description: Thorough review of a GitHub PR using gh
argument-hint: <PR_NUMBER> [focus areas]
---

Perform a thorough code review for GitHub PR #$1 in the current repository.
Use `gh` for PR access and metadata.

If additional arguments are provided (`$ARGUMENTS`), treat them as focus areas and prioritize those parts of the review.

Workflow:
1. Validate tooling and auth:
   - `gh --version`
   - `gh auth status`
2. Gather PR context:
   - `gh pr view $1 --json number,title,body,author,baseRefName,headRefName,mergeable,additions,deletions,changedFiles,url`
   - `gh pr diff $1`
3. Analyze deeply:
   - Focus on correctness, regressions, security/privacy risks, performance, and test coverage gaps.
   - Verify claims against actual changed code; do not speculate without evidence.
4. Run relevant validation commands when available (tests/lint/typecheck for impacted areas). If not possible, state exactly what was not run.

Response format:
- Findings first, ordered by severity.
- For each finding: severity, why it matters, and precise file references.
- Then open questions/assumptions.
- Then brief change summary.
- Then a short final verdict (approve / request changes / comment-only) with rationale.

If PR #$1 does not exist or is inaccessible, explain the exact `gh` error and the next fix step.
