# README
Сервис сокращения ссылок.
Данный сервис должен реализовывать 3 запроса:
POST /urls (Header: Content-Type:application/json, Body: {"url": "url"})
GET /urls/:short_url возвращает длинный URL и увеличивает счетчик запросов на 1
GET /urls/:short_url/stats возвращает количество переходов по URL


postgres-12.17, ruby-2.7.3

Run:
  bundle install
  rails db:prepare
  rails s

Specs:
  rspec