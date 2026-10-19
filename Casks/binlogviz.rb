cask "binlogviz" do
  version "0.29.0"

  on_macos do
    on_intel do
      sha256 "ca9cb8d4931040c74fe878095e9ba1982558a6321ccec9b008c67c0f4d42cabf"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.29.0/binlogviz_0.29.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "250ac6ebe170bd08a2acad1bf8e2b3b07149daa48cf0809c019987426d756d0f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.29.0/binlogviz_0.29.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "f408f1948594c22606f177ce658ff3f595e9897880ebd5ad305f8cdfe8f83e68"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.29.0/binlogviz_0.29.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "af1411bfae182c2998a972e96c9448fd291cba1dbcb75f61662bd989b0582573"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.29.0/binlogviz_0.29.0_linux_arm64.tar.gz",
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
