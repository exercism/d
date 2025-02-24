#! /usr/bin/env python3

import json
import os

EXERCISES = [
    'affine-cipher',
    'all-your-base',
    'atbash-cipher',
    'book-store',
    'collatz-conjecture',
    'game-of-life',
    'house',
    'isbn-verifier',
    'killer-sudoku-helper',
    'kindergarten-garden',
    'knapsack',
    'largest-series-product',
    # 'luhn',
    'micro-blog',
    'minesweeper',
    'pascals-triangle',
    'phone-number',
    'pythagorean-triplet',
    'run-length-encoding',
    'state-of-tic-tac-toe',
]

with open(f'config.json', encoding='utf-8') as data_file:
    config = json.load(data_file)

for slug in EXERCISES:
    snake_slug = slug.replace('-', '_')

    exercise_name = None
    for entry in config['exercises']['practice']:
        if entry['slug'] == slug:
            exercise_name = entry['name']

    # TODO: Use configlet's cache: https://github.com/exercism/arm64-assembly/blob/41d13a0e22d32c810e832c2bc9b62b6ac1f80ef4/generators/generate#L23
    with open(f'../problem-specifications/exercises/{slug}/canonical-data.json', encoding='utf-8') as data_file:
        parsed_json = json.load(data_file)

    # TODO: Parse tests.toml: https://github.com/exercism/arm64-assembly/blob/41d13a0e22d32c810e832c2bc9b62b6ac1f80ef4/generators/generate#L116
    reimplemented = []

    def output_case_to_reimplemented(case):
        if 'property' in case.keys():
            property = case['property']
            if 'reimplements' in case.keys():
                reimplemented.append(case['reimplements'])
        elif 'cases' in case.keys():
            for inner_case in case['cases']:
                output_case_to_reimplemented(inner_case)
        else:
            print(f'Missing "property": {case}')

    for case in parsed_json['cases']:
        if 'uuid' in case.keys():
            output_case_to_reimplemented(case)
        else:
            for inner_case in case['cases']:
                output_case_to_reimplemented(inner_case)   

    SOURCE_DIR=f'exercises/practice/{slug}/source'
    META_DIR=f'exercises/practice/{slug}/.meta'

    if not os.path.exists(SOURCE_DIR):
        os.mkdir(SOURCE_DIR)
    if not os.path.exists(META_DIR):
        os.mkdir(META_DIR)

    # TODO: Remove this when we instead parse tests.toml
    # Currently I rely on a manual git diff to detect changes.
    with open(f'{META_DIR}/tests.toml', 'w', encoding='utf-8') as toml_file:
        toml_file.write('# This is an auto-generated file.\n')
        toml_file.write('#\n')
        toml_file.write('# Regenerating this file via `configlet sync` will:\n')
        toml_file.write('# - Recreate every `description` key/value pair\n')
        toml_file.write('# - Recreate every `reimplements` key/value pair, where they exist in problem-specifications\n')
        toml_file.write('# - Remove any `include = true` key/value pair (an omitted `include` key implies inclusion)\n')
        toml_file.write('# - Preserve any other key/value pair\n')
        toml_file.write('#\n')
        toml_file.write('# As user-added comments (using the # character) will be removed when this file\n')
        toml_file.write('# is regenerated, comments can be added via a `comment` key.\n')


        def output_case_to_tolm(case, parent_description = None):
            description = case['description']
            if parent_description:
                description = parent_description + ' -> ' + description
            if 'cases' in case.keys():
                for inner_case in case['cases']:
                    output_case_to_tolm(inner_case, description)
                return

            uuid = case['uuid']
            toml_file.write('\n')
            toml_file.write(f'[{uuid}]\n')
            toml_file.write(f'description = "{description}"\n')
            if uuid in reimplemented:
                toml_file.write('include = false\n')
            if 'reimplements' in case.keys():
                reimplements = case['reimplements']
                toml_file.write(f'reimplements = "{reimplements}"\n')


        for case in parsed_json['cases']:
            if 'uuid' in case.keys():
                output_case_to_tolm(case)
            else:
                for inner_case in case['cases']:
                    output_case_to_tolm(inner_case, case['description'])   

    with open(f'{SOURCE_DIR}/{snake_slug}.d', 'w', encoding='utf-8') as test_file:

        test_file.write(f'module {snake_slug};\n\n')

        if slug in ['knapsack']:
            test_file.write("""\
struct Item {
    uint weight;
    uint value;
}

uint maximumValue(Item[] items, uint maximumWeight)
{
    // implement this function
}

""")


        if slug in ['pythagorean-triplet']:
            test_file.write("""\
struct Triplet {
    uint a;
    uint b;
    uint c;
}

pure Triplet[] tripletsWithSum(uint n)
{
    // implement this function
}

""")


        if slug in ['pascals-triangle']:
            test_file.write("""\
pure int[][] rows(int count)
{
    // implement this function
}

""")

        if slug in ['killer-sudoku-helper']:
            test_file.write("""\
pure uint[][] combinations(uint sum, uint size, immutable uint[] exclude)
{
    // implement this function
}

""")

        if slug in ['kindergarten-garden']:
            test_file.write("""\
pure string[4] plants(immutable string diagram, immutable string student)
{
    // implement this function
}

""")

        if slug in ['affine-cipher']:
            test_file.write("""\
pure string encode(immutable string phrase, uint a, uint b)
{
    // implement this function
}

pure string decode(immutable string phrase, uint a, uint b)
{
    // implement this function
}

""")


        if slug in ['house']:
            test_file.write("""\
pure string recite(int startVerse, int endVerse)
{
    // implement this function
}

""")

        if slug in ['all-your-base']:
            test_file.write("""\
pure int[] rebase(int inputBase, immutable int[] digits, int outputBase)
{
    // implement this function
}

""")

        if slug in ['game-of-life']:
            test_file.write("""\
pure int[][] tick(immutable int[][] matrix)
{
    // implement this function
}

""")


        if slug in ['state-of-tic-tac-toe']:
            test_file.write("""\
enum State {
    win,
    draw,
    ongoing
}

pure State gamestate(immutable string[] board)
{
    // implement this function
}

""")



        if slug in ['palindrome-products']:
            test_file.write("""\
struct Result {
    int value;
    int factors;
}

pure Result smallest(immutable int min, immutable int max)
{
    // implement this function
}

""")


        if slug in ['minesweeper']:
            test_file.write("""\
pure string[] annotate(immutable string[] minefield)
{
    // implement this function
}

""")


        if slug in ['diamond']:
            test_file.write("""\
pure string[] rows(char letter)
{
    // implement this function
}

""")



        test_file.write(f'unittest\n')
        test_file.write('{\n')

        if slug in ['state-of-tic-tac-toe', 'affine-cipher', 'killer-sudoku-helper']:
            test_file.write(f'    import std.algorithm.comparison : equal;\n')

        if slug in ['killer-sudoku-helper']:
            test_file.write(f'\n')

        if slug in ['largest-series-product', 'all-your-base', 'state-of-tic-tac-toe', 'affine-cipher']:
            test_file.write(f'    import std.exception : assertThrown;\n\n')

        test_file.write(f'    immutable int allTestsEnabled = 0;\n\n')

        count = 0
        indent = '    '
   

        def output_case_to_test(case, parent_description = None):
            global count
            global indent

            description = case['description']
            if parent_description:
                if slug not in ['atbash-cipher']:
                    description = parent_description + '-' + description
                if slug == 'kindergarten-garden':
                    description = description.replace('garden-garden', 'garden')
            if 'cases' in case.keys():
                for inner_case in case['cases']:
                    output_case_to_test(inner_case, description)
                return

            uuid = case['uuid']
            if uuid in reimplemented:
                return


            if 'property' in case.keys():
                property = case['property']

            if count > 1:
                test_file.write('\n')


            input = case['input']
            expectation = case['expected']
            call = 'TBD'

            description = description[0].upper() + description[1:]
            test_file.write(f'{indent}// {description}\n')

            if slug == 'luhn':
                value = input['value']
                if expectation:
                    test_file.write(f'{indent}assert(valid("{value}"));\n')
                else:
                    test_file.write(f'{indent}assert(!valid("{value}"));\n')

            if slug == 'isbn-verifier':
                isbn = input['isbn']
                if expectation:
                    test_file.write(f'{indent}assert({property}("{isbn}"));\n')
                else:
                    test_file.write(f'{indent}assert(!{property}("{isbn}"));\n')

            if slug == 'largest-series-product':
                digits = input['digits']
                span = input['span']
                if expectation.__class__ != dict:
                    test_file.write(f'{indent}assert({property}("{digits}", {span}) == {expectation});\n')
                else:
                    test_file.write(f'{indent}assertThrown({property}("{digits}", {span}));\n')


            if slug == 'kindergarten-garden':
                diagram = input['diagram'].replace('\n', '\\n')
                student = input['student']


                test_file.write(indent + '{\n')
                test_file.write(f'{indent}    immutable string diagram = "{diagram}";\n')
                test_file.write(f'{indent}    string[4] expected = [\n')
                for plant in expectation:
                    test_file.write(f'{indent}        "{plant}",\n')
                test_file.write(f'{indent}    ];\n')
                test_file.write(f'{indent}    assert({property}(diagram, "{student}") == expected);\n')
                test_file.write(indent + '}\n')



            if slug == 'pascals-triangle':
                count = input['count']
                test_file.write(indent + '{\n')
                test_file.write(f'{indent}    int[][] expected = [\n')
                for row in expectation:
                    test_file.write(f'{indent}        {row},\n')
                test_file.write(f'{indent}    ];\n')
                test_file.write(f'{indent}    assert({property}({count}) == expected);\n')
                test_file.write(indent + '}\n')

            if slug == 'atbash-cipher':
                phrase = input['phrase']
                test_file.write(f'{indent}assert({property}("{phrase}") == "{expectation}");\n')

            if slug == 'affine-cipher':
                phrase = input['phrase']
                a = input["key"]['a']
                b = input["key"]['b']

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}assert(equal("{expectation}", {property}("{phrase}", {a}, {b})));\n')

                else:
                    test_file.write(f'{indent}assertThrown({property}("{phrase}", {a}, {b}));\n')


            if slug == 'micro-blog':
                phrase = input['phrase']
                test_file.write(f'{indent}assert({property}("{phrase}") == "{expectation}");\n')



            if slug == 'killer-sudoku-helper':
                sum_ = input['cage']['sum']
                size = input['cage']['size']
                exclude = input['cage']['exclude']
                test_file.write(f'{indent}assert(equal({expectation}, {property}({sum_}, {size}, {exclude})));\n')


            if slug == 'phone-number':
                phrase = input['phrase']

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}assert({property}("{phrase}") == "{expectation}");\n')
                else:
                    test_file.write(f'{indent}assertThrown({property}("{phrase}"));\n')


            if slug == 'knapsack':
                maximumWeight = input['maximumWeight']
                items = input['items']

                test_file.write(indent + '{\n')
                test_file.write(f'{indent}    Item[] items = [\n')
                for item in items:
                    weight = item['weight']
                    value = item['value']
                    test_file.write(f'{indent}        Item({weight}, {value}),\n')
                test_file.write(f'{indent}    ];\n')
                test_file.write(f'{indent}    assert(maximumValue(items, {maximumWeight}) == {expectation});\n')
                test_file.write(indent + '}\n')


            if slug in ['pythagorean-triplet']:
                n = input['n']

                test_file.write(indent + '{\n')
                test_file.write(f'{indent}    Triplet[] expected = [\n')
                for item in expectation:
                    a = item[0]
                    b = item[1]
                    c = item[2]
                    test_file.write(f'{indent}        Triplet({a}, {b}, {c}),\n')
                test_file.write(f'{indent}    ];\n')
                test_file.write(f'{indent}    assert(tripletsWithSum({n}) == expected);\n')
                test_file.write(indent + '}\n')



            if slug in ['house']:
                startVerse = input['startVerse']
                endVerse = input['endVerse']

                test_file.write(indent + '{\n')
                test_file.write(f'{indent}    string expected =\n')
                for (i, line) in enumerate(expectation):
                    if i + 1 == len(expectation):
                        test_file.write(f'{indent}        "{line}";\n')
                    else:
                        test_file.write(f'{indent}        "{line}\\n" ~\n')
                test_file.write(f'{indent}    assert({property}({startVerse}, {endVerse}) == expected);\n')
                test_file.write(indent + '}\n')


            if slug == 'all-your-base':
                inputBase = input['inputBase']
                digits = input['digits']
                outputBase = input['outputBase']

                test_file.write(indent + '{\n')

                test_file.write(f'{indent}    immutable int[] digits = [\n')
                for digit in digits:
                    test_file.write(f'{indent}        {digit},\n')
                test_file.write(f'{indent}    ];\n')

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}    int[] expected = [\n')
                    for digit in expectation:
                        test_file.write(f'{indent}        {digit},\n')
                    test_file.write(f'{indent}    ];\n')

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}    assert(rebase({inputBase}, digits, {outputBase}) == expected);\n')
                else:
                    test_file.write(f'{indent}    assertThrown(rebase({inputBase}, digits, {outputBase}));\n')

                test_file.write(indent + '}\n')



            if slug == 'game-of-life':
                matrix = input['matrix']

                test_file.write(indent + '{\n')

                test_file.write(f'{indent}    immutable int[][] matrix = [\n')
                for row in matrix:
                    test_file.write(f'{indent}        {row},\n')
                test_file.write(f'{indent}    ];\n')

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}    int[][] expected = [\n')
                    for row in expectation:
                        test_file.write(f'{indent}        {row},\n')
                    test_file.write(f'{indent}    ];\n')

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}    assert(tick(matrix) == expected);\n')

                test_file.write(indent + '}\n')





            if slug == 'minesweeper':
                minefield = input['minefield']

                test_file.write(indent + '{\n')

                test_file.write(f'{indent}    immutable string[] minefield = [\n')
                for row in minefield:
                    test_file.write(f'{indent}        "{row}",\n')
                test_file.write(f'{indent}    ];\n')

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}    string[] expected = [\n')
                    for row in expectation:
                        test_file.write(f'{indent}        "{row}",\n')
                    test_file.write(f'{indent}    ];\n')

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}    assert(annotate(minefield) == expected);\n')

                test_file.write(indent + '}\n')


            if slug == 'state-of-tic-tac-toe':
                board = input['board']

                test_file.write(indent + '{\n')

                test_file.write(f'{indent}    immutable string[] board = [\n')
                for row in board:
                    test_file.write(f'{indent}        "{row}",\n')
                test_file.write(f'{indent}    ];\n')

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}    assert(equal(gamestate(board), State.{expectation}));\n')
                else:
                    error = expectation["error"]
                    test_file.write(f'{indent}    assertThrown(gamestate(board));\n')


                test_file.write(indent + '}\n')



            if slug == 'diamond':
                letter = input['letter']

                test_file.write(indent + '{\n')

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}    string[] expected = [\n')
                    for row in expectation:
                        test_file.write(f'{indent}        "{row}",\n')
                    test_file.write(f'{indent}    ];\n')

                if expectation.__class__ != dict:
                    test_file.write(f'{indent}    assert(rows(\'{letter}\') == expected);\n')

                test_file.write(indent + '}\n')






            if slug == 'book-store':
                basket = input['basket']

                test_file.write(indent + '{\n')
                test_file.write(f'{indent}    immutable int[] basket = {basket};\n')
                test_file.write(f'{indent}    assert({property}(basket) == {expectation});\n')
                test_file.write(indent + '}\n')


            if slug in ['collatz-conjecture']:
                number = input['number']
                if expectation.__class__ != dict:
                    test_file.write(f'{indent}assert({property}({number}) == {expectation});\n')
                else:
                    test_file.write(f'{indent}assertThrown({property}({number}));\n')


            if count == 0:
                indent = '        '
                test_file.write('\n')
                test_file.write('    static if (allTestsEnabled)\n')
                test_file.write('    {\n')
            count += 1

        for case in parsed_json['cases']:
            output_case_to_test(case)

        test_file.write('    }\n')
        test_file.write('}\n')
