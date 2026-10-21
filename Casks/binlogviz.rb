cask "binlogviz" do
  version "0.35.0"

  on_macos do
    on_intel do
      sha256 "f000364ceb17fc14f575a74514b2cf035182b226e1077a2c34e2784f1ed9200e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.0/binlogviz_0.35.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "a2fde483df031b78d02e58419670b875220c5c1f4d6f4790e35d68cd37c19417"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.0/binlogviz_0.35.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "b5fa8cf370eee14f5cf24c8b2a258cca66404f79cd081f4b1b9c9829e0dc4ff8"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.0/binlogviz_0.35.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "c36591f846e4a4527418898c07d220ef561d7a60b4b1a7c54d159d5c87358737"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.0/binlogviz_0.35.0_linux_arm64.tar.gz",
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
