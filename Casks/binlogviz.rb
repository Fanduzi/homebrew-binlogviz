cask "binlogviz" do
  version "0.35.1"

  on_macos do
    on_intel do
      sha256 "a14a502e31fcaea50317c8d076ecd245733b07be76c0845c8f6f7dc7f3de7a13"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.1/binlogviz_0.35.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "eec57864ca872301032c9b8b694d9b1bf584b3d07e4d09cad095ffe5552a88ae"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.1/binlogviz_0.35.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "9bebb0f8bd3e2f2d5c82d041a9acd13f665f6fc3d747fffe7c04c75a97556196"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.1/binlogviz_0.35.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "ed2bf1797d5bddbfb1460e60ac82002628711f0f77592c1a04ab9eeb692bb96a"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.35.1/binlogviz_0.35.1_linux_arm64.tar.gz",
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
