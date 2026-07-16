cask "evoglyph" do
  version "0.2.21"
  # version + sha256 are bumped by the app's release pipeline (Scripts/release.sh).
  sha256 "724f295302b3ede8da7aa3699a2d44119c02f8cfad5127aab974923f40e3037d"

  url "https://downloads.evoglyph.com/evoglyph-#{version}.zip"
  name "evoglyph"
  desc "Local-first, on-device dictation app"
  homepage "https://evoglyph.com/"

  livecheck do
    url "https://downloads.evoglyph.com/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  # The app's LSMinimumSystemVersion is 14.2 (evoglyph#3194): LaunchServices refuses to
  # launch it on macOS 14.0/14.1. `depends_on macos:` only accepts whole major versions
  # (a ">= 14.2" point floor raises MacOSVersion::Error, and the string comparison forms
  # are deprecated), so this stanza declares the strongest expressible floor (>= Sonoma
  # on Homebrew >= 5.1.11, where a bare symbol means ">=") and the preflight block below
  # hard-stops the remaining 14.0/14.1 gap.
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "evoglyph.app"

  preflight do
    if MacOS.full_version < "14.2"
      raise "evoglyph requires macOS 14.2 or later; this Mac is on macOS #{MacOS.full_version}."
    end
  end

  zap trash: [
    "~/Library/Application Support/com.eluketronic.evoglyph",
    "~/Library/Caches/com.eluketronic.evoglyph",
    "~/Library/HTTPStorages/com.eluketronic.evoglyph",
    "~/Library/Preferences/com.eluketronic.evoglyph.plist",
    "~/Library/Saved Application State/com.eluketronic.evoglyph.savedState",
  ]
end
