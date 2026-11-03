cask "binlogviz" do
  version "0.41.0"

  on_macos do
    on_intel do
      sha256 "e60e4d66d4e300d3f2e8deab1ec5162e3f8c3d7c7321bf19cc9ec40c086b4f6f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.41.0/binlogviz_0.41.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "b0781afa0718743941162609f1097993cdaa96ad1c7f6e82493c7db9c2f75557"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.41.0/binlogviz_0.41.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "7580d3d45f8f3b787ea694953531add1abf5227c3f59fbd8fd1226b46c861be3"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.41.0/binlogviz_0.41.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "cff4bf095f2848c23d849cf3379feca392a13672a901b98cfa7bc714e625bb68"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.41.0/binlogviz_0.41.0_linux_arm64.tar.gz",
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
