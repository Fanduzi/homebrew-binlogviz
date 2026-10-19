cask "binlogviz" do
  version "0.31.0"

  on_macos do
    on_intel do
      sha256 "bf6f729ee5770d7c9f3f5987666104495e5deccf7fd51f21223a26e4590f4761"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.31.0/binlogviz_0.31.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "072bddcb544da929f4624ca54e827a148fbb1562cc9ec2fe61c575962ed3c85d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.31.0/binlogviz_0.31.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "5a67484eee1e9be1dc8879f49b28bbc4e18b9392bad88d855e65445a9811dd91"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.31.0/binlogviz_0.31.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "f7393660b41b462944ca98a6ca3b3a66dde0d637fe3aa4f248166af1a5943bc9"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.31.0/binlogviz_0.31.0_linux_arm64.tar.gz",
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
