cask "binlogviz" do
  version "0.39.0"

  on_macos do
    on_intel do
      sha256 "5f25bb47b20ae1390e68a3a58d0fe3fec37f61facadb3ae5350dadd9a2b81239"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.39.0/binlogviz_0.39.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "5867c6363d7265c7675a156c7e38d1877232e7e6685961fb9ec79cc32b7bacf3"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.39.0/binlogviz_0.39.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "5a4a9ee20ccbdb7dccfc68f8adb95452f164714da7fb6f5f19cb438df6787883"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.39.0/binlogviz_0.39.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "2d3a8669395fefbd6f7c0e0e6da2b921a2d2e8bbc820d3589a7aa4d09d844f74"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.39.0/binlogviz_0.39.0_linux_arm64.tar.gz",
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
