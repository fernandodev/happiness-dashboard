Happiness Dashboard
==

Simple project for simple satisfaction poll for your team.

## Installation

```shell
bundle install
cp config/database.yml.sample config/database.yml
rake db:create
```

* This project uses [Dotenv]()
* Use `rake secret` to generate a new secret key and put it into `.env` as `SECRET_KEY_BASE_DEVELOPMENT`, `SECRET_KEY_BASE_TEST` and `SECRET_KEY_DEVISE`

## Testing

## License

Under MIT 2.0