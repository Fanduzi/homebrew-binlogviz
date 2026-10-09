cask "binlogviz" do
  version "0.23.29"

  on_macos do
    on_intel do
      sha256 "ca4c0a44dcba9b287a84774cce89568ca3ad5593cadd2f201f6d15a020c0eb96"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.29/binlogviz_0.23.29_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "567cf816950adcee1ba1b36620102cac0a2f59e48fbcf5d623e71cf47580cc57"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.29/binlogviz_0.23.29_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "c30005c4e08c0219be31b52e1bd451a09c62c1c222151b625988abd094dede8c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.29/binlogviz_0.23.29_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "4e8439b2b95038758d3e5766152671c57208b70c8d279656e10264dc8b64e815"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.29/binlogviz_0.23.29_linux_arm64.tar.gz",
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
