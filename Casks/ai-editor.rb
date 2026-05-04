# Homebrew Cask — AI Editor (macOS).
#
# This file is the source of truth for the cask formula. To make
# `brew install --cask ai-editor` work for end users, copy or
# symlink this file into the official tap repo:
#
#   1. Create a tap repo named  elara-labs/homebrew-ai-editor
#   2. Place this file at        Casks/ai-editor.rb
#   3. Users then run:
#        brew tap elara-labs/ai-editor
#        brew install --cask ai-editor
#
# Per-release maintenance:
#   - bump `version` to the released tag (without leading "v")
#   - replace `:no_check` with the SHA-256 of the dmg per arch
# A small CI step in .github/workflows/release.yml can patch this
# file in the tap repo automatically on each tag push.

cask "ai-editor" do
  arch arm: "arm64", intel: "x64"

  version "0.0.1"
  sha256 :no_check

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
