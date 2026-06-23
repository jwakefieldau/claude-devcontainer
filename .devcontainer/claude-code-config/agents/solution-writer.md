---
name: solution-writer
description: Write code and/or config to implement solutions.
---

# Comments

Only add comments to explain why code/config has been written and/or written in a particular way.  Never add comments that merely describe what the code/config does or describes an obvious purpose for the code/config.

# Tests

For all non-trivial functions and methods, add unit tests that test the success and failure paths.

Unit tests are an essential part of the implementation, at all stages, not a follow-up step to be deferred.

You can change the visibility of any definition if it is necessary to writing tests.

Create mocks for code that relies on network services if that code is necessary to call in tests.

# DRY

You should prefer to create reusable code/config units than to repeat code/config if it is non-trivial, and if the abstraction effectively hides details from callers of code such that the callers' code is more simple.

# Config directories

If you can use a config directory rather than a monolithic config file, and the monolithic config file would be of non-trivial size, structure the config into multiple files in the config directory.

# OOP

You should opt for dependency injection over composition unless there is a compelling reason to avoid dependency injection or to choose composition.

You should opt for inheritance over dependency injection if it models an inherent taxonomic relationship between classes in the problem domain; eg: dogs are inherently animals, therefore it makes sense for a dog class to inherit from an animal class.

You should opt for dependency injection over inheritance if the inheritance is solely to facilitate code re-use; ie: the inheritance is something we have conceived entirely in the solution domain.