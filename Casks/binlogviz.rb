cask "binlogviz" do
  version "0.42.0"

  on_macos do
    on_intel do
      sha256 "4956fd31d58dd9101d02be8550a315975ac520e305eced63b6790899a041e9d1"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.42.0/binlogviz_0.42.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "e6f8ae0fbcf6640f19e3256ca3086a0bb40d5aa51037e2716d2236530044cab6"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.42.0/binlogviz_0.42.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "eeb90deeed2fbb6b1a56f4b2cd868fd2a94af65bca304dde0bb20293f02311ad"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.42.0/binlogviz_0.42.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "babd250af1c7b5a213cfe9007b3d60b188114355180a83f4fecfc2e5a345e2b9"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.42.0/binlogviz_0.42.0_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
