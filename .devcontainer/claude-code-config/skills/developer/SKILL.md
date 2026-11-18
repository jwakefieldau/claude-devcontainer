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

# Writing documentation

Use the `documentation-writer` skill to prepare the documentation.  Create documents as necessary to provide coverage of new components, and update existing documents for consistency with changes to existing components, or that indirectly affect existing components.

# Reviewing documentation

Use the `documentation-reviewer` agent to review the documentation in a fresh context.  Provide it only:
- all changes made since `Setup`, across every round: the list of files changed or created by this task, the diff of changed files against the recorded HEAD, and the full content of newly created files
- any documentation declined in the `Writing documentation` section, the lack of which it should not report on
- the original prompt/plan

# Action loops

## Code

1. Follow the instructions in the `Writing code` section.
   - If this is the second or later round, incorporate the findings from the previous code review round.
2. Run the unit tests newly written or modified in step 1, then all unit tests (build first if necessary).
   - If any fail that did not fail at `Setup`, fix them using the `solution-writer` skill.
   - Do not modify, skip or delete a test to make it pass unless the test itself is wrong; if you do, record it as a declined item with the rationale.
   - If the same failures remain after 2 attempts, stop and proceed to `Conclusion`.
3. Follow the instructions in the `Reviewing code` section
4. If any of:
   - no code issues remain
   - only minor code issues remain
   - the same code issue persists across consecutive code reviews
   - 3 code reviews have been completed
   then proceed to `Documentation`
5. Otherwise, repeat steps 1-4.

## Documentation

1. Follow the instructions in the `Writing documentation` section.
   - If this is the second or later round, incorporate the findings from the previous documentation review round.
2. Follow the instructions in the `Reviewing documentation` section.
3. If any of:
   - no documentation issues remain
   - only minor documentation issues remain
   - the same documentation issue persists across consecutive documentation reviews
   - 3 documentation reviews have been completed
   then proceed to `Conclusion`
4. Otherwise, repeat steps 1-3.

# Conclusion

Summarise the changes, and any outstanding issues flagged in code or documentation review.

List everything declined during the code and documentation loops, with the rationale, separately from outstanding review issues.

List any outstanding test failures.
