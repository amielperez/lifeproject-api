## LifeProject API

Official backend component for [LifeProject](https://github.com/amielperez/lifeproject)

### Requirements
1. Ruby
2. Rails (3+)
3. Mysql

### Installation

Deploy as you would any small-sized rails app; remember to do the following:
1. `mv config/database.template.yml config/database.yml`
2. Edit `config/database.yml` to the correct mysql2 installation
3. Run db migrations
4. **Important:** You need to change the expected origin for CORS in `config/application.rb` (e.g., localhost:5000)
4. `rails s` and enjoy!
