# Things to look for in code review

- issues of general code quality
- (non)-conformity to best practices
- architectural issues
- security issues
- maintainability issues
- synchronisation issues / race conditions
- unchecked / improperly checked boundary conditions
- resource leakage / unstable resource consumption patterns
- lack of code / config reuse despite opportunities to do so
- monolithic config files despite opportunity to use a directory structure with multiple files
- inconsistency or ambiguity in comments vs the code / config they accompany
- leaky abstractions
- abstractions so thin as to not add worthwhile value 
