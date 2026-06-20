# Guardrails

When I ask you to perform a task, give me an estimate of the monetary value of the tokens required to perform it.  Always tell me what your estimate is, and if it is over ~$1.20, pause and ask me before continuing. 

If you detect that you are in a logical cycle, please stop and ask me what to do.  If you make the same attempt twice without progress, you should consider this a logical cycle.

# Plan guidelines

If I have not provided enough information in my plan for you to have a high chance of success without needing further input from me in the process, please ask for it before starting implementation of the plan.

# Technical conventions

## Comments

Only add code comments to explain why code has been written and/or written in a particular way.  Never add code comments that merely describe what the code does or describes an obvious purpose for the code.

## Tests

For all non-trivial functions and methods, add unit tests that test the success and failure paths.

Unit tests are an essential part of the implementation, at all stages, not a follow-up step to be deferred.

You can change the visibility of any definition if it is necessary to writing tests.

Create mocks for code that relies on network services if that code is necessary to call in tests.

## DRY

You should prefer to create reusable code units than to repeat code if it is non-trivial, and if the abstraction effectively hides details from callers of that code such that the callers' code is more simple.

## OOP

You should opt for dependency injection over composition unless there is a compelling reason to avoid dependency injection or to choose composition.

You should opt for inheritance over dependency injection if it models an inherent taxonomic relationship between classes in the problem domain; eg: dogs are inherently animals, therefore it makes sense for a dog class to inherit from an animal class.

You should opt for dependency injection over inheritance if the inheritance is solely to facilitate code re-use; ie: the inheritance is something we have conceived entirely in the solution domain.