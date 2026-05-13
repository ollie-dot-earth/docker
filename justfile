# Show this
default: 
  @just --list

# Start all services
start-all: start-essential start-primary-services start-other-services

# Start only the essentials (ddns, caddy)
start-essential:
  cd caddy && docker compose up -d
  # ollie.earth
  cd ddns && docker compose up -d
  # nuv.sh / nuv.direct
  cd porkbun-ddns && docker compose up -d
  # nora
  cd cloudflare-ddns-updater && docker compose up -d

# Start all important services
start-primary-services: start-essential
  cd matrix  && docker compose up -d
  cd eater && docker compose up -d
  cd watchtower && docker compose up -d
  cd woodpecker-ci && docker compose up -d
  cd tangled && docker compose up -d
  cd navidrome && docker compose up -d
  cd git && docker compose up -d
  cd reactive-resume && docker compose up -d

# Start remaining services
start-other-services: start-essential
  cd atuin && docker compose up -d
  cd beszel && docker compose up -d
  cd excalidraw && docker compose up -d
  cd git-migration && docker compose up -d
  cd goatcounter && docker compose up -d
  cd grafana && docker compose up -d
  cd homarr-nora && docker compose up -d
  cd minecraft && docker compose up -d
  cd stirling-pdf && docker compose up -d
