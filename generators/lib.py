"""Helpers for rendering canonical data values as D source code."""

import textwrap
from collections.abc import Callable, Iterable
from typing import Any

INDENT = "    "

_ESCAPES = {
    "\\": "\\\\",
    '"': '\\"',
    "\n": "\\n",
    "\r": "\\r",
    "\t": "\\t",
    "\0": "\\0",
}


def d_string(value: str) -> str:
    """Render a string as a D double-quoted string literal."""
    chars = []
    for char in value:
        if char in _ESCAPES:
            chars.append(_ESCAPES[char])
        elif not char.isprintable():
            chars.append(f"\\U{ord(char):08x}")
        else:
            chars.append(char)
    return '"' + "".join(chars) + '"'


def d_lines(lines: Iterable[str]) -> str:
    """Render lines of text as a string, with one line of text per line."""
    text = "\n".join(lines)
    literals = [d_string(line) for line in text.splitlines(keepends=True)]
    return " ~\n".join(INDENT + literal for literal in literals)


def d_int(value: int) -> str:
    """Render an integer as a D integer literal."""
    return str(value)


def d_grouped_int(value: int) -> str:
    """Render an integer, separating groups of digits when it has five or more."""
    return f"{value:_}" if abs(value) >= 10_000 else str(value)


def d_bool(value: bool) -> str:
    """Render a boolean as a D boolean literal."""
    return "true" if value else "false"


def d_array(values: Iterable[Any], render: Callable[[Any], str] = d_int) -> str:
    """Render an array literal with one element per line."""
    lines = ["["]
    lines.extend(f"{INDENT}{render(value)}," for value in values)
    lines.append("]")
    return "\n".join(lines)


def d_inline_array(values: Iterable[Any], render: Callable[[Any], str] = d_int) -> str:
    """Render an array literal on a single line."""
    return "[" + ", ".join(render(value) for value in values) + "]"


def is_error(expected: Any) -> bool:
    """Report whether a canonical expected value describes an error."""
    return isinstance(expected, dict) and "error" in expected


def indent(text: str, levels: int = 1) -> str:
    """Indent every non-empty line of text."""
    return textwrap.indent(text, INDENT * levels)


def assert_true(expression: str) -> str:
    """Assert that an expression holds."""
    return f"assert({expression});"


def assert_false(expression: str) -> str:
    """Assert that an expression does not hold."""
    return f"assert(!{expression});"


def assert_eq(actual: str, expected: str) -> str:
    """Assert that two expressions are equal."""
    return f"assert({actual} == {expected});"


def assert_equal(first: str, second: str, wrap: bool = False) -> str:
    """Assert that two ranges are equal, optionally one argument per line."""
    prefix = "assert(equal("
    separator = ",\n" + " " * len(prefix) if wrap else ", "
    return f"{prefix}{first}{separator}{second}));"


def assert_throws(expression: str) -> str:
    """Assert that evaluating an expression throws."""
    return f"assertThrown({expression});"
