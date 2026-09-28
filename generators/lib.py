"""Helpers for rendering canonical data values as D source code."""

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
        elif ord(char) < 0x20 or ord(char) == 0x7F:
            chars.append(f"\\x{ord(char):02x}")
        else:
            chars.append(char)
    return '"' + "".join(chars) + '"'


def d_int(value: int) -> str:
    """Render an integer as a D integer literal."""
    if isinstance(value, bool) or not isinstance(value, int):
        raise TypeError(f"expected an integer, got {value!r}")
    return str(value)


def d_bool(value: bool) -> str:
    """Render a boolean as a D boolean literal."""
    if not isinstance(value, bool):
        raise TypeError(f"expected a boolean, got {value!r}")
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
    prefix = INDENT * levels
    return "\n".join(prefix + line if line else line for line in text.split("\n"))


def assert_true(expression: str) -> str:
    """Assert that an expression holds."""
    return f"assert({expression});"


def assert_false(expression: str) -> str:
    """Assert that an expression does not hold."""
    return f"assert(!{expression});"


def assert_eq(actual: str, expected: str) -> str:
    """Assert that two expressions are equal."""
    return f"assert({actual} == {expected});"


def assert_throws(expression: str) -> str:
    """Assert that evaluating an expression throws."""
    return f"assertThrown({expression});"
