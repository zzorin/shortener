# README
Сервис сокращения ссылок. Реализует 3 запроса:
- POST /urls возвращает короткий url (Header: Content-Type:application/json, Body: {"url": "url"})
- GET /urls/:short_url возвращает длинный URL и увеличивает счетчик запросов на 1
- GET /urls/:short_url/stats возвращает количество переходов по URL


Dependencies: postgres-12.17, ruby-2.7.3
Model: Url
  - id: integer,
  - url: string,
  - short_url: string,
  - clicks_counter: integer,
  - created_at: datetime,
  - updated_at: datetime

Run:
  1. bundle install
  2. rails db:prepare
  3. rails s

Specs:
  - bundle exec rspec