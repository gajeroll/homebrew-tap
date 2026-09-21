cask "command-input" do
  version "0.2.0"
  sha256 "e2dee6fe6dfac68254d8e45d79df9dabbc333dbdf8f12d39796c10916ff50998"

  url "https://github.com/gajeroll/command-input/releases/download/v#{version}/CommandInput-#{version}.zip"
  name "Command Input"
  desc "Menu bar app that switches Japanese input modes with single Command taps"
  homepage "https://github.com/gajeroll/command-input"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Command Input.app"

  uninstall quit: "com.gajeroll.commandinput"

  zap trash: "~/Library/Preferences/com.gajeroll.commandinput.plist"
end
