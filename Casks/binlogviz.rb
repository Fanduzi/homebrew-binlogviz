cask "binlogviz" do
  version "0.23.22"

  on_macos do
    on_intel do
      sha256 "94a08d80ba6680d39e4ffebcddae819555950c15067b043428a8a286410a9fc1"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.22/binlogviz_0.23.22_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "02d2d68c0ff65dc2b0fc763230f69091cbf3d956171a9b3e16b9339d765ebdfa"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.22/binlogviz_0.23.22_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "cadc89991da3346b179a7d38b40fabf11a6730871b7457b1ba99ca6a91e17ba4"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.22/binlogviz_0.23.22_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "fff12351732c2f406948a2f19b8a012dc8b2f7e18fbcd280e1732e576f551149"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.22/binlogviz_0.23.22_linux_arm64.tar.gz",
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
