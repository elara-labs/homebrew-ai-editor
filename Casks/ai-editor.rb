# Homebrew Cask — AI Editor (macOS).
#
# This file is the source of truth for the cask formula. The release
# workflow patches it in the tap repo (elara-labs/homebrew-ai-editor)
# on every v* tag — see .github/workflows/release.yml.
#
# Manual edits are usually unnecessary; the auto-bumper updates:
#   - `version` (top-level, line marked CASK_VERSION)
#   - the two per-arch `sha256` lines (marked CASK_SHA_ARM / CASK_SHA_INTEL)
#
# Don't reflow those marker lines — the bumper relies on them.
#
#   brew tap elara-labs/ai-editor
#   brew install --cask ai-editor

cask "ai-editor" do
  arch arm: "arm64", intel: "x64"

  version "0.0.1" # CASK_VERSION

  on_arm do
    sha256 "0000000000000000000000000000000000000000000000000000000000000000" # CASK_SHA_ARM
  end

  on_intel do
    sha256 "0000000000000000000000000000000000000000000000000000000000000000" # CASK_SHA_INTEL
  end

  url "https://github.com/elara-labs/ai-editor/releases/download/v#{version}/ai-editor-#{version}-#{arch}.dmg",
      verified: "github.com/elara-labs/ai-editor/"

  name "AI Editor"
  desc "Free, open-source, IDE-class AI editor with cross-agent collaboration"
  homepage "https://github.com/elara-labs/ai-editor"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "AI Editor.app"

  # Quit the app cleanly before uninstall so SQLite + worker threads
  # have a chance to dispose. The bundle id matches electron-builder's
  # appId in apps/desktop/electron-builder.yml.
  uninstall quit:    "com.elara-labs.ai-editor",
            signal:  ["TERM", "com.elara-labs.ai-editor"]

  zap trash: [
    "~/Library/Application Support/AI Editor",
    "~/Library/Caches/com.elara-labs.ai-editor",
    "~/Library/Logs/AI Editor",
    "~/Library/Preferences/com.elara-labs.ai-editor.plist",
    "~/Library/Saved Application State/com.elara-labs.ai-editor.savedState",
  ]
end
