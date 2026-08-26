cask "binlogviz" do
  version "0.22.0"

  on_macos do
    on_intel do
      sha256 "8d361bafba918bd6bfcb511e3fd31e004dbc9c6f40bd2fa21908ad34ead4e192"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.22.0/binlogviz_0.22.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "f7034d80c0167384e48742d2d8c6ad335a0a25a09f68f56d2b505dfc2c04ab9e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.22.0/binlogviz_0.22.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "d7f567aecae83c17c693efe35536b2b86a144142ff6ca057f93bb36f9f23d16a"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.22.0/binlogviz_0.22.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "02f331e3ccb5dee3de65653e1923f6af116d96cf49104574f647779c00c00552"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.22.0/binlogviz_0.22.0_linux_arm64.tar.gz",
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
