## Brief overview

- Project-specific git workflow rule for major feature delivery.
- When a new major feature begins, create a dedicated feature branch before coding.
- When the feature is complete, finalize it with commit(s), push to remote, and open a pull request.

## Major feature start protocol

- Treat any user request framed as a "major feature," "new feature," or milestone-sized change as a branch trigger.
- Before implementation, create a new branch from the current integration base branch (typically `main`):
  - Example: `git checkout -b feature/<short-feature-name>`
- Use a clear, kebab-case branch name that reflects scope.
- Do not implement a major feature directly on `main` or other long-lived shared branches.

## Completion protocol for major features

- When implementation and verification are complete, stage and commit all intended changes with clear commit messages.
- Push the feature branch to remote:
  - Example: `git push -u origin feature/<short-feature-name>`
- Create a pull request from the feature branch into the target base branch.
- Include a concise PR summary covering:
  - What changed
  - Why it changed
  - Any testing/validation performed

## Safety and scope guardrails

- Keep this workflow scoped to major features; minor edits may follow the existing branch if user-directed.
- If repository git state is unavailable (not initialized or remote missing), pause and report the blocker before feature implementation proceeds.
- Avoid bundling unrelated work into the same feature branch or PR.
