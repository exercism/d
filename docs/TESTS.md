# Tests

Each exercise supplies the unit tests.
You provide the implementation.
Each file will produce a console executable that runs the tests.
Running the test executable prints messages for each failing test and reports a non-zero exit status when tests fail.

*Note* Your code is being tested against the test suite every time you build your project.
If your code does not pass the one or more tests but is valid D code, it will still be compiled.

Working through each exercise is a process of:

* Running the tests with `dub test`
  * If you have chosen not to install DUB, you would instead use `dmd source/*.d -de -w -main -unittest`, then run the resulting binary.
* For each unit test:
  * Satisfy compile errors to make the test fail.
  * Implement just enough to make the test pass.
  * Refactor your implementation to enhance readability, reduce duplication, etc.
  * Enable the next test

*Note:* D has support for unit testing direct in the language so usually the unit tests reside in the same file as the implementation.
The unittests are run before the body of main and are enabled in the final executable by using the **-unittest** compiler switch.

## Interpreting unit test output

If all the tests succeed, the test output might look like this

```none
$ dub test
             Generating test runner configuration 'dnd-character-test-library' for 'library' (library).
    Starting Performing "unittest" build using dmd for x86_64.
    Building dnd-character ~master: building configuration [dnd-character-test-library]
     Linking dnd-character-test-library
     Running dnd-character-test-library
1 modules passed unittests
```

The test output can be difficult to read when there are test failures.

```none
$ dub test
             Generating test runner configuration 'dnd-character-test-library' for 'library' (library).
    Starting Performing "unittest" build using dmd for x86_64.
    Building dnd-character ~master: building configuration [dnd-character-test-library]
     Linking dnd-character-test-library
     Running dnd-character-test-library
core.exception.AssertError@source/dnd_character.d(102): unittest failure
----------------
??:? _d_unittestp [0x5568ff91bf05]
source/dnd_character.d:102 void dnd_character.__unittest_L30_C1() [0x5568ff911fee]
??:? void dnd_character.__modtest() [0x5568ff913760]
??:? int core.runtime.runModuleUnitTests().__foreachbody6(object.ModuleInfo*) [0x5568ff928f82]
??:? int object.ModuleInfo.opApply(scope int delegate(object.ModuleInfo*)).__lambda2(immutable(object.ModuleInfo*)) [0x5568ff9148f7]
??:? int rt.minfo.moduleinfos_apply(scope int delegate(immutable(object.ModuleInfo*))).__foreachbody2(ref rt.sections_elf_shared.DSO) [0x5568ff92003f]
??:? int rt.sections_elf_shared.DSO.opApply(scope int delegate(ref rt.sections_elf_shared.DSO)) [0x5568ff9200d1]
??:? int rt.minfo.moduleinfos_apply(scope int delegate(immutable(object.ModuleInfo*))) [0x5568ff91ffcd]
??:? int object.ModuleInfo.opApply(scope int delegate(object.ModuleInfo*)) [0x5568ff9148c9]
??:? runModuleUnitTests [0x5568ff928db7]
??:? void rt.dmain2._d_run_main2(char[][], ulong, extern (C) int function(char[][])*).runAll() [0x5568ff91d248]
??:? void rt.dmain2._d_run_main2(char[][], ulong, extern (C) int function(char[][])*).tryExec(scope void delegate()) [0x5568ff91d1d5]
??:? _d_run_main2 [0x5568ff91d13e]
??:? _d_run_main [0x5568ff91cf27]
/usr/include/dmd/druntime/import/core/internal/entrypoint.d:29 main [0x5568ff90f8f1]
??:? [0x7f473154a249]
??:? __libc_start_main [0x7f473154a304]
??:? _start [0x5568ff90f7e0]
1/1 modules FAILED unittests
Error Program exited with code 1
```

There's a lot of detailed stacktrace there, but the important line is the one above `----------------`

```none
core.exception.AssertError@source/dnd_character.d(102): unittest failure
```

That line tells you that the failing assertion is on **line 102** of file **dnd_character.d**.
You can use that to pinpoint the test that is not meeting expectations.

<!-- @TODO add IDE related instructions. -->
