cask "evoglyph" do
  version "0.2.6"
  # version + sha256 are bumped by the app's release pipeline (Scripts/release.sh).
  sha256 "3c2f05f0d561888e518774c39b1cc6ada00a3430d519334bfa6d7eb4d630b415"

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
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "evoglyph.app"

  zap trash: [
    "~/Library/Application Support/com.eluketronic.evoglyph",
    "~/Library/Caches/com.eluketronic.evoglyph",
    "~/Library/HTTPStorages/com.eluketronic.evoglyph",
    "~/Library/Preferences/com.eluketronic.evoglyph.plist",
    "~/Library/Saved Application State/com.eluketronic.evoglyph.savedState",
  ]
end
