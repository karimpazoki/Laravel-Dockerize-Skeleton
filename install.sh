docker-compose exec app composer i
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan config:cache