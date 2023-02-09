# PostgREST

## How to run

```bash
./get_keys.sh

docker-compose up -d

TOKEN=$(./get_access_token.sh)

curl http://localhost:3000/todos -X POST \
     -H "Authorization: Bearer $TOKEN"   \
     -H "Content-Type: application/json" \
     -d '{"task": "learn gcp"}'
```