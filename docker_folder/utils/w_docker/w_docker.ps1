param(
    [string]$COMMAND = $args[0],
    [string]$CONTAINER = $args[1]
)

if (-not $COMMAND) {
    Write-Host "Uso: w_docker COMMAND [CONTAINER]"
    exit 1
}

switch ($COMMAND) {
    "up" {
        docker compose up -d
    }
    "down" {
        docker compose down
    }
   "exec" {
        if (-not $CONTAINER) {
            Write-Host "Uso: w_docker exec CONTAINER"
            exit 1
        }
        
        docker compose exec -t $CONTAINER $args
    }
    "bash" {
        if (-not $CONTAINER) {
            Write-Host "Uso: w_docker bash CONTAINER"
            exit 1
        }
        docker compose exec -t $CONTAINER bash
    }
    default {
        Write-Host "Comando invalido. Comandos validos: {up|down|exec|bash}"
        exit 1
    }
}
