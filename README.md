# homebrew-ai-editor

Homebrew tap for [AI Editor](https://github.com/elara-labs/ai-editor) — a free,
open-source, IDE-class AI editor that lets every coding agent you've installed
work together on your code, without ever leaving your machine.

## Install

```sh
brew tap elara-labs/ai-editor
brew install --cask ai-editor
```

## Updating

The cask is auto-bumped per release. If you need to manually refresh:

```sh
brew update
brew upgrade --cask ai-editor
```

## Notes

- The macOS `.dmg` is currently unsigned — Gatekeeper will warn on first launch.
  Right-click the app → Open → Open to bypass. Apple notarization lands once the
  project graduates from MVP.
- Source of truth for the cask formula lives in the main repo at
  [`Casks/ai-editor.rb`](https://github.com/elara-labs/ai-editor/blob/main/Casks/ai-editor.rb).
  This tap repo is a publication target; PRs against the cask should go to the
  main repo.

## License

Apache-2.0 — same as AI Editor.
