cask "evoglyph" do
  version "0.1.0-dryrun.2"
  # version + sha256 are bumped by the app's release pipeline (Scripts/release.sh).
  sha256 :no_check

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
