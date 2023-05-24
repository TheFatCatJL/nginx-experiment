This example deal with an extremely simple case of running some application containers and exposing NGINX as the reverse proxy (and load-balancer).
Note there is some level of Docker syntax that may not apply to bare-metal / cloud networking in nginx.conf

1. Run
   docker compose up -d
2. Run
   python3 verification.py
