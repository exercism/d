
Each exercise supplies the unit tests. You provide the implementation.
Each file will produce a console executable that runs the tests. Running the test executable
prints messages for each failing test and reports a non-zero exit status when tests fail.

*Note:* Your code is being tested against the test suite every time you build your project.
If your code does not pass the one or more tests but is valid D code, it will still be compiled.

Working through each exercise is a process of:

* Creating the initial build with **dmd -run hello.d -de -w -unittest**
* For each unit test:
 * Satisfy compile errors to make the test fail.
 * Implement just enough to make the test pass.
 * Refactor your implementation to enhance readability, reduce duplication, etc.
 * Enable the next test

@TODO add IDE related instructions.

