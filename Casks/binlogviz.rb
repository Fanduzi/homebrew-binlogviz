cask "binlogviz" do
  version "0.23.9"

  on_macos do
    on_intel do
      sha256 "6d9d791009c3c36cc55840ac83e5bb648cf6eff3b14d2e70eb68f9ede6b71279"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.9/binlogviz_0.23.9_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "e9222f340c4ffd68e86b48ed05380d490b8d2178073bec8e5e238557a3a1a2cb"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.9/binlogviz_0.23.9_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "8f24f58fcbb0ab4a244891d1233ccc1621ea3d87376b5d888c4afa01ef57c3f7"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.9/binlogviz_0.23.9_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "b712bedb1320a244d32aed437d9f9b5945d4a06771328cf3408c26625e95cdca"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.9/binlogviz_0.23.9_linux_arm64.tar.gz",
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
