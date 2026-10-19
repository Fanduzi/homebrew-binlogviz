cask "binlogviz" do
  version "0.30.0"

  on_macos do
    on_intel do
      sha256 "03ea98c11c33e637569cb30a3ec6b43351801ee48dbb993a408184bf4c6503a0"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.30.0/binlogviz_0.30.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "8f883c9216636830bdc13d9a8d65ed5ba77a03cb4c4ee67993b03f633dd7aaf8"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.30.0/binlogviz_0.30.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "bb03a8b3ca146c363dcc6df545d8700b83427011684ebf61081e1cb9d7407f4d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.30.0/binlogviz_0.30.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "ad1c24a816dbb62dc1e487dea3e0bc72af4bc4113fc5d6815e320e74276b8b63"
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
