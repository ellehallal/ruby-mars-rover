# Ruby Mars Rover

## Installation

**Requirements:**

- Ruby v3.1.1 or higher ([documentation](https://www.ruby-lang.org/en/documentation/installation/))
- Bundler gem ([documentation](https://bundler.io/))

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
- Checking the orientation valid (N, S, E or W)
- Checking each direction is valid (L, R or F)

### Parsing Input

- Consider the possibility of whitespace on each input line
