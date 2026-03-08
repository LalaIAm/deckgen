# Tech Context

## Environment

- OS: Windows 11
- Working directory: `c:/Users/lthor/OneDrive/amor-fati-img/deckgen`
- IDE: Visual Studio Code

## Tooling

- Nautex available via MCP tools (`status`, `next_scope`, `update_tasks`).
- Nautex version reported: `0.3.4`.

## Current Delivery Stack (target from active task scope)

- Docker Compose orchestration.
- Postgres service.
- Backend API service (Python / Uvicorn command expected by scope).
- Backend worker service (Python worker command expected by scope).
- Frontend service.
- Nginx service.

## Operational Constraints

- Do not edit `.nautex/` files.
- Use Nautex tasks as source of truth for implementation sequence and file scope.
