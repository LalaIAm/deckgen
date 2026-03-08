# System Patterns

## Orchestration Pattern

- Nautex is the source of truth for active work scope.
- Work follows loop: `next_scope` -> set task `In progress` -> implement -> test -> set `Done`.

## Scope Enforcement

- Only modify files explicitly listed in active Nautex tasks.
- Non-focus tasks are context-only until they become in-focus.

## Documentation Pattern

- Memory Bank tracks durable context between sessions.
- Core files must stay aligned with latest Nautex state.

## Current Architecture Direction (from scope)

- Containerized multi-service architecture via Docker Compose.
- Services include database, backend API, backend worker, frontend, and reverse proxy.
- Persistent storage through named volumes.
