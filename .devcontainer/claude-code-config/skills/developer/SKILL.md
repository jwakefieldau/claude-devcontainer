---
name: developer
description: Develop a solution, with independent review, cyclically
disable-model-invocation: true
---

# Purpose

Develop a solution for the task described by $ARGUMENTS, unless $ARGUMENTS was not provided, in which case, use the prompt/plan provided.

# Setup

If any uncommitted changes to files tracked in the git repository exist when this skill is invoked, you must ask the user for confirmation to continue; warn them that we risk incorrectly scoping the review agent if we proceed.

Before making any changes, record the current HEAD commit and the output of `git status`, so that changes made by this task can be distinguished from changes that already existed.

Run all unit tests (build first if necessary) and record which tests fail, so that failures caused by this task can be distinguished from failures that already existed.

# Writing code

Use the `solution-writer` skill to prepare the code.

# Reviewing code

Use the `solution-reviewer` agent to review the code in a fresh context.  Provide it only:
- all changes made since `Setup`, across every round: the list of files changed or created by this task, the diff of changed files against the recorded HEAD, and the full content of newly created files
- any implementation declined in the `Writing code` section, the lack of which it should not report on
- the original prompt/plan

# Action loop

1. Follow the instructions in the `Writing code` section.
   - If this is the second or later round, incorporate the findings from the previous review round.
2. Run the unit tests newly written or modified in step 1, then all unit tests (build first if necessary).
   - If any fail that did not fail at `Setup`, fix them using the `solution-writer` skill.
   - Do not modify, skip or delete a test to make it pass unless the test itself is wrong; if you do, record it as a declined item with the rationale.
   - If the same failures remain after 2 attempts, stop and proceed to `Conclusion`.
3. Follow the instructions in the `Reviewing code` section
4. If either:
   - no issues remain
   - only minor issues remain
   - the same issue persists across consecutive reviews
   - 3 reviews have been completed

   then proceed to `Conclusion`
5. Otherwise, repeat steps 1-4.

# Conclusion

Summarise the changes, and any outstanding issues flagged in review.

List everything declined during the loop, with the rationale, separately from outstanding review issues.

List any outstanding test failures.
