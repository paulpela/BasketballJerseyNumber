![Latest release badge](https://badgen.net/github/release/paulpela/BasketballJerseyNumber) ![Twitter follow badge](https://badgen.net/twitter/follow/paulpela)

# BasketballJerseyNumber

Custom data type for representing basketball player numbers with additional validation rules.

## Basic usage

`init?(number: String)` - initializes correctly with a positive number comprised of one or two digits.

Allowed numbers: 00, 01...09, 0...99.

## Additional validation rules

You can use `init?(number: String, validationRules: Set<JerseyNumberValidationRule>)` to restrict valid numbers.

### `JerseyNumberValidationRule`

`.only0to5` - returns `nil` if `number` contains digits in range of `6...9` in any place

`.doubleZeroNotAllowed` - returns `nil` if `number` is `"00"`

`.noLeadingZeros` - returns `nil` for values like 01...09

## Protocol conformance

Conforms to `Hashable` and `CustomStringConvertible`.
