# Ruby Mars Rover

## Installation

Ruby 3.1.1 or higher is required. Please refer to the Ruby installation documentation [here](https://www.ruby-lang.org/en/documentation/installation/).

Clone this repo, and run:

```
bundle install
```

## Start

To start the app with the sample instructions (located in `./lib/input.txt`) run:

```
ruby lib/main.rb
```

## Testing

The testing library used is [RSpec](https://rspec.info/). To run the tests:

```
rspec
```

### Test Coverage

In the terminal run `rspec` to generate the report, then run `open coverage/index.html` to open the report in the browser.

## Linting

The linter used is [Rubocop](https://rubocop.org/). Run:

```
rubocop
```

## Next Steps

### Input Validation

- Checking the coordinate values are 50 or less
- Checking the instruction strings are less than 100 characters in length
- Checking the orientation is either N, S, E or W
- Checking each direction is either L, R or F

### Refactoring

- Renaming some methods and variables to be clearer
