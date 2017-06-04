
Each exercise supplies the unit tests. You provide the implementation.
Each file will produce a console executable that runs the tests. Running the test executable
prints messages for each failing test and reports a non-zero exit status when tests fail.


*Note* Your code is being tested against the test suite every time you build your project.
If your code does not pass the one or more tests but is valid D code, it will still be compiled.


Working through each exercise is a process of:

* Creating the initial build with **dmd example.d -de -w -unittest**
* Run  with **./example or example.exe** depending on the platform
* For each unit test:
  * Satisfy compile errors to make the test fail.
  * Implement just enough to make the test pass.
  * Refactor your implementation to enhance readability, reduce duplication, etc.
  * Enable the next test

*Note:* D has support for unit testing direct in the language so usually the unit tests
reside in the same file as the implementation. The unittests are ran before the body of
main and are enabled in the final executable by using the **-unittest** compiler switch.

@TODO add IDE related instructions.

