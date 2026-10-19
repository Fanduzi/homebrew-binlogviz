cask "binlogviz" do
  version "0.28.0"

  on_macos do
    on_intel do
      sha256 "fa13e3b28d4a366fed12f6a6f7e4638e04bb3c1be025b9ab2b9e250712aa2c1e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.28.0/binlogviz_0.28.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "79098d4429319f4ebe341d366bdf9835d1ea84d9a703d4ab46e7192d486d9993"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.28.0/binlogviz_0.28.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "2eda8a55ee1bc3663100e4370d3dcad19f59576109818ceb561aa22f6c8d797d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.28.0/binlogviz_0.28.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "294cfec6a32f6a8d80f2db3c2acab20ad5b775406083f7b9f56ffc81139655e8"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.28.0/binlogviz_0.28.0_linux_arm64.tar.gz",
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
