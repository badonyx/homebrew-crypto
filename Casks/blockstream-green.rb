cask "blockstream-green" do
  version "1.2.7"
  sha256 "692496addde67c052d1db051498c261dc4528ffc4c9e5de35629d645182d7171"

  url "https://github.com/Blockstream/green_qt/releases/download/release_#{version}/BlockstreamGreen_MacOS_x86_64.zip",
      verified: "github.com/Blockstream/green_qt/"
  name "Blockstream Green"
  desc "Multi-platform, feature-rich Bitcoin and Liquid wallet"
  homepage "https://blockstream.com/green/"

  livecheck do
    url :url
    strategy :github_latest
  end

  container nested: "Blockstream Green.dmg"

  app "Blockstream Green.app"

  zap trash: [
    "~/Library/Application Support/Blockstream",
    "~/Library/Caches/Blockstream",
    "~/Library/Saved Application State/com.blockstream.Green.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
