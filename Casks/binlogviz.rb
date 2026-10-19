cask "binlogviz" do
  version "0.30.0"

  on_macos do
    on_intel do
      sha256 "6f357a0b03852159ec2f3ea36c440e6954b7813c7ea1af757492ff2374bdef32"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.30.0/binlogviz_0.30.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "b2d3303af61989591dced10c16cdf5a14929287d9d784db986897fffb7f770cd"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.30.0/binlogviz_0.30.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "151d1b73cdfdbed250d28075341c1902ffe4a6c1443fc55206bbf0902eb00577"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.30.0/binlogviz_0.30.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "0eb00bc650126c3a9e6c6b29bb1ed0d28b36c47a356a55945cfab4611d73918b"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.30.0/binlogviz_0.30.0_linux_arm64.tar.gz",
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
