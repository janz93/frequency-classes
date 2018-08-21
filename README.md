# frequency-classes
Searchtool to return words for a specific frequency class

## Features
* Search words to a specific frequency class
* Export the words for a specific frequency class

## Requirements
This project need the following environment in order to run

- Docker version 18.03.0-ce, build 0520e24
- docker-compose version 1.20.1, build 5d8c71b

## Installation
1. `git clone git@github.com:janz93/frequency-classes.git`
2. `cd frequency-classes`
3. `docker-compose build --pull`
3. `docker-compose up`

`docker-compose ps` will tell you, on which local port the application binds.

## Testing
This is a TDD project.

To fight bugs and have best practice code we use:

* [Rspec](https://github.com/seattlerb/minitest)
* [Rubocop](https://github.com/bbatsov/rubocop)
* [Reek](https://github.com/troessner/reek)

Launch tests

    docker-compose build --pull
    docker-compose -f docker-compose.test.yml run --rm web

## Bugs
In case of finding bug:
Please post any bugs, questions, or ideas on our [issues page](https://github.com/janz93/frequency-classes/issues).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
![Creative Commons License](https://i.creativecommons.org/l/by/4.0/88x31.png "CC BY")
This work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).
