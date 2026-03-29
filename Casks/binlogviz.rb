cask "binlogviz" do
  version "0.5.2"

  on_macos do
    on_intel do
      sha256 "f5775f508a8085d3b6d8a9e375423db9b2e7adf80ba77e1d500c0a3023381205"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.5.2/binlogviz_0.5.2_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "76dcff0a06efbd98b672f9c5aa004ba0ae3db312acb758601201d7d571d4da95"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.5.2/binlogviz_0.5.2_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "42e4d8bdf4a27c9c60f6b16a9be94ffd33c2490f85201e9b224b304baeeb66af"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.5.2/binlogviz_0.5.2_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "5ee55f76b4270c32c8ca9843e24b4c31fea2fb449fc98b835d4c5488a73cd390"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.5.2/binlogviz_0.5.2_linux_arm64.tar.gz",
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
