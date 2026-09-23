cask "capsawake" do
  version "0.1.0"
  sha256 "08544744c7b6684b3389e0722080ad53104944cd4510e8faa02010a482b172fa"

  url "https://github.com/gajeroll/capsawake/releases/download/v#{version}/CapsAwake-#{version}.zip"
  name "CapsAwake"
  desc "Menu bar app that turns Caps Lock into a keep-awake switch"
  homepage "https://github.com/gajeroll/capsawake"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "CapsAwake.app"

  # Quit first so the app restores sleep and Energy Mode. The daemon is an
  # SMAppService registration, not a plist under /Library/LaunchDaemons, so
  # boot it out by label and remove the root support directory.
  uninstall quit:   "com.gajeroll.capsawake",
            script: {
              executable: "/bin/sh",
              args:       ["-c", <<~SH],
                launchctl bootout system/com.gajeroll.capsawake.daemon 2>/dev/null || true
                launchctl disable system/com.gajeroll.capsawake.daemon 2>/dev/null || true
                if /usr/bin/pmset -g | grep -q 'SleepDisabled.*1'; then
                  /usr/bin/pmset -a disablesleep 0 || true
                fi
              SH
              sudo:       true,
            },
            delete: "/Library/Application Support/CapsAwake"

  zap trash: "~/Library/Preferences/com.gajeroll.capsawake.plist"
end
